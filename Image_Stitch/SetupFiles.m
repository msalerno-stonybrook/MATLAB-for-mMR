clear all;
close all;
clc;
% %--------------------------------------------------------------------% %
% This script is used to stitch together two images for the mMR or 3 images
% for the inveon.  
%  - mMR: Used to extend CT-based umap to match the mMR.  You must specify
%         the SLICE NUMBER where the mMR umap extension before running.  You 
%         can find the slice number by opening the mMR and CT Umap with the
%         PMOD fusion tool and finding the last slice (z) where the CT and
%         mMR are complete (in other words, the last full slice of the CT
%         image after it has been registered to the mMR umap)
%  - Inveon Pigeon Data: Used to create a 3D whole body image for Pigeon scans.  The
%            whole bird can be scanned with 3 bed positions - each bed
%            position is shifted 10cm from the previous bed position.
%          - You must specify if the first image is inverted.  Due to
%          the work around because of the faulty PET bed, if you perform
%          AC on the image it will also flip the image. 
%          - This code assumes the 2nd and 3rd bed position images are static
% %--------------------------------------------------------------------% %
Inveon_Pigeon_switch = 0; % 1 = Using Inveon Pigeon data, 0 = Using other data
frame_num = 41;    % This is only used for Inveon Pigeon data.  Set this to the TOTAL NUMBER OF FRAMES
% IMAGE1 = 'BP1.img';
% IMAGE2 = 'BP2.img';
IMAGE1 = 'CT_Umap_registered.img';   % Registered CT Umap/Input image 1.  Must be placed in input directory
IMAGE2 = 'Input-LM-00-umap-DIX.v';   % MR Umap/ Input image 2.  Must be placed in input directory
% %-----------------------------------ONLY FOR CT UMAP EXTEND---------------------------------------------------------
CT_Umap_Switch = 1; % Removes the bed through gaussian blurr and thresholding and and extends attenuation map for mMR
% %-----------------------------------ONLY FOR PIGEON--------------------------------------------------------------
IMAGE3 = 'BP3.img';  % This is for the Inveon scanner.  AC images and NAC images have different orientations
Invert_BP = 3;  % 0 = Invert all bed postions, 1 = Invert the first bed position only, 
                % 2 = Don't invert bed positons, 3 = Invert the first bed position first, then invert all bed positions again
% %-------------------------------------------------------------------------------------------------------------------
% If the images are not from the Inveon, adjust this.  Inveon dimensions are hard-coded
sxy = 344;
sz = 127;
slice_f = 98;  % Choose the last complete CT slice (z) ***  Use ImageJ to find it
% %--------------------------------------------------------------------% %

cd Scripts
ImageStitch_v1_0