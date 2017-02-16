clear all
close all
clc
% %-----------------------------------------------------------------------------------------------------
% Load the PET Image
% %-----------------------------------------------------------------------------------------------------
sxy = 336; % Dimensions for the PET Image
sz = 110;
% %-----------------------------------------------------------------------------------------------------
fid=fopen('/Users/Research_Macbook/Desktop/MATLAB_MRGLu.img'); 
MRGlu_img = fread(fid,'float32');
MRGlu_img = reshape(MRGlu_img, sxy,sxy,sz);
fclose(fid);
% %-----------------------------------------------------------------------------------------------------
fid=fopen('/Users/Research_Macbook/Desktop/Benveniste_PMOD_Test/4/Subject4-PXMOD-Mask.img'); 
Mask_img = fread(fid,'float32');
Mask_img = reshape(Mask_img, sxy,sxy,sz);
fclose(fid);
% %-----------------------------------------------------------------------------------------------------
fid=fopen('/Users/Research_Macbook/Desktop/Benveniste_PMOD_Test/4/Subject4-PXMOD-Graham-2002_MRGlu.img'); 
PMOD_img = fread(fid,'float32');
PMOD_img = reshape(PMOD_img, sxy,sxy,sz);
fclose(fid);
% %-----------------------------------------------------------------------------------------------------
MRGlu_img_p=zeros(sxy,sxy,sz);
PMOD_img_p=zeros(sxy,sxy,sz);
output_=zeros(sxy,sxy,sz);

MRGlu_img_p(1:sxy,1:sxy,1:sz) = MRGlu_img(1:sxy,1:sxy,1:sz) .* Mask_img(1:sxy,1:sxy,1:sz);
PMOD_img_p(1:sxy,1:sxy,1:sz) = PMOD_img(1:sxy,1:sxy,1:sz) .* Mask_img(1:sxy,1:sxy,1:sz);


output_(:,:,:)=100*abs(rdivide((MRGlu_img_p(:,:,:)-PMOD_img_p(:,:,:)),PMOD_img_p(:,:,:)));

% %-----------------------------------------------------------------------------------------------------
fid = fopen('/Users/Research_Macbook/Desktop/Subject4_PD.img','w');
fwrite(fid,output_,'float32');
fclose(fid);
% %-----------------------------------------------------------------------------------------------------





