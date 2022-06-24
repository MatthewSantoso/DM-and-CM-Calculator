
# DM-and-CM-Calculator, Experimental Branch
***Macroporosity and Macrovoid Count Density Calculator-EXPERIMENTAL***

~Contains experimental features and algorithms. MAY BE BUGGY (or better) ¯\_(ツ)_/¯

Authors: Matthew S. Santoso, Alexander T. Bridge, Alexander V. Hillsley, Joan F. Brennecke, and Benny D. Freeman

# Differences from main branch:
- New filters to help remove micropores are implemented. 
	- None: no filters, results in same masks as main branch.
	- Percentage: removes all pores smaller than half a standard deviation above the average pore size
	- Size: only keeps the largest 60 pores, or the largest 5% of the pores, whichever results in smaller number of pores. 
- Some UI improvements to make it less laggy and easier to use
- ~~New slider to enable manipulation of neighborhood size for adaptive thresholding.~~ (Implemented in main)
- New visualization of painter drawings. Now the mask can be overlayed on the grayscale so you can see what's wrong better. Enabled by a toggle button.
- CM is calculated slightly differently so there won't be negative CM values.
- Shrinkage % is now reported. The thickness of the membrane is the minimum Feret diameter of the binary mask. Cannot be calculated for "No Top" membranes. 
- Added new buttons to make copying [DM, CM, Shrinkage] values for FMTM or FATM to the clipboard, for pasting in that order in Excel.
- Added new button/edit field to allow for different nominal membrane thicknesses for shrinkage calculation.

# Descriptions:

**Requirements: **
- MATLAB R2021a
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
- test_images:
  - Contains samples of some of the idealized and real membrane cross sections used in the paper.
