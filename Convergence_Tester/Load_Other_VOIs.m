clear all;
close all;
clc;

% %-----------------------------------------------------------------------------------------------
% % This file does not need to be adjusted, just run it
% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------
sxy = 344;      % This sets the image size
sz = 127;    
% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------
M_Folder = pwd;
% %-----------------------------------------------------------------------------------------------
% %                                    Automaatically setting VOI Directory
% %-----------------------------------------------------------------------------------------------
cd VOIs
VOI_Folder = pwd;   
% %-----------------------------------------------------------------------------------------------
% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(VOI_Folder, '*.v'); 
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(VOI_Folder, baseFileName);
  fprintf(1, 'Now reading %s \n ', fullFileName);
  fid = fopen(fullFileName);
      VOI=fread(fid,'float32');
      fclose(fid);
      BR_array_bank{k}=reshape(VOI,sxy,sxy,sz);
end
cd ..
cd Reference_Image
Ref_Folder = pwd;
% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(Ref_Folder, '*.v'); 
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(Ref_Folder, baseFileName);
  fprintf(1, 'Now reading %s \n ', fullFileName);
  fid = fopen(fullFileName);
      ref_img=fread(fid,'float32');
      fclose(fid);
end


% %-----------------------------------------------------------------------------------------------
cd (M_Folder)
% %-----------------------------------------------------------------------------------------------
