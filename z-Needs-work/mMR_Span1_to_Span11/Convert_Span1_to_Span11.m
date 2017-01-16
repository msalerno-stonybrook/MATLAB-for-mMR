clearvars -except s1p_seg
MFolder = pwd;
run_sino = 0;
if run_sino == 1 %debug
cd input
myFolder=pwd;
end %debug
% %-----------------------------------------------------------------------------------------------
sx = 344;
sy = 252;
% Span 1 Sinogram Dimensions
s1z1 = 4084;
s1z2 = 8168;
s1_num_seg = 121;
s1_0 = 64;
% Span 11 Sinogram Dimensions
s11z1 = 837;
s11z2 = 1674;
s11_num_seg = 11;
% %-----------------------------------------------------------------------------------------------
sp11_sino=zeros(sx,sy,s11z1);
% %-----------------------------------------------------------------------------------------------
if run_sino == 1 %debug
% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(myFolder, '*.s'); 
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s \n ', fullFileName);
  fid = fopen(fullFileName);
      span1_sino=fread(fid,'int16');
      fclose(fid);
      span1_sino=reshape(span1_sino,sx,sy,s1z2);
end
% %-----------------------------------------------------------------------------------------------
s1p_sino(1:sx,1:sy,1:s1z1)=span1_sino(1:sx,1:sy,1:s1z1);
s1r_sino(1:sx,1:sy,1:s1z1)=span1_sino(1:sx,1:sy,s1z1+1:s1z2);
% %-----------------------------------------------------------------------------------------------
s=64;
r=1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s1p_seg{r}=zeros(sx,sy,s);
r=r+1;
s=s-1;
% %-----------------------------------------------------------------------------------------------
p = 0;
s = s1_0;
r = s1_0;
t = s1_0;
for i = 1 : 121
    if i == 1
        s1p_seg{i}(1:sx,1:sy,1:s1_0)=s1p_sino(1:sx,1:sy,1:s1_0);
        r=r-1;
        s=s+1;
        t=t+r;
    else
        s1p_seg{i}(1:sx,1:sy,1:r)=s1p_sino(1:sx,1:sy,s:t);
        if p == 0
            t=t+r;
            s=s+r;
            p=p+1;
        else
            s=s+r;
            r=r-1;
            t=t+r;
            p=p-1;
        end
    end
end
end %debug
% %-----------------------------------------------------------------------------------------------
ints11p_seg{1}=zeros(sx,sy,127);
ints11p_seg{2}=zeros(sx,sy,115);
ints11p_seg{3}=zeros(sx,sy,115);
ints11p_seg{4}=zeros(sx,sy,93);
ints11p_seg{5}=zeros(sx,sy,93);
ints11p_seg{6}=zeros(sx,sy,71);
ints11p_seg{7}=zeros(sx,sy,71);
ints11p_seg{8}=zeros(sx,sy,49);
ints11p_seg{9}=zeros(sx,sy,49);
ints11p_seg{10}=zeros(sx,sy,27);
ints11p_seg{11}=zeros(sx,sy,27);
% %-----------------------------------------------------------------------------------------------
ints11p_seg{1}(sx,sy,1)=s1p_seg{1}(sx,sy,1);
% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------
% %                                    SEGEMENT 1
% %-----------------------------------------------------------------------------------------------
t=1;
for i = 1 : 2 : 127
    ints11p_seg{1}(1:sx,1:sy,i)=s1p_seg{1}(1:sx,1:sy,t);
    t=t+1;
end
t=1;
for i = 2 : 2 : 126
    ints11p_seg{1}(1:sx,1:sy,i)=s1p_seg{2}(1:sx,1:sy,t);
    t=t+1;
end
t=63;
for i = 127 : 2 : 3
    ints11p_seg{1}(1:sx,1:sy,i)= ints11p_seg{1}(1:sx,1:sy,i)+s1p_seg{3}(1:sx,1:sy,t);
    t=t-1;
end
% %-----------------------------------------------------------------------------------------------
slice_q=62;
last_slice=126;
first_slice=4;
for q = 4 : 11
    if mod(q,2) == 0
        t=1;
        for i = first_slice : 2 : last_slice
            ints11p_seg{1}(1:sx,1:sy,i)= ints11p_seg{1}(1:sx,1:sy,i)+s1p_seg{q}(1:sx,1:sy,t);
            t=t+1;
        end %end i loop
    else %else if modulus
        t=slice_q;
        for i = last_slice : 2 : first_slice
            ints11p_seg{1}(1:sx,1:sy,i)= ints11p_seg{1}(1:sx,1:sy,i)+s1p_seg{q}(1:sx,1:sy,t);
            t=t-1;
        end %end i loop
        slice_q=slice_q-1;
    end % end if modulus 
    if mod(q,2) == 0
    else
        last_slice = last_slice-1;
        first_slice = first_slice+1;
    end %end if modulus2
end %end q loop



















% %-----------------------------------------------------------------------------------------------
% last_slice = 127;
% first_slice1 = 1;
% first_slice2 = 3;
% % %-----------------------------------------------------------------------------------------------
% for q = 3 : 11
%     t=1;
%     if mod(q,2) == 0
%         for i = first_slice1 : 2 : last_slice
%             ints11p_seg{1}(1:sx,1:sy,i)=ints11p_seg{1}(1:sx,1:sy,i)+s1p_seg{q}(1:sx,1:sy,t);
%             t=t+1;
%         end
%     else
%         for i = last_slice : 2 : first_slice2
%             ints11p_seg{1}(1:sx,1:sy,i)=ints11p_seg{1}(1:sx,1:sy,i)+s1p_seg{q}(1:sx,1:sy,t);
%             t=t+1;
%         end
%         first_slice1=first_slice1+1;
%         first_slice2=first_slice2+1;
%         last_slice=last_slice-1;
%     end
% end
% %-----------------------------------------------------------------------------------------------














% % %-----------------------------------------------------------------------------------------------
% % %                                    SEGEMENT 2
% % %-----------------------------------------------------------------------------------------------
% t=1;
% for i = 1 : 2 : 115
%     ints11p_seg{2}(1:sx,1:sy,i)=s1p_seg{12}(1:sx,1:sy,t);
%     t=t+1;
% end
% t=1;
% for i = 2 : 2 : 115
%     ints11p_seg{2}(1:sx,1:sy,i)=s1p_seg{14}(1:sx,1:sy,t);
%     t=t+1;
% end
% last_slice = 114;
% first_slice = 1;
% for q = 16 : 2 : 32
%     t=1;
%     s=1;
%     if mod(1,2) == 0
%         for i = first_slice : 2 : last_slice
%             ints11p_seg{2}(1:sx,1:sy,i)=ints11p_seg{2}(1:sx,1:sy,i)+s1p_seg{q}(1:sx,1:sy,t);
%             t=t+1;
%         end
%         s=s-1;
%     else
%         for i = last_slice : 2 : first_slice
%             ints11p_seg{2}(1:sx,1:sy,i)=ints11p_seg{2}(1:sx,1:sy,i)+s1p_seg{q}(1:sx,1:sy,t);
%             t=t+1;
%         end
%         first_slice=first_slice+1;
%         last_slice=last_slice-1;
%         s=s+1;
%     end
% end
% % %-----------------------------------------------------------------------------------------------
% % %-----------------------------------------------------------------------------------------------
% % %                                    SEGEMENT 3
% % %-----------------------------------------------------------------------------------------------
% t=1;
% for i = 1 : 2 : 115
%     ints11p_seg{3}(1:sx,1:sy,i)=s1p_seg{13}(1:sx,1:sy,t);
%     t=t+1;
% end
% t=1;
% for i = 2 : 2 : 115
%     ints11p_seg{3}(1:sx,1:sy,i)=s1p_seg{15}(1:sx,1:sy,t);
%     t=t+1;
% end
% last_slice = 114;
% first_slice = 1;
% for q = 17 : 2 : 33
%     t=1;
%     s=1;
%     if mod(1,2) == 0
%         for i = first_slice : 2 : last_slice
%             ints11p_seg{3}(1:sx,1:sy,i)=ints11p_seg{3}(1:sx,1:sy,i)+s1p_seg{q}(1:sx,1:sy,t);
%             t=t+1;
%         end
%         s=s-1;
%     else
%         for i = last_slice : 2 : first_slice
%             ints11p_seg{3}(1:sx,1:sy,i)=ints11p_seg{3}(1:sx,1:sy,i)+s1p_seg{q}(1:sx,1:sy,t);
%             t=t+1;
%         end
%         first_slice=first_slice+1;
%         last_slice=last_slice-1;
%         s=s+1;
%     end
% end
% % %-----------------------------------------------------------------------------------------------
% % %-----------------------------------------------------------------------------------------------
% % %                                    SEGEMENT 4
% % %-----------------------------------------------------------------------------------------------
% t=1;
% for i = 1 : 2 : 93
%     ints11p_seg{4}(1:sx,1:sy,i)=s1p_seg{34}(1:sx,1:sy,t);
%     t=t+1;
% end
% t=1;
% for i = 2 : 2 : 93
%     ints11p_seg{4}(1:sx,1:sy,i)=s1p_seg{36}(1:sx,1:sy,t);
%     t=t+1;
% end
% last_slice = 92;
% first_slice = 1;
% for q = 38 : 2 : 54
%     t=1;
%     s=1;
%     if mod(1,2) == 0
%         for i = first_slice : 2 : last_slice
%             ints11p_seg{4}(1:sx,1:sy,i)=ints11p_seg{4}(1:sx,1:sy,i)+s1p_seg{q}(1:sx,1:sy,t);
%             t=t+1;
%         end
%         s=s-1;
%     else
%         for i = last_slice : 2 : first_slice
%             ints11p_seg{4}(1:sx,1:sy,i)=ints11p_seg{4}(1:sx,1:sy,i)+s1p_seg{q}(1:sx,1:sy,t);
%             t=t+1;
%         end
%         first_slice=first_slice+1;
%         last_slice=last_slice-1;
%         s=s+1;
%     end
% end
% % %-----------------------------------------------------------------------------------------------
% 
% % %-----------------------------------------------------------------------------------------------
% % %                                    SEGEMENT 5
% % %-----------------------------------------------------------------------------------------------
% t=1;
% for i = 1 : 2 : 93
%     ints11p_seg{5}(1:sx,1:sy,i)=s1p_seg{35}(1:sx,1:sy,t);
%     t=t+1;
% end
% t=1;
% for i = 2 : 2 : 93
%     ints11p_seg{5}(1:sx,1:sy,i)=s1p_seg{37}(1:sx,1:sy,t);
%     t=t+1;
% end
% last_slice = 92;
% first_slice = 1;
% for q = 39 : 2 : 55
%     t=1;
%     s=1;
%     if mod(1,2) == 0
%         for i = first_slice : 2 : last_slice
%             ints11p_seg{5}(1:sx,1:sy,i)=ints11p_seg{5}(1:sx,1:sy,i)+s1p_seg{q}(1:sx,1:sy,t);
%             t=t+1;
%         end
%         s=s-1;
%     else
%         for i = last_slice : 2 : first_slice
%             ints11p_seg{5}(1:sx,1:sy,i)=ints11p_seg{5}(1:sx,1:sy,i)+s1p_seg{q}(1:sx,1:sy,t);
%             t=t+1;
%         end
%         first_slice=first_slice+1;
%         last_slice=last_slice-1;
%         s=s+1;
%     end
% end
% % %-----------------------------------------------------------------------------------------------
% % %-----------------------------------------------------------------------------------------------
% % %                                    SEGEMENT 6
% % %-----------------------------------------------------------------------------------------------
% t=1;
% for i = 1 : 2 : 71
%     ints11p_seg{6}(1:sx,1:sy,i)=s1p_seg{56}(1:sx,1:sy,t);
%     t=t+1;
% end
% t=1;
% for i = 2 : 2 : 71
%     ints11p_seg{6}(1:sx,1:sy,i)=s1p_seg{58}(1:sx,1:sy,t);
%     t=t+1;
% end
% last_slice = 70;
% first_slice = 1;
% for q = 60 : 2 : 76
%     t=1;
%     s=1;
%     if mod(1,2) == 0
%         for i = first_slice : 2 : last_slice
%             ints11p_seg{6}(1:sx,1:sy,i)=ints11p_seg{6}(1:sx,1:sy,i)+s1p_seg{q}(1:sx,1:sy,t);
%             t=t+1;
%         end
%         s=s-1;
%     else
%         for i = last_slice : 2 : first_slice
%             ints11p_seg{6}(1:sx,1:sy,i)=ints11p_seg{6}(1:sx,1:sy,i)+s1p_seg{q}(1:sx,1:sy,t);
%             t=t+1;
%         end
%         first_slice=first_slice+1;
%         last_slice=last_slice-1;
%         s=s+1;
%     end
% end
% % %-----------------------------------------------------------------------------------------------
% % %-----------------------------------------------------------------------------------------------
% % %                                    SEGEMENT 7
% % %-----------------------------------------------------------------------------------------------
% t=1;
% for i = 1 : 2 : 71
%     ints11p_seg{7}(1:sx,1:sy,i)=s1p_seg{57}(1:sx,1:sy,t);
%     t=t+1;
% end
% t=1;
% for i = 2 : 2 : 71
%     ints11p_seg{7}(1:sx,1:sy,i)=s1p_seg{59}(1:sx,1:sy,t);
%     t=t+1;
% end
% last_slice = 70;
% first_slice = 1;
% for q = 61 : 2 : 77
%     t=1;
%     s=1;
%     if mod(1,2) == 0
%         for i = first_slice : 2 : last_slice
%             ints11p_seg{7}(1:sx,1:sy,i)=ints11p_seg{7}(1:sx,1:sy,i)+s1p_seg{q}(1:sx,1:sy,t);
%             t=t+1;
%         end
%         s=s-1;
%     else
%         for i = last_slice : 2 : first_slice
%             ints11p_seg{7}(1:sx,1:sy,i)=ints11p_seg{7}(1:sx,1:sy,i)+s1p_seg{q}(1:sx,1:sy,t);
%             t=t+1;
%         end
%         first_slice=first_slice+1;
%         last_slice=last_slice-1;
%         s=s+1;
%     end
% end
% % %-----------------------------------------------------------------------------------------------
% % %-----------------------------------------------------------------------------------------------
% % %                                    SEGEMENT 8
% % %-----------------------------------------------------------------------------------------------
% t=1;
% for i = 1 : 2 : 49
%     ints11p_seg{8}(1:sx,1:sy,i)=s1p_seg{78}(1:sx,1:sy,t);
%     t=t+1;
% end
% t=1;
% for i = 2 : 2 : 49
%     ints11p_seg{8}(1:sx,1:sy,i)=s1p_seg{80}(1:sx,1:sy,t);
%     t=t+1;
% end
% last_slice = 48;
% first_slice = 1;
% for q = 82 : 2 : 98
%     t=1;
%     s=1;
%     if mod(1,2) == 0
%         for i = first_slice : 2 : last_slice
%             ints11p_seg{8}(1:sx,1:sy,i)=ints11p_seg{8}(1:sx,1:sy,i)+s1p_seg{q}(1:sx,1:sy,t);
%             t=t+1;
%         end
%         s=s-1;
%     else
%         for i = last_slice : 2 : first_slice
%             ints11p_seg{8}(1:sx,1:sy,i)=ints11p_seg{8}(1:sx,1:sy,i)+s1p_seg{q}(1:sx,1:sy,t);
%             t=t+1;
%         end
%         first_slice=first_slice+1;
%         last_slice=last_slice-1;
%         s=s+1;
%     end
% end
% % %-----------------------------------------------------------------------------------------------
% % %-----------------------------------------------------------------------------------------------
% % %                                    SEGEMENT 9
% % %-----------------------------------------------------------------------------------------------
% t=1;
% for i = 1 : 2 : 49
%     ints11p_seg{9}(1:sx,1:sy,i)=s1p_seg{79}(1:sx,1:sy,t);
%     t=t+1;
% end
% t=1;
% for i = 2 : 2 : 49
%     ints11p_seg{9}(1:sx,1:sy,i)=s1p_seg{81}(1:sx,1:sy,t);
%     t=t+1;
% end
% last_slice = 48;
% first_slice = 1;
% for q = 83 : 2 : 99
%     t=1;
%     s=1;
%     if mod(1,2) == 0
%         for i = first_slice : 2 : last_slice
%             ints11p_seg{9}(1:sx,1:sy,i)=ints11p_seg{9}(1:sx,1:sy,i)+s1p_seg{q}(1:sx,1:sy,t);
%             t=t+1;
%         end
%         s=s-1;
%     else
%         for i = last_slice : 2 : first_slice
%             ints11p_seg{9}(1:sx,1:sy,i)=ints11p_seg{9}(1:sx,1:sy,i)+s1p_seg{q}(1:sx,1:sy,t);
%             t=t+1;
%         end
%         first_slice=first_slice+1;
%         last_slice=last_slice-1;
%         s=s+1;
%     end
% end
% % %-----------------------------------------------------------------------------------------------
% % %-----------------------------------------------------------------------------------------------
% % %                                    SEGEMENT 10
% % %-----------------------------------------------------------------------------------------------
% t=1;
% for i = 1 : 2 : 27
%     ints11p_seg{10}(1:sx,1:sy,i)=s1p_seg{100}(1:sx,1:sy,t);
%     t=t+1;
% end
% t=1;
% for i = 2 : 2 : 27
%     ints11p_seg{10}(1:sx,1:sy,i)=s1p_seg{102}(1:sx,1:sy,t);
%     t=t+1;
% end
% last_slice = 26;
% first_slice = 1;
% for q = 104 : 2 : 120
%     t=1;
%     s=1;
%     if mod(1,2) == 0
%         for i = first_slice : 2 : last_slice
%             ints11p_seg{10}(1:sx,1:sy,i)=ints11p_seg{10}(1:sx,1:sy,i)+s1p_seg{q}(1:sx,1:sy,t);
%             t=t+1;
%         end
%         s=s-1;
%     else
%         for i = last_slice : 2 : first_slice
%             ints11p_seg{10}(1:sx,1:sy,i)=ints11p_seg{10}(1:sx,1:sy,i)+s1p_seg{q}(1:sx,1:sy,t);
%             t=t+1;
%         end
%         first_slice=first_slice+1;
%         last_slice=last_slice-1;
%         s=s+1;
%     end
% end
% %-----------------------------------------------------------------------------------------------

% %-----------------------------------------------------------------------------------------------
% %                                    SEGEMENT 11
% %-----------------------------------------------------------------------------------------------
% t=1;
% for i = 1 : 2 : 27
%     ints11p_seg{11}(1:sx,1:sy,i)=s1p_seg{101}(1:sx,1:sy,t);
%     t=t+1;
% end
% t=1;
% for i = 2 : 2 : 27
%     ints11p_seg{11}(1:sx,1:sy,i)=s1p_seg{103}(1:sx,1:sy,t);
%     t=t+1;
% end
% last_slice = 26;
% first_slice = 1;
% for q = 105 : 2 : 121
%     t=1;
%     s=1;
%     if mod(1,2) == 0
%         for i = first_slice : 2 : last_slice
%             ints11p_seg{11}(1:sx,1:sy,i)=ints11p_seg{11}(1:sx,1:sy,i)+s1p_seg{q}(1:sx,1:sy,t);
%             t=t+1;
%         end
%         s=s-1;
%     else
%         for i = last_slice : 2 : first_slice
%             ints11p_seg{11}(1:sx,1:sy,i)=ints11p_seg{11}(1:sx,1:sy,i)+s1p_seg{q}(1:sx,1:sy,t);
%             t=t+1;
%         end
%         first_slice=first_slice+1;
%         last_slice=last_slice-1;
%         s=s+1;
%     end
% end
% % %-----------------------------------------------------------------------------------------------











sp11_sino(1:sx,1:sy,1:127)=ints11p_seg{1}(:,:,:);


cd (MFolder)
cd output
fid=fopen('span11_sino.s','w');
fwrite(fid,sp11_sino,'float32');
fclose(fid);

























% % %-----------------------------------------------------------------------------------------------
% add_slice = 32;
% add_slice_p = 33;
% add_slice_m = 31;
% 
% add_zeros_all=zeros(sx,sy,add_slice);
% add_zeros_plus=zeros(sx,sy,add_slice_p);
% add_zeros_minus=zeros(sx,sy,add_slice_m);
% 
% p=0;
% q=0;
% for i = 1 : 11
%     if i == 1
%         ints1p_seg{i}=cat(3,add_zeros_all,s1p_seg{i},add_zeros_all); 
%         ints11p_seg(1:sx,1:sy,1:127)=ints11p_seg(1:sx,1:sy,1:127)+ints1p_seg{i}(1:sx,1:sy,1:127);
%     else
% % %-----------------------------------------------------------------------------------------------
%         if q == 0
%         else
%             clear add_zeros
%             add_slice_p = add_slice_p + 1;
%             add_slice_m = add_slice_m - 1;
%             add_zeros_plus=zeros(sx,sy,add_slice_p);
%             add_zeros_minus=zeros(sx,sy,add_slice_m);
%        
%             q=q-1;
%         end
% % %-----------------------------------------------------------------------------------------------
%         if p == 0
%             ints1p_seg{i}=cat(3,add_zeros_minus,s1p_seg{i},add_zeros_plus);
%             ints11p_seg(1:sx,1:sy,1:127)=ints11p_seg(1:sx,1:sy,1:127)+ints1p_seg{i}(1:sx,1:sy,1:127);
%             p=p+1;
%         else
%             ints1p_seg{i}=cat(3,add_zeros_plus,s1p_seg{i},add_zeros_minus);
%             ints11p_seg(1:sx,1:sy,1:127)=ints11p_seg(1:sx,1:sy,1:127)+ints1p_seg{i}(1:sx,1:sy,1:127);
%             p=p-1;
%             q=q+1;
%         end 
%     end
% end
% % %-----------------------------------------------------------------------------------------------