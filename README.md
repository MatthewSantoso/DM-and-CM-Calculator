# DM-and-CM-Calculator
***Macroporosity and Macrovoid Count Density Calculator***

Authors: Matthew S. Santoso, Alexander T. Bridge, Alexander V. Hillsley, Joan F. Brennecke, and Benny D. Freeman

Details about computational flow and code can be found in "Rapid macrovoid characterization in membranes prepared via nonsolvent-induced phase separation: a comparison between 2D and 3D techniques".

**Requirements:**
- MATLAB R2021a
- Image Processing Toolbox
- Computer Vision Toolbox

**Notes:**
- Use TIF or TIFF images for DM and CM values and full functionality.
- PNG and JPG images require manual retrieval of image scale for CM and Shrinkage calculations.
- Automated retrieval of image scale has only been tested with SEM images from an FEI Quanta 650 ESEM

# File/Folder Descriptions
- DM_CM_Calculator_SourceCode.mlapp:
  - Source code for DM and CM Calculator App, open through MATLAB "Design App" button under the "Apps" tab
- DM & CM Calculator.mlappinstall:
  - DM & CM Calculator App installer. Download and use "Install App" button under the "Apps" tab to install.
- DM & CM Calculator.prj:
  - Matlab prj file to help with compiling the app installer.
- test_images:
  - Contains samples of some of the idealized and real membrane cross sections used in the paper.
