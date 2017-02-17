fid=fopen('C:\Users\SUNY\Desktop\BME503_Final_Project\Study2\mMR\Input-Converted\Input-LM-00\Coreg\TPumap_coreg2_mMRumap_crop.img');
fid1=fopen('C:\Users\SUNY\Desktop\BME503_Final_Project\Study2\mMR\Input-Converted\Input-LM-00\Coreg\mMR_Neck.img');

[data,count]=fread(fid,'float32');
[data1,count1]=fread(fid1,'float32');

fid2=fopen('C:\Users\SUNY\Desktop\BME503_Final_Project\Study2\mMR\Input-Converted\Input-LM-00\1-TP-umap_final.img', 'w');
[data2,count2]=fread(fid2,'float32');


for i = 1:(60114688/4)
    if data(i) > 0
        data2(i)=data(i);
    else if data(i) < 0
        data2(i)=data(i);
        else
        data2(i)=data(i)+data1(i);
        end
    end
end
c=fwrite(fid2,data2,'float32');

clear all
clc