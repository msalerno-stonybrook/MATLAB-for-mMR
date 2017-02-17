close all;
clear all;
clc;

% %---------------------------------------------------------------------------------------------------------
% %                                             IMPORT FILES
% %---------------------------------------------------------------------------------------------------------

fid = fopen('I:\BIEGON\PICOHEN_FFF_GS__30826990_FEPPA_9-8-16\QCfiles_BIEGON_FEPPA\QC-7-Relative_Scaling\RAW\Input-LM-00-sino_20161026145413_f000.scatterdata.dat');
[data,count]=fread(fid,'float32');
fclose(fid);

fid0 = fopen('I:\BIEGON\PICOHEN_FFF_GS__30826990_FEPPA_9-8-16\QCfiles_BIEGON_FEPPA\QC-7-Relative_Scaling\RAW\Input-LM-00-sino_20161026145922_f000.scatterdata.dat');
[data0,count0]=fread(fid0,'float32');
fclose(fid0);

for i = ((884736/4)+1):(265109760/4)
    emis_1_p(i-(884736/4))=data(i);
    emis_2_p(i-(884736/4))=data0(i);
   
end
% fid1=fopen('C:\Users\SUNY\Desktop\Sinos\scatterdata\scatterdata_001.s','w');
% fwrite(fid1, emis_1_p, 'float32');
% 
% close all;
% clear all;
% clc;
% %---------------------------------------------------------------------------------------------------------

% %---------------------------------------------------------------------------------------------------------
% %                                            CONSTANTS
% %---------------------------------------------------------------------------------------------------------

% % SINOGRAM
sx = 344;
sy = 252;
sz = 127;
sz2=762;

% % %---------------------------------------------------------------------------------------------------------

ssrb_sino_1=zeros(sx ,sy, sz);
acf_1=zeros(sx, sy, sz);
scatter_sino_1=zeros(sx, sy, sz);
seg0_1=zeros(sx, sy, sz);
mask_1=zeros(sx, sy, sz);
mask1_1=zeros(sx, sy, sz);

ssrb_sino_2=zeros(sx ,sy, sz);
acf_2=zeros(sx, sy, sz);
scatter_sino_2=zeros(sx, sy, sz);
seg0_2=zeros(sx, sy, sz);
mask_2=zeros(sx, sy, sz);
mask1_2=zeros(sx, sy, sz);

% %---------------------------------------------------------------------------------------------------------
% %                                             IMPORT FILES
% %---------------------------------------------------------------------------------------------------------

% fid0 = fopen('C:\Users\SUNY\Desktop\Sinos\scatterdata\scatterdata_001.s');
% emis_1_p=fread(fid0,'float32');
emis_1_q=reshape(emis_1_p, sx, sy, sz2);
% fclose(fid0);

ssrb_sino_1(1:sx,1:sy,1:sz)=emis_1_q(1:sx,1:sy,1:sz);
acf_1(1:sx,1:sy,1:sz)=emis_1_q(1:sx,1:sy,(sz+1):(2*sz));
scatter_sino_1(1:sx,1:sy,1:sz)=emis_1_q(1:sx,1:sy,(2*sz+1):(3*sz));
seg0_1(1:sx,1:sy,1:sz)=emis_1_q(1:sx,1:sy,(3*sz+1):(4*sz));
mask_1(1:sx,1:sy,1:sz)=emis_1_q(1:sx,1:sy,(4*sz+1):(5*sz));
mask2_1(1:sx,1:sy,1:sz)=emis_1_q(1:sx,1:sy,(5*sz+1):(6*sz));

emis_2_q=reshape(emis_2_p, sx, sy, sz2);

ssrb_sino_2(1:sx,1:sy,1:sz)=emis_2_q(1:sx,1:sy,1:sz);
acf_2(1:sx,1:sy,1:sz)=emis_2_q(1:sx,1:sy,(sz+1):(2*sz));
scatter_sino_2(1:sx,1:sy,1:sz)=emis_2_q(1:sx,1:sy,(2*sz+1):(3*sz));
seg0_2(1:sx,1:sy,1:sz)=emis_2_q(1:sx,1:sy,(3*sz+1):(4*sz));
mask_2(1:sx,1:sy,1:sz)=emis_2_q(1:sx,1:sy,(4*sz+1):(5*sz));
mask2_2(1:sx,1:sy,1:sz)=emis_2_q(1:sx,1:sy,(5*sz+1):(6*sz));


% 
% 
% % %---------------------------------------------------------------------------------------------------------
% 
for i=1:sx 
    ssrb_sum1(i) = sum(sum(ssrb_sino_1(i,:,:))); 
    acf_sum1(i) = sum(sum(acf_1(i,:,:))); 
    scatter_sum1(i) = sum(sum(scatter_sino_1(i,:,:))); 
    seg0_sum1(i) = sum(sum(seg0_1(i,:,:))); 
    mask_sum1(i) = sum(sum(mask_1(i,:,:))); 
    mask2_sum1(i) = sum(sum(mask2_1(i,:,:)));

    ssrb_sum2(i) = sum(sum(ssrb_sino_2(i,:,:))); 
    acf_sum2(i) = sum(sum(acf_2(i,:,:))); 
    scatter_sum2(i) = sum(sum(scatter_sino_2(i,:,:))); 
    seg0_sum2(i) = sum(sum(seg0_2(i,:,:))); 
    mask_sum2(i) = sum(sum(mask_2(i,:,:))); 
    mask2_sum2(i) = sum(sum(mask2_2(i,:,:)));   
end




% figure; 
% plot(ssrb_sum,'r'); 
% hold on; 
% plot(acf_sum, 'g'); 
% hold on; 
% plot(scatter_sum, 'b');
% hold on; 
% plot(seg0_sum,'p'); 
% hold on; 
% plot(mask_sum, 'y'); 
% hold on; 
% plot(mask2_sum, 'o');
% legend('SSRB', 'ACF', 'Scatter', 'seg0', 'mask', 'mask2');
% ylabel('counts'); 
% xlabel('radial bins'); 

figure; 
plot(ssrb_sum1,'r'); 
hold on;
plot(ssrb_sum2,'g'); 
legend('SSRB1','SSRB2');
ylabel('counts'); 
xlabel('radial bins');

figure;
plot(acf_sum1, 'r'); 
hold on;
plot(acf_sum1, 'g'); 
legend('ACF1','ACF2');
ylabel('counts'); 
xlabel('radial bins'); 

figure;
plot(scatter_sum1, 'r');
hold on;
plot(scatter_sum2, 'g');
legend('Scatter1','Scatter2');
ylabel('counts'); 
xlabel('radial bins'); 

figure;
plot(seg0_sum1,'r'); 
hold on;
plot(seg0_sum2,'g'); 
legend('seg0_1','seg0_2');
ylabel('counts'); 
xlabel('radial bins'); 

figure;
plot(mask_sum1, 'r'); 
hold on;
plot(mask_sum2, 'g'); 
legend('mask_1','mask_2');
ylabel('counts'); 
xlabel('radial bins'); 

figure;
plot(mask2_sum1, 'r');
hold on;
plot(mask2_sum2, 'g');
legend('mask2_1','mask2_2');
ylabel('counts'); 
xlabel('radial bins'); 
