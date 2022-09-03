% For micropore distributions
% use the app to get the FMTM, FATM, and grayscale cropped exported to
% workspace, this will pick those up and continue on.
clear; clc; close all;
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
i = 1;
c = 1;
tileSize = tileSize-1;
while i < max(s) - tileSize
    j = 1;
    while j < max(s) - tileSize
        tile = sq_img(i:i+tileSize, j:j+tileSize);
        allTiles(:,:,c) = tile;
        j = j+tileSize;
        c = c+1;
    end
    i = i+tileSize;
end
% check if tiles are correct, color will be off.
%combTiles = imtile(allTiles, 'GridSize', [max(s)/(tileSize+1) max(s)/(tileSize+1)]);
s = size(allTiles);
for i = 1:s
    cTile = allTiles(:,:,i);
    if(sum(sum(cTile)) == 0)
        continue;
    end
    thres = adaptthresh(cTile, ...
                'Statistic',"median", ...
                'ForegroundPolarity', 'bright',...
                "NeighborhoodSize", 21);
    imBW = imbinarize(cTile, 20);
%     imshow(imBW);
%     pause(0.05);
end
%  GOT TO FIX THIS BINARIZATION
