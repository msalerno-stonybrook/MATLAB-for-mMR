clear all;
close all;
clc;
% %-----------------------------------------------------------------------------------------------
% This script can be used to perform matrix operations on sinograms and
% images.  It can also be used to create data filled with all of the same
% number
% %-----------------------------------------------------------------------------------------------
Math_or_createDate = 0; % 0 = math, 1 = create data
                        % Note: create data only create one file at a
                        % time
% %-----------------------------------------------------------------------------------------------
Sinogram_or_Image = 1;  % 0 = sinogram, 1 = image
    Set_Span = 11;  % 1 = span 1, 11 = span 11, this can be on for images
% %-----------------------------------------------------------------------------------------------
% %                                     MAKE DATA
% %-----------------------------------------------------------------------------------------------
Make_Data_fill = 1; % Select the value you would like to fill the matrix with
% %-----------------------------------------------------------------------------------------------


% %-----------------------------------------------------------------------------------------------
% %                                        MATH
% %-----------------------------------------------------------------------------------------------
One_file = 0;         % FOR MATRIX MATH ON ONE DATASET: 1 = one file, 0 = more than 1 file

    Scalar1 = 10000;  % Can only be used on one file with Operations_switch 1-4.  This will perform the selected matrix operation (Operation switch) on the file
                      % with Scalar1
                      
Number_of_files = 4;  % 2 = 1 to 1 operation, 3 = 3 to 1 operation, etc. up to 10 files.  File 1 is the reference image.
                      % Note: must be >=2, unless using Poisson Random number generator
                                           
Operation_switch = 5; % 1 = add, 2 = subtract, 3 = multiply, 4 = divide, 5 = quick percent difference 
                      % 6 = save percent difference, 
                      % 7 = Poisson Random Number Generator the poisson random number generator will only operate on file 1
                      % but will create # of noise relizations = Number_of_files
% %-----------------------------------------------------------------------------------------------
PD_slice = 70; % Select slice for percent difference, or range of slices ex: 1:127 - this is used for Operation_switch 5
    neg_lim = -100;      % Set negative limit for percent difference
    pos_lim = 100;       % Set positive limit for percent difference
% %-----------------------------------------------------------------------------------------------
% Note: you only need to name the File's your using
output_folder = '/Users/Research_Macbook/Documents/MATLAB/Matrix_Math/output';
File1 = '/Users/Research_Macbook/Documents/MATLAB/Image_Stitch/output/Input-LM-00-umap-CT.v';   % File1 also serves as the reference image
% File1 = '/Users/Research_Macbook/Documents/MATLAB/Image_Stitch/input/Input-LM-00-umap-DIX.v';
% %-----------------------------------------------------------------------------------------------
File2 = '/Users/Research_Macbook/Documents/MATLAB/Image_Stitch/input/Input-LM-00-umap-DIX.v'; 
% %-----------------------------------------------------------------------------------------------
File3 = '/Users/Research_Macbook/Documents/MATLAB/Image_Stitch/input/example_2Images/Input-LM-00-umap-UTE.v';
File4 = '/Users/Research_Macbook/Documents/MATLAB/Image_Stitch/input/example_2Images/Input-LM-00-umap-MPRAGE.v';
% %-----------------------------------------------------------------------------------------------
File5 = '/Users/Research_Macbook/Desktop/stir_test2/Input-LM-00/acf_00.a';
File6 = '/Users/Research_Macbook/Desktop/stir_test2/Input-LM-00/acf_00.a';
File7 = '/Users/Research_Macbook/Desktop/stir_test2/Input-LM-00/acf_00.a';
File8 = '/Users/Research_Macbook/Desktop/stir_test2/Input-LM-00/acf_00.a';
File9 = '/Users/Research_Macbook/Desktop/stir_test2/Input-LM-00/acf_00.a';
File10 = '/Users/Research_Macbook/Desktop/stir_test2/Input-LM-00/acf_00.a';
% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------






















% %--------------------------------------------------------------------% %
cd Scripts
if Math_or_createDate == 1
    MakeData_v1_0
end
if Math_or_createDate == 0
    Matrix_Math_v1_0
end