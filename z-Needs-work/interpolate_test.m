clear all
clc

t = [0 10 20 30 40 50 60 70 80 90 100 110 120 180 240 360 480 600 900 1200 1500 1800 2100 3944];
Cp_star = [0.03 0.01 0.09 0.04 2.64 85.56 312.56 249.11 306.40 275.69 242.34 216.95 192.63 141.28 133.81 119.22 109.59 101.19 86.80 80.56 70.43 68.73 61.38 50.29]; 
xq = 0 : 10 : 3940;


figure
vq1 = interp1(t,Cp_star,xq);
% plot(t,Cp_star,'o',xq,vq1,':.');
plot(xq,vq1,':.');
title('(Default) Linear Interpolation');









% x = 0:pi/4:2*pi;
% v = sin(x);
% 
% xq = 0:pi/16:2*pi;
% 
% 
% 
% 
% figure
% vq1 = interp1(x,v,xq);
% plot(x,v,'o',xq,vq1,':.');
% xlim([0 2*pi]);
% title('(Default) Linear Interpolation');