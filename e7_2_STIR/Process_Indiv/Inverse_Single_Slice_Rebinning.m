% %---------------------------------------------------------------------------------------------------------
cd (myFolder)
mkdir('MATLAB_output_forSTIR_ISSRB');

% %---------------------------------------------------------------------------------------------------------
% %                                            NORMALIZATION
% %---------------------------------------------------------------------------------------------------------
% Fill gaps of norm sino with large numbers 
fid=fopen('scatter_estim2d_000000.s');
cd (MFolder)
cd Scatter
Inverse_SSRB
% Name the output file
cd (myFolder)
fid1=fopen('MATLAB_output_forSTIR_ISSRB/sino-scat_00.s', 'w');
fwrite(fid1,scat_f,'float32');
fclose(fid1);
% %---------------------------------------------------------------------------------------------------------

% %---------------------------------------------------------------------------------------------------------
% %                                       CONVERT SINOGRAMS TO GE FORMAT
% %---------------------------------------------------------------------------------------------------------
fid1=fopen('MATLAB_output_forSTIR_ISSRB/sino-scat_00.s');
cd (MFolder)
cd SinoConvert
SinoConvert_Siemens2GE
% Name the output file
cd (myFolder)
fid11=fopen('MATLAB_output_forSTIR_ISSRB/GE_sino-scat_00.s','w');
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
x = fullfile(y,'Scatter_STIR.hs',filesep);
copyfile(x,'MATLAB_output_forSTIR_ISSRB/Scatter_STIR.hs');

cd (MFolder)
cd Sino_Headers/GE
y = pwd;
cd (myFolder)
x = fullfile(y,'Scatter_STIR_GE.hs',filesep);
copyfile(x,'MATLAB_output_forSTIR_ISSRB/Scatter_STIR_GE.hs');
cd (MFolder)

