% %-----------------------------------------------------------------------------------------------
% Check to make sure that folder actually exists.  Warn user if it doesn't.
if ~isdir(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist: \n %s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end
if Compare_Switch == 2
    if ~isdir(myFolder2)
      errorMessage = sprintf('Error: The following folder does not exist: \n %s', myFolder2);
      uiwait(warndlg(errorMessage));
      return;
    end
end
% %-----------------------------------------------------------------------------------------------
% %----------------------------------IMPORT FOR 1 IMAGE SET---------------------------------------
% %-----------------------------------------------------------------------------------------------
if Compare_Switch == 1
% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(myFolder, '*.v'); 
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s \n ', fullFileName);
  fid = fopen(fullFileName);
      img{k}=fread(fid,'float32');
      fclose(fid);
      img{k}=reshape(img{k},sxy,sxy,sz);
      %cd Scripts
        Run_Calculations_v1_0
      %cd ..
end
TA_matrix{1}=tempTA_matrix;
end
% %-----------------------------------------------------------------------------------------------
% %----------------------------------IMPORT FOR 2 IMAGE SETS--------------------------------------
if Compare_Switch == 2
% %-----------------------------------------------------------------------------------------------
% %------------------------------------------IMAGE 1----------------------------------------------
  img_matrix={{0},{0}};  
% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(myFolder, '*.v'); 
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s \n ', fullFileName);
  fid = fopen(fullFileName);
      img{k}=fread(fid,'float32');
      fclose(fid);
      img{k}=reshape(img{k},sxy,sxy,sz);
      Run_Calculations_v1_0
end
TA_matrix{1}=tempTA_matrix;
% %------------------------------------------IMAGE 2----------------------------------------------
% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(myFolder2, '*.v'); 
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(myFolder2, baseFileName);
  fprintf(1, 'Now reading %s \n ', fullFileName);
  fid = fopen(fullFileName);
      img{k}=fread(fid,'float32');
      fclose(fid);
      img{k}=reshape(img{k},sxy,sxy,sz);
% %-----------------------------------------------------------------------------------------------
      Run_Calculations_v1_0
% %-----------------------------------------------------------------------------------------------
end
TA_matrix{2}=tempTA_matrix;
end
% %-----------------------------------------------------------------------------------------------
% %----------------------------------------PLOT---------------------------------------------------
%cd Scripts
    Plot_results
cd ..