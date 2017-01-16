% %---------------------------------------------------------------------------------------------------------
FileName2 = strcat(FileName,FileExt);
cd (myFolder)
mkdir('MATLAB_output_forSTIR_SinoConvert');

% %---------------------------------------------------------------------------------------------------------
% %                                       CONVERT SIEMENS TO GE FORMAT
% %---------------------------------------------------------------------------------------------------------
if Conversion_Switch == 0
    fid1=fopen(FileName2);
    cd (MFolder)
    cd SinoConvert
    SinoConvert_Siemens2GE
    % Name the output file
    cd (myFolder)
    cd MATLAB_output_forSTIR_SinoConvert
    FileName3 = strcat(FileName,'_GE','.s');
    fid11=fopen(FileName3,'w');
    fwrite(fid11,GE_sino,'float32');
    fclose(fid11);
    cd (MFolder)
end
% %---------------------------------------------------------------------------------------------------------
% %                                       CONVERT GE TO SIEMENS FORMAT
% %---------------------------------------------------------------------------------------------------------
if Conversion_Switch == 1
    fid1=fopen(FileName2);
    cd (MFolder)
    cd SinoConvert
    SinoConvert_GE2Siemens
    % Name the output file
    cd (myFolder)
    cd MATLAB_output_forSTIR_SinoConvert
    FileName3 = strcat(FileName,'_Siemens','.s');
    fid11=fopen(FileName3,'w');
    fwrite(fid11,Siemens_sino,'float32');
    fclose(fid11);
    cd (MFolder)
end

