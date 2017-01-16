scat_s= fread(fid,'float32');
scat_i=reshape(scat_s, 344, 252, 127);
fclose(fid);

scat_f=zeros(344, 252, 837);
% Segment 1: Direct Planes = 127
scat_f(:,:,1:127)=scat_i(:,:,:);
% Segment 2: 115   +/- 6 from each side
scat_f(:,:,128:242)=scat_i(:,:,7:121);
% Segment 3: 115   +/- 6 from each side
scat_f(:,:,243:357)=scat_i(:,:,7:121);
% Segment 4: 93   +/- 17 from each side
scat_f(:,:,358:450)=scat_i(:,:,18:110);
% Segment 5: 93   +/- 17 from each side
scat_f(:,:,451:543)=scat_i(:,:,18:110);
% Segment 6: 71   +/- 28 from each side
scat_f(:,:,544:614)=scat_i(:,:,29:99);
% Segment 7: 71   +/- 28 from each side
scat_f(:,:,615:685)=scat_i(:,:,29:99);
% Segment 8: 49   +/- 39 from each side
scat_f(:,:,686:734)=scat_i(:,:,40:88);
% Segment 9: 49   +/- 39 from each side
scat_f(:,:,735:783)=scat_i(:,:,40:88);
% Segment 10: 27  +/- 50 from each side
scat_f(:,:,784:810)=scat_i(:,:,51:77);
% Segment 11: 27  +/- 50 from each side
scat_f(:,:,811:837)=scat_i(:,:,51:77);