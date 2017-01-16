% %---------------------------------------------------------------------------------------------------------
% %                                             COPY FILES
% %---------------------------------------------------------------------------------------------------------

% Use this if you want to move the Siemens Interfiles to a new location.
% Otherwise this code will just use the files it needs
%new test
cd (myFolder)
mkdir('MATLAB_output_forSTIR');
cd MATLAB_output_forSTIR
mkdir ('STIR_sinos');
cd STIR_sinos
mkdir ('e7_Interfiles');
mkdir ('GE');
mkdir ('Siemens');
cd (myFolder)
copyfile('emis_00.s','MATLAB_output_forSTIR/STIR_sinos/e7_Interfiles/emis_00.s');
copyfile('acf_00.a','MATLAB_output_forSTIR/STIR_sinos/Siemens/acf_00.a');
copyfile('norm3d_00.a','MATLAB_output_forSTIR/STIR_sinos/e7_Interfiles/norm3d_00.a');
copyfile('smoothed_rand_00.s','MATLAB_output_forSTIR/STIR_sinos/Siemens/smoothed_rand_00.s');
% %---------------------------------------------------------------------------------------------------------
% %                                      SEGMENT PROMPTS AND RANDOMS
% %---------------------------------------------------------------------------------------------------------
% 
% Template Matrix
prompts_q = zeros(344, 252, 837);
randoms_q = zeros(344, 252, 837);

% 1.) Import and segment emission sinogram into prompts and randoms
fid1=fopen('emis_00.s');
emis_q = fread(fid1,'float32');
fclose(fid1);
emis_s = reshape(emis_q, 344, 252, 1674); 
prompts_q = emis_s(:,:,1:837);
randoms_q = emis_s(:,:,838:1674);
fid2=fopen('MATLAB_output_forSTIR/STIR_sinos/Siemens/prompts.s', 'w');
fid3=fopen('MATLAB_output_forSTIR/STIR_sinos/e7_Interfiles/randoms.s', 'w');
cd MATLAB_output_forSTIR/STIR_sinos/
fwrite(fid2,prompts_q,'float32');
cd e7_Interfiles/
fwrite(fid3,randoms_q,'float32');
fclose(fid2);
fclose(fid3);
% cd (MFolder)
% %---------------------------------------------------------------------------------------------------------

% %---------------------------------------------------------------------------------------------------------
% %                                            NORMALIZATION
% %---------------------------------------------------------------------------------------------------------
cd (myFolder)
% Fill gaps of norm sino with large numbers 
fid4=fopen('norm3d_00.a');
[data,count]=fread(fid4,'float32');
fid5=fopen('MATLAB_output_forSTIR/STIR_sinos/Siemens/norm3d_gf.s', 'w');
for i = 1:(290231424 / 4)
    if data(i) > 0
        data1(i)=data(i);
    else if data(i) < 0
        data1(i)=data(i);
        else
        data1(i)=1000000000000;
        end
    end
end
fwrite(fid5,data1,'float32');
fclose(fid4);
fclose(fid5);

% %---------------------------------------------------------------------------------------------------------

% %---------------------------------------------------------------------------------------------------------
% %                                            SCATTER - INVERSE SSRB
% %---------------------------------------------------------------------------------------------------------

% NOTE: 
% 44037504 bytes in 2D scatter sinogram
% each slice = 44037504 / 127=346752 bytes
cd (myFolder)
fid=fopen('scatter_estim2d_000000.s');
cd (MFolder)
cd Scatter
Inverse_SSRB
% Name the output file
cd (myFolder)
fid1=fopen('MATLAB_output_forSTIR/STIR_sinos/Siemens/sino-scat_00.s', 'w');
fwrite(fid1,scat_f,'float32');
fclose(fid1);
% %---------------------------------------------------------------------------------------------------------

% %---------------------------------------------------------------------------------------------------------
% %                                  ADDITIVE SINOGRAM: SCATTER PLUS RANDOMS
% %---------------------------------------------------------------------------------------------------------
fid=fopen('MATLAB_output_forSTIR/STIR_sinos/Siemens/sino-scat_00.s');
scatter_q=fread(fid,'float32');
scatter_s=reshape(scatter_q, 344, 252, 837);
fid1=fopen('smoothed_rand_00.s');
rand_q = fread(fid1,'float32');
rand_s=reshape(rand_q, 344, 252, 837);
fclose(fid1);
additive_s=zeros(344,252,837);
additive_s(:,:,:) = (scatter_s(:,:,:) + rand_s(:,:,:));
fid2=fopen('MATLAB_output_forSTIR/STIR_sinos/Siemens/additive.s','w');
fwrite(fid2,additive_s,'float32');
fclose(fid2);
% %---------------------------------------------------------------------------------------------------------

% %---------------------------------------------------------------------------------------------------------
% %                                       CONVERT SINOGRAMS TO GE FORMAT
% %---------------------------------------------------------------------------------------------------------
fid1=fopen('MATLAB_output_forSTIR/STIR_sinos/Siemens/prompts.s');
cd (MFolder)
cd SinoConvert
SinoConvert_Siemens2GE
% Name the output file
cd (myFolder)
fid11=fopen('MATLAB_output_forSTIR/STIR_sinos/GE/GE_prompts.s','w');
fwrite(fid11,GE_sino,'float32');
fclose(fid11);

fid1=fopen('smoothed_rand_00.s');
cd (MFolder)
cd SinoConvert
SinoConvert_Siemens2GE
% Name the output file
cd (myFolder)
fid11=fopen('MATLAB_output_forSTIR/STIR_sinos/GE/GE_smoothed_rand_00.s','w');
fwrite(fid11,GE_sino,'float32');
fclose(fid11);

fid1=fopen('acf_00.a');
cd (MFolder)
cd SinoConvert
SinoConvert_Siemens2GE
% Name the output file
cd (myFolder)
fid11=fopen('MATLAB_output_forSTIR/STIR_sinos/GE/GE_acf_00.a','w');
fwrite(fid11,GE_sino,'float32');
fclose(fid11);

fid1=fopen('MATLAB_output_forSTIR/STIR_sinos/Siemens/norm3d_gf.s');
cd (MFolder)
cd SinoConvert
SinoConvert_Siemens2GE
% Name the output file
cd (myFolder)
fid11=fopen('MATLAB_output_forSTIR/STIR_sinos/GE/GE_norm.s','w');
fwrite(fid11,GE_sino,'float32');
fclose(fid11);

fid1=fopen('MATLAB_output_forSTIR/STIR_sinos/Siemens/sino-scat_00.s');
cd (MFolder)
cd SinoConvert
SinoConvert_Siemens2GE

% Name the output file
cd (myFolder)
fid11=fopen('MATLAB_output_forSTIR/STIR_sinos/GE/GE_sino-scat_00.s','w');
fwrite(fid11,GE_sino,'float32');
fclose(fid11);

fid1=fopen('MATLAB_output_forSTIR/STIR_sinos/Siemens/additive.s');
cd (MFolder)
cd SinoConvert
SinoConvert_Siemens2GE
% Name the output file
cd (myFolder)
fid11=fopen('MATLAB_output_forSTIR/STIR_sinos/GE/GE_additive.s','w');
fwrite(fid11,GE_sino,'float32');
fclose(fid11);
% %---------------------------------------------------------------------------------------------------------
% %                                 MOVE HEADER FILES TO MATLAB OUTPUT
% %---------------------------------------------------------------------------------------------------------
cd (MFolder)
cd Sino_Headers/Siemens
y = pwd;
cd (myFolder)
x = fullfile(y,'ACF_STIR.hs',filesep);
copyfile(x,'MATLAB_output_forSTIR/STIR_sinos/Siemens/ACF_STIR.hs');
x = fullfile(y,'Norm_STIR.hs',filesep);
copyfile(x,'MATLAB_output_forSTIR/STIR_sinos/Siemens/Norm_STIR.hs');
x = fullfile(y,'Prompts_STIR.hs',filesep);
copyfile(x,'MATLAB_output_forSTIR/STIR_sinos/Siemens/Prompts_STIR.hs');
x = fullfile(y,'Randoms_STIR.hs',filesep);
copyfile(x,'MATLAB_output_forSTIR/STIR_sinos/Siemens/Randoms_STIR.hs');
x = fullfile(y,'Scatter_STIR.hs',filesep);
copyfile(x,'MATLAB_output_forSTIR/STIR_sinos/Siemens/Scatter_STIR.hs');
x = fullfile(y,'Additive_STIR.hs',filesep);
copyfile(x,'MATLAB_output_forSTIR/STIR_sinos/Siemens/Additive_STIR.hs');


cd (MFolder)
cd Sino_Headers/GE
y = pwd;
cd (myFolder)
x = fullfile(y,'ACF_STIR_GE.hs',filesep);
copyfile(x,'MATLAB_output_forSTIR/STIR_sinos/GE/ACF_STIR_GE.hs');
x = fullfile(y,'Norm_STIR_GE.hs',filesep);
copyfile(x,'MATLAB_output_forSTIR/STIR_sinos/GE/Norm_STIR_GE.hs');
x = fullfile(y,'Prompts_STIR_GE.hs',filesep);
copyfile(x,'MATLAB_output_forSTIR/STIR_sinos/GE/Prompts_STIR_GE.hs');
x = fullfile(y,'Randoms_STIR_GE.hs',filesep);
copyfile(x,'MATLAB_output_forSTIR/STIR_sinos/GE/Randoms_STIR_GE.hs');
x = fullfile(y,'Scatter_STIR_GE.hs',filesep);
copyfile(x,'MATLAB_output_forSTIR/STIR_sinos/GE/Scatter_STIR_GE.hs');
x = fullfile(y,'Additive_STIR_GE.hs',filesep);
copyfile(x,'MATLAB_output_forSTIR/STIR_sinos/GE/Additive_STIR_GE.hs');

cd (MFolder)