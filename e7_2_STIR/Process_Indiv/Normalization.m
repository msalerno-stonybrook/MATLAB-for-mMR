% %---------------------------------------------------------------------------------------------------------
cd (myFolder)
mkdir('MATLAB_output_forSTIR_Norm');

% %---------------------------------------------------------------------------------------------------------
% %                                            NORMALIZATION
% %---------------------------------------------------------------------------------------------------------

% Fill gaps of norm sino with large numbers 
fid4=fopen('norm3d_00.a');
[data,count]=fread(fid4,'float32');
fid5=fopen('MATLAB_output_forSTIR_Norm/norm3d_gf.s', 'w');
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
% %                                       CONVERT SINOGRAMS TO GE FORMAT
% %---------------------------------------------------------------------------------------------------------

fid1=fopen('MATLAB_output_forSTIR_Norm/norm3d_gf.s');
cd (MFolder)
cd SinoConvert
SinoConvert_Siemens2GE
% Name the output file
cd (myFolder)
fid11=fopen('MATLAB_output_forSTIR_Norm/GE_norm.s','w');
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
x = fullfile(y,'Norm_STIR.hs',filesep);
copyfile(x,'MATLAB_output_forSTIR_Norm/Norm_STIR.hs');

cd (MFolder)
cd Sino_Headers/GE
y = pwd;
cd (myFolder)
x = fullfile(y,'Norm_STIR_GE.hs',filesep);
copyfile(x,'MATLAB_output_forSTIR_Norm/Norm_STIR_GE.hs');
cd (MFolder)