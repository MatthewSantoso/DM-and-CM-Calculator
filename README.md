
# DM-and-CM-Calculator, Surface Branch
***Porosity, Pore Count Density, Pore Size Distributions Calculator***

Author: Matthew S. Santoso

# Differences from main branch:
- New filters to help remove micropores are implemented. 
	- None: no filters, results in same masks as main branch.
	- Percentage: removes all pores smaller than half a standard deviation above the average pore size
	- Size: only keeps the largest 60 pores, or the largest 5% of the pores, whichever results in smaller number of pores. 
- Some UI improvements to make it less laggy and easier to use
- Added new buttons to make copying [DM, CM, Shrinkage] values for FMTM or FATM to the clipboard, for pasting in that order in Excel.
- Added new button to enable copying of pore distribution (in microns^2) of FATM and FMTM so when you paste it in excel, it's a single column
- Added new toggle to enable toggling between copying FATM/FMTM data with same button. Colors update to match the normal FATM/FMTM colors.
- Added new keystroke options to help guarantee functionality:
	- pressing 'o': same as pressing the "Load Image" button
	- pressing 'return' or 'enter': same as pressing the "Analyze" button
	- pressing 'r': reenables all disabled panels/functions
	- pressing 'p': same as pressing the "Open Painter" button
	- pressing 'c': same as pressing the "Copy FATM/FMTM button"
	- pressing 'a': prints the area of the membrane in square-micrometers to the MATLAB command line
	- pressing 's': shows the skeletonized version of the FATM and FMTM.
- Added OCR capability for manual resolution's length of the line numbers.
- Added new panel for skeletonizing capability:
	- CANNOT CHANGE THICKNESS OF SKELETONS
	- Has button for copying pore distributions of both FATM and FMTM skeletons.
	- Shows yellow dots on all the pores it calculates on FATM/FMTM skeletons, the FMTM dots on the grayscale and the FMTM itself.
- Removes all duplicate values in the pore distributions as they're likely to be just noise. ex: A = [1 2 2 3] --> [1 2 3]
- Can auto pull pixel-to-meter data from SEM metadata from: FEI Quanta 650 ESEM, Apreo 2C LoVac SEM, and Zeis Crossbeam 550 FIB-SEM
# Descriptions:

**Requirements: **
- MATLAB R2023a
- Image Processing Toolbox
- Computer Vision Toolbox

**Notes:**
- Use TIF or TIFF images for DM and CM values and full functionality.
- PNG and JPG images can be processed for DM values only. Saving of binary masks is not possible with these image types.
- Macrovoid count density (CM) functionality is only tested with SEM images from an FEI Quanta 650 ESEM

**File/Folder Descriptions**
- DM_CM_Calculator_Experimental_SourceCode.mlapp:
  - Source code for DM and CM Calculator App, open through MATLAB "Design App" button under the "Apps" tab
- DM & CM Calculator Experimental.mlappinstall:
  - DM & CM Calculator App installer. Download and use "Install App" button under the "Apps" tab to install.
- DM & CM Calculator Experimental.prj:
  - Matlab prj file to help with compiling the app installer.
- MicroporePoreDist.m:
  - Matlab file for calculating pore distributions. Get the cropped grayscale image from the app by clicking analyze, then run this script.
- testingMicroporePoreDist.mat
  - File with some a sample image for developing pore distributions. Based from 15% PSF/THF in EtOH quench, #001.
- test_images:
  - Contains samples of some of the idealized and real membrane cross sections used in the paper.
