# DM-and-CM-Calculator
Macroporosity and Macrovoid Count Density Calculator-EXPERIMENTAL

Authors: Matthew S. Santoso, Alexander T. Bridge, Alexander V. Hillsley, Joan F. Brennecke, and Benny D. Freeman

Requirements: 
- MATLAB R2021a
- Image Processing Toolbox
- Computer Vision Toolbox

Differences from main branch:
- New filters to help remove micropores are implemented. 
- Some UI improvements to make it less laggy and easier to use

Notes:
- Use TIF or TIFF images for best results, PNG is essentially only for testing idealized membrane cross sections.
- Macrovoid count density (CM) functionality is only tested with SEM images from an FEI Quanta 650 ESEM

File/Folder Descriptions:
- DM_CM_Calculator_SourceCode.mlapp:
  - Source code for DM and CM Calculator App, open through MATLAB "Design App" button under the "Apps" tab
- DM & CM Calculator.mlappinstall:
  - DM & CM Calculator App installer. Download and use "Install App" button under the "Apps" tab to install.
- DM & CM Calculator.prj:
  - Matlab prj file to help with compiling the app installer.
- test_images:
  - Contains samples of some of the idealized and real membrane cross sections used in the paper.
