


mkdir('C:\Users\SUNY\Desktop\BME503_Final_Project\Study1\mMR\Input-Converted\Input-LM-00','Recon');
 
cd ../../Desktop/BME503_Final_Project/Study1/mMR/Input-Converted/Input-LM-00/
 
movefile('Input-LM-00-PSF-mMR.mhdr','Recon/')
movefile('Input-LM-00-PSF-mMR_000_000.v','Recon/')
movefile('Input-LM-00-PSF-mMR_000_000.v.hdr','Recon/')
 
movefile('Input-LM-00-PSF-TP.mhdr','Recon/')
movefile('Input-LM-00-PSF-TP_000_000.v','Recon/')
movefile('Input-LM-00-PSF-TP_000_000.v.hdr','Recon/')





%Recon 
mkdir('C:\Users\SUNY\Desktop\BME503_Final_Project\Study1\mMR\Input-Converted\Input-LM-00\Recon','PD');

fid=fopen('C:\Users\SUNY\Desktop\BME503_Final_Project\Study1\mMR\Input-Converted\Input-LM-00\Recon\Input-LM-00-PSF-TP_000_000.v');
[data,count]=fread(fid,'float32');
 
fid1=fopen('C:\Users\SUNY\Desktop\BME503_Final_Project\Study1\mMR\Input-Converted\Input-LM-00\Recon\Input-LM-00-PSF-mMR_000_000.v');
 
 
[data1,count1]=fread(fid1,'float32');
 
%%Calculate the percent difference between two images
fid2=fopen('C:\Users\SUNY\Desktop\BME503_Final_Project\Study1\mMR\Input-Converted\Input-LM-00\Recon\PD\TPvsmMR-PD.v','w');
[data2,count2]=fread(fid2,'float32');
for i = 1:(60114688/4)
    data2(i)=(((data(i)-data1(i))/(data(i)))*100);
end
c=fwrite(fid2,data2,'float32');
 
 
%%Segement Percent Difference = 0% < data < 20%
fid7=fopen('C:\Users\SUNY\Desktop\BME503_Final_Project\Study1\mMR\Input-Converted\Input-LM-00\Recon\PD\TPvsmMR-PD_0to20.v','w');
for i=1:(60114688/4)
    if data2(i) < 0
        data7(i)=0;
    else if data2(i) < 20
        data7(i)=data2(i);
    else
        data7(i)=0;
        end
    end
end
h=fwrite(fid7,data7,'float32');
 
%%Segement Percent Difference = 20% < data < 50%
fid8=fopen('C:\Users\SUNY\Desktop\BME503_Final_Project\Study1\mMR\Input-Converted\Input-LM-00\Recon\PD\TPvsmMR-PD_20to50.v','w');
for i=1:(60114688/4)
    if data2(i) < 20
        data8(i)=0;
    else if data2(i) < 50
        data8(i)=data2(i);
    else
        data8(i)=0;
        end
    end
end
j=fwrite(fid8,data8,'float32');
 
%%Segement Percent Difference = 50% < data < 80%
fid9=fopen('C:\Users\SUNY\Desktop\BME503_Final_Project\Study1\mMR\Input-Converted\Input-LM-00\Recon\PD\TPvsmMR-PD_50to80.v','w');
for i=1:(60114688/4)
    if data2(i) < 50
        data9(i)=0;
    else if data2(i) < 80
        data9(i)=data2(i);
    else
        data9(i)=0;
        end
    end
end
k=fwrite(fid9,data9,'float32');
 
%%Segement Percent Difference = greater than 80%
fid10=fopen('C:\Users\SUNY\Desktop\BME503_Final_Project\Study1\mMR\Input-Converted\Input-LM-00\Recon\PD\TPvsmMR-PD_greaterthan80.v','w');
for i=1:(60114688/4)
    if data2(i) < 80
        data10(i)=0;
    else if data2(i) > 80
        data10(i)=data2(i);
    else
        data10(i)=0;
        end
    end
end
l=fwrite(fid10,data10,'float32');


clc
clear all


%Attenuation Maps 
mkdir('C:\Users\SUNY\Desktop\BME503_Final_Project\Study1\mMR\Input-Converted\Input-LM-00','Umap_PD');

fid=fopen('C:\Users\SUNY\Desktop\BME503_Final_Project\Study1\mMR\Input-Converted\Input-LM-00\1-TP-umap_final.img');

[data,count]=fread(fid,'float32');
 
fid1=fopen('C:\Users\SUNY\Desktop\BME503_Final_Project\Study1\mMR\Input-Converted\Input-LM-00\1-mMR-umap.v'); 
[data1,count1]=fread(fid1,'float32');
 
%%Calculate the percent difference between two images
fid2=fopen('C:\Users\SUNY\Desktop\BME503_Final_Project\Study1\mMR\Input-Converted\Input-LM-00\Umap_PD\TPvsmMR-PD.v','w');
[data2,count2]=fread(fid2,'float32');
for i = 1:(60114688/4)
    data2(i)=(((data(i)-data1(i))/(data(i)))*100);
end
c=fwrite(fid2,data2,'float32');
 
 
%%Segement Percent Difference = 0% < data < 20%
fid7=fopen('C:\Users\SUNY\Desktop\BME503_Final_Project\Study1\mMR\Input-Converted\Input-LM-00\Umap_PD\TPvsmMR-PD_0to20.v','w');
for i=1:(60114688/4)
    if data2(i) < 0
        data7(i)=0;
    else if data2(i) < 20
        data7(i)=data2(i);
    else
        data7(i)=0;
        end
    end
end
h=fwrite(fid7,data7,'float32');
 
%%Segement Percent Difference = 20% < data < 50%
fid8=fopen('C:\Users\SUNY\Desktop\BME503_Final_Project\Study1\mMR\Input-Converted\Input-LM-00\Umap_PD\TPvsmMR-PD_20to50.v','w');
for i=1:(60114688/4)
    if data2(i) < 20
        data8(i)=0;
    else if data2(i) < 50
        data8(i)=data2(i);
    else
        data8(i)=0;
        end
    end
end
j=fwrite(fid8,data8,'float32');
 
%%Segement Percent Difference = 50% < data < 80%
fid9=fopen('C:\Users\SUNY\Desktop\BME503_Final_Project\Study1\mMR\Input-Converted\Input-LM-00\Umap_PD\TPvsmMR-PD_50to80.v','w');
for i=1:(60114688/4)
    if data2(i) < 50
        data9(i)=0;
    else if data2(i) < 80
        data9(i)=data2(i);
    else
        data9(i)=0;
        end
    end
end
k=fwrite(fid9,data9,'float32');
 
%%Segement Percent Difference = greater than 80%
fid10=fopen('C:\Users\SUNY\Desktop\BME503_Final_Project\Study1\mMR\Input-Converted\Input-LM-00\Umap_PD\TPvsmMR-PD_greaterthan80.v','w');
for i=1:(60114688/4)
    if data2(i) < 80
        data10(i)=0;
    else if data2(i) > 80
        data10(i)=data2(i);
    else
        data10(i)=0;
        end
    end
end
l=fwrite(fid10,data10,'float32');
