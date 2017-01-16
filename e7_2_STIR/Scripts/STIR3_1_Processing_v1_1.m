% %---------------------------------------------------------------------------------------------------------
% %                                             COPY FILES
% %---------------------------------------------------------------------------------------------------------

% Use this if you want to move the Siemens Interfiles to a new location.
% Otherwise this code will just use the files it needs
cd (myFolder)
mkdir('MATLAB_output_forSTIR3_1');
cd MATLAB_output_forSTIR3_1
mkdir ('STIR_files');
cd STIR_files
mkdir ('e7_Interfiles');
cd (myFolder)
copyfile('emis_00.s','MATLAB_output_forSTIR3_1/STIR_files/e7_Interfiles/emis_00.s');
copyfile('smoothed_rand_00.s','MATLAB_output_forSTIR3_1/STIR_files/e7_Interfiles/smoothed_rand_00.s');
copyfile('acf_00.a','MATLAB_output_forSTIR3_1/STIR_files/e7_Interfiles/acf_00.a');
cd ../
y = pwd;
cd (myFolder)
x = fullfile(y,'Input-norm.n.hdr',filesep);
z = fullfile(y,'Input-norm.n',filesep);

copyfile(x,'MATLAB_output_forSTIR3_1/STIR_files/Input-norm.n.hdr');
copyfile(z,'MATLAB_output_forSTIR3_1/STIR_files/Input-norm.n');
% %---------------------------------------------------------------------------------------------------------
% %                                      SEGMENT PROMPTS AND RANDOMS
% %---------------------------------------------------------------------------------------------------------
% 
cd (myFolder)
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

fid2=fopen('MATLAB_output_forSTIR3_1/STIR_files/e7_Interfiles/prompts.s', 'w');
fid3=fopen('MATLAB_output_forSTIR3_1/STIR_files/e7_Interfiles/randoms.s', 'w');
cd MATLAB_output_forSTIR3_1/STIR_files
fwrite(fid2,prompts_q,'float32');
cd e7_Interfiles
fwrite(fid3,randoms_q,'float32');
fclose(fid2);
fclose(fid3);
cd (myFolder)

% %---------------------------------------------------------------------------------------------------------


% %---------------------------------------------------------------------------------------------------------
% %                                       CONVERT SINOGRAMS TO GE FORMAT
% %---------------------------------------------------------------------------------------------------------
fid1=fopen('MATLAB_output_forSTIR3_1/STIR_files/e7_Interfiles/prompts.s');
cd (MFolder)
cd SinoConvert
SinoConvert_Siemens2GE
% Name the output file
cd (myFolder)
fid11=fopen('MATLAB_output_forSTIR3_1/STIR_files/GE_prompts.s','w');
fwrite(fid11,GE_sino,'float32');
fclose(fid11);

fid1=fopen('smoothed_rand_00.s');
cd (MFolder)
cd SinoConvert
SinoConvert_Siemens2GE
% Name the output file
cd (myFolder)
fid11=fopen('MATLAB_output_forSTIR3_1/STIR_files/GE_smoothed_rand_00.s','w');
fwrite(fid11,GE_sino,'float32');
fclose(fid11);

fid1=fopen('acf_00.a');
cd (MFolder)
cd SinoConvert
SinoConvert_Siemens2GE
% Name the output file
cd (myFolder)
fid11=fopen('MATLAB_output_forSTIR3_1/STIR_files/GE_acf_00.a','w');
fwrite(fid11,GE_sino,'float32');
fclose(fid11);

% %---------------------------------------------------------------------------------------------------------
% %                                 MOVE HEADER FILES TO MATLAB OUTPUT
% %---------------------------------------------------------------------------------------------------------

cd (MFolder)
cd Sino_Headers/GE
y = pwd;
cd (myFolder)
x = fullfile(y,'Prompts_STIR_GE.hs',filesep);
copyfile(x,'MATLAB_output_forSTIR3_1/STIR_files/Prompts_STIR.hs');
x = fullfile(y,'Randoms_STIR_GE.hs',filesep);
copyfile(x,'MATLAB_output_forSTIR3_1/STIR_files/Randoms_STIR.hs');
x = fullfile(y,'ACF_STIR_GE.hs',filesep);
copyfile(x,'MATLAB_output_forSTIR3_1/STIR_files/ACF_STIR.hs')

% %---------------------------------------------------------------------------------------------------------
% %                              MOVE HARDWARE UMAP FILES TO MATLAB OUTPUT
% %---------------------------------------------------------------------------------------------------------
% cd (MFolder)
% cd Hardware_Umap
% y = pwd;
% cd (myFolder)
% x = fullfile(y,'umap-bed.hv',filesep);
% z = fullfile(y,'Input-LM-00-umap-hardware.v',filesep);
% copyfile(x,'MATLAB_output_forSTIR3_1/STIR_files/umap-bed.hv');
% copyfile(z,'MATLAB_output_forSTIR3_1/STIR_files/Input-LM-00-umap-hardware.v');


cd (MFolder)


