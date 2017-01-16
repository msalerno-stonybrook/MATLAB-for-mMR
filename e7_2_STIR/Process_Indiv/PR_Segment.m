% %---------------------------------------------------------------------------------------------------------
cd (myFolder)
mkdir('MATLAB_output_forSTIR_PR');
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
fid2=fopen('MATLAB_output_forSTIR_PR/prompts.s', 'w');
fid3=fopen('MATLAB_output_forSTIR_PR/randoms.s', 'w');
cd MATLAB_output_forSTIR_PR
fwrite(fid2,prompts_q,'float32');
fwrite(fid3,randoms_q,'float32');
fclose(fid2);
fclose(fid3);
% %---------------------------------------------------------------------------------------------------------

% %---------------------------------------------------------------------------------------------------------
% %                                       CONVERT SINOGRAMS TO GE FORMAT
% %---------------------------------------------------------------------------------------------------------
fid1=fopen('MATLAB_output_forSTIR_PR/prompts.s');
cd (MFolder)
cd SinoConvert
SinoConvert_Siemens2GE
% Name the output file
cd (myFolder)
fid11=fopen('MATLAB_output_forSTIR_PR/GE_prompts','w');
fwrite(fid11,GE_sino,'float32');
fclose(fid11);

fid1=fopen('MATLAB_output_forSTIR_PR/randoms.s');
cd (MFolder)
cd SinoConvert
SinoConvert_Siemens2GE
% Name the output file
cd (myFolder)
fid11=fopen('MATLAB_output_forSTIR_PR/GE_randoms','w');
fwrite(fid11,GE_sino,'float32');
fclose(fid11);

% %---------------------------------------------------------------------------------------------------------

% %---------------------------------------------------------------------------------------------------------
% %                                 MOVE HEADER FILES TO MATLAB OUTPUT
% %---------------------------------------------------------------------------------------------------------
cd (MFolder)
cd Sino_Headers/Siemens
y = pwd;
cd (myFolder)
x = fullfile(y,'Prompts_STIR.hs',filesep);
copyfile(x,'MATLAB_output_forSTIR_PR/Prompts_STIR.hs');
x = fullfile(y,'Delays_STIR.hs',filesep);
copyfile(x,'MATLAB_output_forSTIR_PR/Delays_STIR.hs');

cd (MFolder)
cd Sino_Headers/GE
y = pwd;
cd (myFolder)
x = fullfile(y,'Prompts_STIR_GE.hs',filesep);
copyfile(x,'MATLAB_output_forSTIR_PR/Prompts_STIR_GE.hs');
x = fullfile(y,'Delays_STIR_GE.hs',filesep);
copyfile(x,'MATLAB_output_forSTIR_PR/Delays_STIR_GE.hs');

cd (MFolder)
