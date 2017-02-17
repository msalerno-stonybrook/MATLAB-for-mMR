clear all;
close all;
clc;


fid=fopen('G:\Crossover\Patient1\Input-Converted\Input-LM-00\AC_Analysis\T1_3D_SAG_coreg2_umap.img');
[data,count]=fread(fid,'float32');
fclose(fid);

for i = 1:(60114688/4)
    if data(i) < 100
        data1(i)=0;
    else if (data(i) > 100) && (data(i) < 450)
            data1(i)=0.095;
        else
            data1(i)=0.151;
        end
    end
end

fid1=fopen('G:\Crossover\Patient1\Input-Converted\Input-LM-00\AC_Analysis\T1_threshold_umap.v','w');
fwrite(fid1,data1,'float32');
fclose(fid1);
