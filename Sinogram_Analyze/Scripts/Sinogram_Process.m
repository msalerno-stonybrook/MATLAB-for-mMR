% %---------------------------------------CONSTANTS----------------------------------------------
sx = 344;
sy = 252;
sz = 837; 
sz2 = 1674;
% % %---------------------------------------------------------------------------------------------------------
% %                                          IMPORT SINOGRAMS
% %---------------------------------------------------------------------------------------------------------
cd (myFolder)
% %------------------------------------------FOR E7 TOOLS DEBUG OUTPUT-----------------------------------------------
if File_Status == 0
    if NumSinos == 1
        fid = fopen('acf_second_00.a');
        acf_q = fread(fid,'float32');
        fclose(fid);
        acf_s = reshape(acf_q, sx, sy, sz); 
        acf_s = acf_s(:,:,:) - 1;

        fid = fopen('emis_00.s');
        emis_q = fread(fid,'float32');
        fclose(fid);
        emis_s = reshape(emis_q, sx, sy, sz2); 
        prompts_q = emis_s(:,:,1:sz);
        randoms_q = emis_s(:,:,(sz+1):sz2);
        trues_q = prompts_q(:,:,:) - randoms_q(:,:,:);
        
        if Scatter_switch==1
            fid = fopen('MATLAB_output_forSTIR_ISSRB/sino-scat_00.s');
            scat_q = fread(fid,'float32');
            fclose(fid);
            scat_s = reshape(acf_q, sx, sy, sz); 
        else
            scat_s = zeros(sx,sy,sz);
        end
    end
    cd (MFolder2)
    cd Scripts
        Sum_Radial_Bins
    cd (myFolder)
% %-----------------------------------------------------------------------------------------------
    SinoMatrix={prompts_q_sum, randoms_q_sum, trues_q_sum, acf_s_sum, scat_s_sum};
    SinoMatrix_q{1}=SinoMatrix;
    SinoNameMatrix={'Prompts','Randoms','Trues','ACF','Scatter'};
% %-----------------------------------------------------------------------------------------------
loop_out1 = 0;
n=1;
for k = 1 : length(acf_s_sum)
    if loop_out1 == 0
        if acf_s_sum(k) >= 1
            loop_out1 = 1;
            left_lim = n;
        end
    n=n+1;    
    end
end
loop_out2 = 0;
m=n;
for l = n : length(acf_s_sum)
    if loop_out2 == 0
        if acf_s_sum(l) == 0
            loop_out2 = 1;
            right_lim = m-1;
       end    
   end 
   m=m+1;
end
% %-----------------------------------------------------------------------------------------------
bar1 = zeros(sx,1);
for i = left_lim:right_lim
bar1(i,1) = 1000000000;
end
% %---------------------------------------------------------------------------------------------------------
end
% %---------------------------------------------------------------------------------------------------------
% %------------------------------------------FOR SELECT FILES-----------------------------------------------
% %---------------------------------------------------------------------------------------------------------
if File_Status == 1
% %------------------------------------------For One Sinogram-----------------------------------------------
    if NumSinos == 1
        fid = fopen(Sino1_name);
        emis_q = fread(fid,'float32');
        fclose(fid);
        emis_s = reshape(emis_q, sx, sy, sz2); 
        prompts_q = emis_s(:,:,1:sz);
        randoms_q = emis_s(:,:,(sz+1):sz2);
        trues_q = prompts_q(:,:,:) - randoms_q(:,:,:);

        if ACF_switch == 1
            fid = fopen(ACF1_name);
            acf_q = fread(fid,'float32');
            fclose(fid);
            acf_s = reshape(acf_q, sx, sy, sz); 
            acf_s = acf_s(:,:,:) - 1;
        else
            acf_s = zeros(sx, sy, sz); 
        end
        
    if Scatter_switch == 1
        fid = fopen(Scat1_name);
        scat_q = fread(fid,'float32');
        fclose(fid);
        scat_s = reshape(acf_q, sx, sy, sz); 
    else
        scat_s = zeros(sx, sy, sz); 
    end
        cd (MFolder2)
    cd Scripts
        Sum_Radial_Bins
    cd (myFolder)
% %-----------------------------------------------------------------------------------------------
    SinoMatrix={prompts_q_sum, randoms_q_sum, trues_q_sum, acf_s_sum, scat_s_sum};
    SinoMatrix_q{1}=SinoMatrix;
    SinoNameMatrix={'Prompts','Randoms','Trues','ACF','Scatter'};
% %-----------------------------------------------------------------------------------------------
loop_out1 = 0;
n=1;
for k = 1 : length(acf_s_sum)
    if loop_out1 == 0
        if acf_s_sum(k) >= 1
            loop_out1 = 1;
            left_lim = n;
        end
    n=n+1;    
    end
end
loop_out2 = 0;
m=n;
for l = n : length(acf_s_sum)
    if loop_out2 == 0
        if acf_s_sum(l) == 0
            loop_out2 = 1;
            right_lim = m-1;
       end    
   end 
   m=m+1;
end
% %-----------------------------------------------------------------------------------------------
loop_out1 = 0;
n=1;
for k = 1 : length(acf_s_sum)
    if loop_out1 == 0
        if acf_s_sum(k) >= 1
            loop_out1 = 1;
            left_lim = n;
        end
    n=n+1;    
    end
end
loop_out2 = 0;
m=n;
for l = n : length(acf_s_sum)
    if loop_out2 == 0
        if acf_s_sum(l) == 0
            loop_out2 = 1;
            right_lim = m-1;
       end    
   end 
   m=m+1;
end
% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------
% % Draw lines on graph for end of ACF, this needs to be adjust to go automatically
bar1 = zeros(sx,1);
for i = left_lim:right_lim
bar1(i,1) = 1000000000;
end
% %---------------------------------------------------------------------------------------------------------
    end
% %---------------------------------------------------------------------% %    
    if NumSinos == 2
% %------------------------------------------For Two Sinograms-----------------------------------------------
        i = 1;
% %-------------------------Sinogram 1----------------------------------% %        
        fid = fopen(Sino1_name);
        emis_q = fread(fid,'float32');
        fclose(fid);
        emis_s = reshape(emis_q, sx, sy, sz2); 
        prompts_q = emis_s(:,:,1:sz);
        randoms_q = emis_s(:,:,(sz+1):sz2);
        trues_q = prompts_q(:,:,:) - randoms_q(:,:,:);

        if ACF_switch == 1
            fid = fopen(ACF1_name);
            acf_q = fread(fid,'float32');
            fclose(fid);
            acf_s = reshape(acf_q, sx, sy, sz); 
            acf_s = acf_s(:,:,:) - 1;
        else
            acf_s = zeros(sx, sy, sz); 
        end
        
    if Scatter_switch == 1
        fid = fopen(Scat1_name);
        scat_q = fread(fid,'float32');
        fclose(fid);
        scat_s = reshape(acf_q, sx, sy, sz); 
    else
        scat_s = zeros(sx, sy, sz); 
    end
    cd (MFolder2)
    cd Scripts
        Sum_Radial_Bins
        prompts_q_sum2=prompts_q_sum;
    cd (myFolder)
% %-----------------------------------------------------------------------------------------------
    SinoMatrix={prompts_q_sum, randoms_q_sum, trues_q_sum, acf_s_sum, scat_s_sum};
    SinoMatrix_q{1}=SinoMatrix;
    SinoNameMatrix={'Prompts','Randoms','Trues','ACF','Scatter'};
% %-----------------------------------------------------------------------------------------------
loop_out1 = 0;
n=1;
for k = 1 : length(acf_s_sum)
    if loop_out1 == 0
        if acf_s_sum(k) >= 1
            loop_out1 = 1;
            left_lim = n;
        end
    n=n+1;    
    end
end
loop_out2 = 0;
m=n;
for l = n : length(acf_s_sum)
    if loop_out2 == 0
        if acf_s_sum(l) == 0
            loop_out2 = 1;
            right_lim = m-1;
       end    
   end 
   m=m+1;
end
% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------
% % Draw lines on graph for end of ACF, this needs to be adjust to go automatically
bar1 = zeros(sx,1);
for i = left_lim:right_lim
bar1(i,1) = 1000000000;
end
% %---------------------------------------------------------------------------------------------------------
% %---------------------------------------------------------------------% %    
% %-------------------------Sinogram 2----------------------------------% %
cd (myFolder2)
    fid = fopen(Sino2_name);
        emis_q = fread(fid,'float32');
        fclose(fid);
        emis_s = reshape(emis_q, sx, sy, sz2); 
        prompts_q = emis_s(:,:,1:sz);
        randoms_q = emis_s(:,:,(sz+1):sz2);
        trues_q = prompts_q(:,:,:) - randoms_q(:,:,:);

        if ACF_switch == 1
            fid = fopen(ACF2_name);
            acf_q = fread(fid,'float32');
            fclose(fid);
            acf_s = reshape(acf_q, sx, sy, sz); 
            acf_s = acf_s(:,:,:) - 1;
        else
            acf_s = zeros(sx, sy, sz); 
        end
        
    if Scatter_switch == 1
        fid = fopen(Scat2_name);
        scat_q = fread(fid,'float32');
        fclose(fid);
        scat_s = reshape(acf_q, sx, sy, sz); 
    else
        scat_s = zeros(sx, sy, sz); 
    end 
    cd (MFolder2)
    cd Scripts
        Sum_Radial_Bins
    cd (myFolder2)
% %-----------------------------------------------------------------------------------------------
    SinoMatrix={prompts_q_sum, randoms_q_sum, trues_q_sum, acf_s_sum, scat_s_sum};
    SinoMatrix_q{2}=SinoMatrix;
    SinoNameMatrix={'Prompts','Randoms','Trues','ACF','Scatter'};
% %-----------------------------------------------------------------------------------------------
loop_out1 = 0;
n=1;
for k = 1 : length(acf_s_sum)
    if loop_out1 == 0
        if acf_s_sum(k) >= 1
            loop_out1 = 1;
            left_lim = n;
        end
    n=n+1;    
    end
end
loop_out2 = 0;
m=n;
for l = n : length(acf_s_sum)
    if loop_out2 == 0
        if acf_s_sum(l) == 0
            loop_out2 = 1;
            right_lim = m-1;
       end    
   end 
   m=m+1;
end
% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------
% % Draw lines on graph for end of ACF, this needs to be adjust to go automatically
bar2 = zeros(sx,1);
for i = left_lim:right_lim
bar2(i,1) = 1000000000;
end
% %---------------------------------------------------------------------------------------------------------
    cd (myFolder)
    end
end

cd (MFolder2)
cd Scripts
Plot_Results
 
