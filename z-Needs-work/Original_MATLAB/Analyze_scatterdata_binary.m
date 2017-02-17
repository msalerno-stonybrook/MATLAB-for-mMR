close all;
clear all;
clc;

% %---------------------------------------------------------------------------------------------------------
% %                                             IMPORT FILES
% %---------------------------------------------------------------------------------------------------------

s1=((884736/4)+1);
s2=(44037504);
s3=(265109760/4);

% %---------------------------------------------------------------------------------------------------------
% %                                             IMPORT FILES
% %---------------------------------------------------------------------------------------------------------

fid0 = fopen('I:\BIEGON\PICOHEN_FFF_GS__30826990_FEPPA_9-8-16\QCfiles_BIEGON_FEPPA\QC-7-Relative_Scaling\RAW\Input-LM-00-sino_20161026145413_f000.scatterdata.dat');
[data,count]=fread(fid0,'float32');
fclose(fid0);

for i = s1:s3
   scatterdata(i-s1+1)=data(i);
end
fid1=fopen('C:\Users\SUNY\Desktop\Sinos\scatterdata\scatterdata_001.s','w');
fwrite(fid1, scatterdata, 'float32');

for j=1:s2
    ssrb_sino(j)=scatterdata(j);
    acf(j)=scatterdata(j+s2+1);
    scatter_sino(j)=scatterdata(j+2*s2+1);
    seg0(j)=scatterdata(j+3*s2+1);
    mask(j)=scatterdata(j+4*s2+1);
    mask1(j)=scatterdata(j+5*s2+1);
end

fid1=fopen('C:\Users\SUNY\Desktop\Sinos\scatterdata\ssrb_test','w');
fwrite(fid1, ssrb_sino, 'float32');
fclose(fid1);

fid2=fopen('C:\Users\SUNY\Desktop\Sinos\scatterdata\scatter_test','w');
fwrite(fid2, scatter_sino, 'float32');
fclose(fid2);

fid3=fopen('C:\Users\SUNY\Desktop\Sinos\scatterdata\mask_test','w');
fwrite(fid3, mask, 'float32');
fclose(fid3);
