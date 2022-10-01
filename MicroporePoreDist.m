% For micropore distributions
% use the app to get the FMTM, FATM, and grayscale cropped exported to
% workspace, this will pick those up and continue on.
clear; close all;
colormap("gray");
%% import images
load("testingMicroporePoreDist.mat"); %loads all these variables for testing
global global_FMTM; %binary FMTM
global global_FATM; %binary FATM
global global_cropGray; %manually cropped grayscale
imgFMTM = global_FMTM;
imgAuto = global_FATM;
imgOrig = global_cropGray;
%% Make square tiles from grayscale
s = size(imgOrig);
padder = zeros(max(s)-min(s), max(s));
sq_img = vertcat(imgOrig, padder); %now we have a square image for ez tiles
% will need tiles 96 wide. need to manually find this with help of this code: 
% t = sqrt(divisors(max(s)^2));
tileSize = 96;
allTiles = zeros(tileSize, tileSize, (max(s)^2/tileSize^2));
binTiles = zeros(tileSize, tileSize, (max(s)^2/tileSize^2));
i = 1;
c = 1;
tileSize = tileSize-1;
while i < max(s) - tileSize
    j = 1;
    while j < max(s) - tileSize
        tile = sq_img(i:i+tileSize, j:j+tileSize);
        tile = adapthisteq(tile, 'NumTiles', [2 2] ...
                           , 'NBins', 10000 ...
                           , 'ClipLimit', 1 ...
                           ,'Distribution', 'exponential', 'Alpha', 0.9);
        allTiles(:,:,c) = tile;
        j = j+tileSize;
        c = c+1;
    end
    i = i+tileSize+1;
end
allTiles = allTiles/256;
% check if tiles are correct, color will be off.
figure;
combTiles = imtile(allTiles, 'GridSize', [max(s)/(tileSize+1) max(s)/(tileSize+1)]);
imshow(combTiles);
imshow(adapthisteq(combTiles));
%% Binarize these tiles
s = size(allTiles);
figure;
for i = 1:s(3)
    cTile = allTiles(:,:,i);
    if(sum(sum(cTile)) == 0)
        continue;
    end
    thres = adaptthresh(cTile, ...
                'Statistic',"median", ...
                'ForegroundPolarity', 'bright',...
                "NeighborhoodSize", 41);
    imBW = imbinarize(cTile, thres);
%     imBW = bwareafilt(~imBW, 4);
%     imshow(~imBW);
    binTiles(:,:,i) = imBW;
end
%% Combine binarized tiles back
s = size(imgOrig);
figure;
bincombTiles = imtile(binTiles, 'GridSize', [max(s)/(tileSize+1) max(s)/(tileSize+1)]);
bincombTiles = bwareafilt(~bincombTiles, 200);
imshow(~bincombTiles);
disp("done");
disp("----");

%% Getting unique elements in array
A = [1 1 2 2 3 3 3 4];
[U, I] = unique(A, 'first'); 
% U is basically set(A)
% I is the index of the first elements in A that are unique
x = 1:length(A);
x(I) = [];