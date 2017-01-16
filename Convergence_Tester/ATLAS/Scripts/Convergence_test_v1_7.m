add_data = Plot_FBP_data + Plot_ATLASref_data + Average_All_Noise_Realizations;
% %-----------------------------------------------------------------------------------------------
d = 0;
if Plot_FBP_data == 1
    for q = 1 : num_iter_imgs
        FBP_array{q}=FBP_noiseless_img;
    end
    img_set_name = horzcat('FBP',img_set_name);
    d=d+1;
end
if Plot_ATLASref_data == 1
    for q = 1 : num_iter_imgs
        ATLAS_array{q}=ref_img;
    end
    img_set_name = horzcat('ATLAS',img_set_name);
    d=d+1;
end
if Plot_with_Noise_Realizations == 1
    img_set_name = horzcat('Average Noise',img_set_name);
    d=d+1;
end
% %-----------------------------------------------------------------------------------------------
BR_start=1; %start at first brain region in BR_array.  Used so that you can choose BR's later
for i = 1 : length(img_set_name)
    img_set_names{i}=strcat(' - ', img_set_name);
end %end of i loop
% %-----------------------------------------------------------------------------------------------
% %                                 SETUP CUSTOM X-AXIS
% %-----------------------------------------------------------------------------------------------
custom_iter2(1:length(custom_iter)-1)=custom_iter(2:length(custom_iter));
% %-----------------------------------------------------------------------------------------------
myFolders_bank = {myFolder, myFolder1, myFolder2, myFolder3, myFolder4, myFolder5, myFolder6, myFolder7, myFolder8, myFolder9, myFolder10, myFolder11};
for i = 1 : num_img_set
    myFolders{i}=myFolders_bank{i};
end
% %-----------------------------------------------------------------------------------------------
% %                              IMPORT BRAIN REGIONS LISTS
% %-----------------------------------------------------------------------------------------------
BR_num_q = zeros(length(BR_num));
for k = 1 : length(BR_num)
        BR_num_q(k) = BR_num{k};
end
% %-----------------------------------------------------------------------------------------------
Brain_Regions_v1_2
% %-----------------------------------------------------------------------------------------------
for i = 1 : length(BR_array_all)
    BR_increment{i} = 1;
    BR_select2{i} = 1;
end
% %-----------------------------------------------------------------------------------------------
for i = 1 : num_img_set
% Check to make sure that folder actually exists.  Warn user if it doesn't.
    if ~isdir(myFolders{i})
      errorMessage = sprintf('Error: The following folder does not exist: \n %s', myFolders{i});
      uiwait(warndlg(errorMessage));
      return;
    end
end
% %-----------------------------------------------------------------------------------------------
% %                            GET FILES AND CREATE PLACEHOLDER ARRAYS
% %-----------------------------------------------------------------------------------------------
for i = j : inc_num : end_iter
    Avg_all_img{i}=zeros(sxy,sxy,sz);
end

for i = 1 : num_img_set
% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(myFolders{i}, '*.v'); 
theFiles = dir(filePattern);
n=1;
for k = j : inc_num : end_iter
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(myFolders{i}, baseFileName);
  fprintf(1, 'Now reading %s \n ', fullFileName);
  fid = fopen(fullFileName);
      img{n}=fread(fid,'float32');
      fclose(fid);
      img{n}=reshape(img{n},sxy,sxy,sz);
      if i==1
      else
        Avg_all_img{k}(:,:,:)=Avg_all_img{k}(:,:,:)+img{n}(:,:,:);
      end
      TA_matrix(n)=0;
      TAR_matrix(n)=0;
      AAR_matrix(n)=0;
      SDR_matrix(n)=0;
      PDref_matrix(n)=0;
      PDFBP_matrix(n)=0;
      Iteration_m(n)=k;
      n=n+1;
end
n=1;
for k = j+inc_num : inc_num : end_iter
    Iteration_q(n)=k;
    n=n+1;
end
for k = 1 : length(img)-1
  PD_matrix(k)=0;
end
% %-----------------------------------------------------------------------------------------------
% %                   BUILD MATRIX CONTAINING ALL OF THE EMPTY ARRAYS CREATED 
% %-----------------------------------------------------------------------------------------------
img_set_data{i}={img,PD_matrix,PDref_matrix,TA_matrix,TAR_matrix,AAR_matrix,SDR_matrix,Iteration_q,Iteration_m,custom_iter,custom_iter2,PDFBP_matrix};
end %end of num_img_set
% %-----------------------------------------------------------------------------------------------
for i = 1 : (num_img_set + add_data)
    TMP_set{i}=0;
end
% %-----------------------------------------------------------------------------------------------
c=1;
for i = (1 + add_data) : (num_img_set + add_data)
    TMP_set{i} = img_set_data{c};
    c=c+1;
end
clear c img_set_data
% %-----------------------------------------------------------------------------------------------
c = 0;
% %-----------------------------------------------------------------------------------------------
if Average_All_Noise_Realizations == 1
    c=c+1;
    for k = j : inc_num : end_iter
        Avg_all_img{k}(:,:,:)=rdivide(Avg_all_img{k}(:,:,:),num_img_set-1);
    end
   if  Plot_with_Noise_Realizations == 0
    num_img_set = 1;
    clear img_set_data;
    img_set_data={Avg_all_img,PD_matrix,PDref_matrix,TA_matrix,TAR_matrix,AAR_matrix,SDR_matrix,Iteration_q,Iteration_m,custom_iter,custom_iter2,PDFBP_matrix};
   else
       tmpimg_set_data={Avg_all_img,PD_matrix,PDref_matrix,TA_matrix,TAR_matrix,AAR_matrix,SDR_matrix,Iteration_q,Iteration_m,custom_iter,custom_iter2,PDFBP_matrix};
       TMP_set{c}=tmpimg_set_data;
       clear tmpimg_set_data;
   end
end
% %-----------------------------------------------------------------------------------------------
if Plot_ATLASref_data == 1
    c=c+1;
    tmpimg_set_data={ATLAS_array,PD_matrix,PDref_matrix,TA_matrix,TAR_matrix,AAR_matrix,SDR_matrix,Iteration_q,Iteration_m,custom_iter,custom_iter2,PDFBP_matrix};
    TMP_set{c}=tmpimg_set_data;
    clear tmptmpimg_set_data
end
% %-----------------------------------------------------------------------------------------------
if Plot_FBP_data == 1
    c=c+1;
    tmpimg_set_data={FBP_array,PD_matrix,PDref_matrix,TA_matrix,TAR_matrix,AAR_matrix,SDR_matrix,Iteration_q,Iteration_m,custom_iter,custom_iter2,PDFBP_matrix};
    TMP_set{c}=tmpimg_set_data;
    clear tmpimg_set_data;
end
% %-----------------------------------------------------------------------------------------------
num_img_set=num_img_set + d;
% %-----------------------------------------------------------------------------------------------
img_set_data=TMP_set;
clear TMP_set
% %-----------------------------------------------------------------------------------------------
cd ATLAS
cd Scripts
Run_Calculations_v1_3
