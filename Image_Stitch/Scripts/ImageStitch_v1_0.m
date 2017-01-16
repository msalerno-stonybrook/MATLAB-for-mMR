cd ..
cd input

if Inveon_Pigeon_switch == 1
% %---------------------------------------------------------------------------------------------------------
% %                                      PIGEON PROCESSING
% %---------------------------------------------------------------------------------------------------------
% %---------------------------------------------------------------------------------------------------------
% %                                  INVERT FIRST BED POSITION
% %---------------------------------------------------------------------------------------------------------
        fid=fopen(IMAGE1);
        bed_position1_q=fread(fid,'float32');
        fclose(fid);
        bed_position1_s = reshape(bed_position1_q, 128, 128, 159, frame_num); 
        bed_position1_frame_select = bed_position1_s(:,:,:,frame_num);
       if Invert_BP == 1 
            % % Rotate the image
            bed_position1_r = reshape(bed_position1_frame_select, 128, 128, 159); 
            bed_position1_t = flip(bed_position1_r, 3);
       end
       if Invert_BP == 3 
            % % Rotate the image
            bed_position1_r = reshape(bed_position1_frame_select, 128, 128, 159); 
            bed_position1_t = flip(bed_position1_r, 3);
       end
       if Invert_BP == 0
             bed_position1_t = reshape(bed_position1_frame_select, 128, 128, 159);
       end
       if Invert_BP == 2
             bed_position1_t = reshape(bed_position1_frame_select, 128, 128, 159);
       end       
% %---------------------------------------------------------------------------------------------------------
% %---------------------------------------------------------------------------------------------------------
% %                                  DO NOT INVERT OTHER BED POSITIONS
% %---------------------------------------------------------------------------------------------------------
    % % Image 2
    fid1=fopen(IMAGE2);
    bed_position2_q=fread(fid1,'float32');
    fclose(fid1);
    bed_position2_t = reshape(bed_position2_q, 128, 128, 159); 

    % % Image 3
    fid2=fopen(IMAGE3);
    bed_position3_q=fread(fid2,'float32');
    fclose(fid2);
    bed_position3_t = reshape(bed_position3_q, 128, 128, 159); 
 % %---------------------------------------------------------------------------------------------------------
 % %---------------------------------------------------------------------------------------------------------
% %                                           SCALE FACTOR
% %---------------------------------------------------------------------------------------------------------
% % The following was used to make the stitched image look nice.  This is not a decay correction!

% % % TEST SCALE FACTOR: USED JUST TO MAKE THE IMAGES LOOK NICE
% % bed_position1_t = reshape(bed_position1_t, 128, 128, 159); 
% % mean_activity_bp1=mean(bed_position1_t(:));
% % bed_position2_t = reshape(bed_position2_t, 128, 128, 159);
% % mean_activity_bp2=mean(bed_position2_t(:));
% % bed_position3_t = reshape(bed_position3_t, 128, 128, 159);
% % mean_activity_bp3=mean(bed_position3_t(:));

% % % Scale factor
% % scale_factor1=rdivide(mean_activity_bp1,mean_activity_bp2);
% % bed_position2_s = bed_position2_s(:,:,:).* scale_factor1;
% % scale_factor2=rdivide(mean_activity_bp1,mean_activity_bp3);
% % bed_position3_s = bed_position3_s(:,:,:).* scale_factor2;

% % % Scale factor x2
% % scale_factor1=rdivide(mean_activity_bp1,mean_activity_bp2);
% % bed_position2_s = bed_position2_s(:,:,:).* (scale_factor1 .* 2);
% % scale_factor2=rdivide(mean_activity_bp1,mean_activity_bp3);;
% % bed_position3_s = bed_position3_s(:,:,:).* (scale_factor2 .*2);
% %---------------------------------------------------------------------------------------------------------

% Using David's Excel sheet for Decay Correction Factors
scale_factor1=5.001;
bed_position2_t = bed_position2_t(:,:,:).* scale_factor1;
scale_factor2=5.327;
bed_position3_t = bed_position3_t(:,:,:).* scale_factor2;
% %---------------------------------------------------------------------------------------------------------
% %---------------------------------------------------------------------------------------------------------
% %                                 CREATE STITCHED IMAGE
% %---------------------------------------------------------------------------------------------------------
if Invert_BP == 1
    mat1=zeros(128, 128, 477);
    mat1(:,:,1:125) = bed_position1_t(:,:,1:125);
    mat1(:,:,126:159) = (bed_position1_t(:,:,126:159) + bed_position2_t(:,:,1:34)) / 2;
    mat1(:,:,160:250) = bed_position2_t(:,:,35:125);
    mat1(:,:,251:284) = (bed_position2_t(:,:,126:159) + bed_position3_t(:,:,1:34)) / 2;
    mat1(:,:,285:409) = bed_position3_t(:,:,35:159);
end
if Invert_BP == 2
    mat1=zeros(128, 128, 477);
    mat1(:,:,1:125) = bed_position1_t(:,:,1:125);
    mat1(:,:,126:159) = (bed_position1_t(:,:,126:159) + bed_position2_t(:,:,1:34)) / 2;
    mat1(:,:,160:250) = bed_position2_t(:,:,35:125);
    mat1(:,:,251:284) = (bed_position2_t(:,:,126:159) + bed_position3_t(:,:,1:34)) / 2;
    mat1(:,:,285:409) = bed_position3_t(:,:,35:159);
end
if Invert_BP == 0
    mat1=zeros(128, 128, 477);
    bed_position1_t = flip(bed_position1_t, 3);
    bed_position2_t = flip(bed_position2_t, 3);
    bed_position3_t = flip(bed_position3_t, 3);
    mat1(:,:,1:125) = bed_position3_t(:,:,1:125);
    mat1(:,:,126:159) = (bed_position3_t(:,:,126:159) + bed_position2_t(:,:,1:34)) / 2;
    mat1(:,:,160:250) = bed_position2_t(:,:,35:125);
    mat1(:,:,251:284) = (bed_position2_t(:,:,126:159) + bed_position1_t(:,:,1:34)) / 2;
    mat1(:,:,285:409) = bed_position1_t(:,:,35:159);
 end
 if Invert_BP == 3
    mat1=zeros(128, 128, 477);
    bed_position1_t = flip(bed_position1_t, 3);
    bed_position2_t = flip(bed_position2_t, 3);
    bed_position3_t = flip(bed_position3_t, 3);
    mat1(:,:,1:125) = bed_position3_t(:,:,1:125);
    mat1(:,:,126:159) = (bed_position3_t(:,:,126:159) + bed_position2_t(:,:,1:34)) / 2;
    mat1(:,:,160:250) = bed_position2_t(:,:,35:125);
    mat1(:,:,251:284) = (bed_position2_t(:,:,126:159) + bed_position1_t(:,:,1:34)) / 2;
    mat1(:,:,285:409) = bed_position1_t(:,:,35:159);
 end
% %---------------------------------------------------------------------------------------------------------
% %---------------------------------------------------------------------------------------------------------
cd ..
cd output
cur_path=pwd;
fid=fopen('Stitched.img','w');
fwrite(fid, mat1, 'float32');
fclose(fid);
cd ..
cd Headers
cd Pigeon_Bed_Stitch
copyfile('Stitched.hdr',cur_path);
cd ../..
end % ends Pigeon Processing
% %---------------------------------------------------------------------------------------------------------
% %---------------------------------------------------------------------------------------------------------
% %---------------------------------------------------------------------------------------------------------
if Inveon_Pigeon_switch == 0
% %---------------------------------------------------------------------------------------------------------
% %                                     OTHER IMAGE PROCESSING
% %---------------------------------------------------------------------------------------------------------   
fid=fopen(IMAGE1);
img1=fread(fid,'float32');
fclose(fid);    
img1=reshape(img1,sxy,sxy,sz);   
    
fid=fopen(IMAGE2);
img2=fread(fid,'float32');
fclose(fid);   
img2=reshape(img2,sxy,sxy,sz); 

% %---------------------------------------------------------------------------------------------------------
% %                                     GET SECTION OF SECOND IMAGE
% %---------------------------------------------------------------------------------------------------------
img2_section = zeros(sxy,sxy,sz);
img1_plus_img2_sec = zeros(sxy,sxy,sz);
smoothed_img2_q = zeros(sxy,sxy,sz);
Final_Image = zeros(sxy,sxy,sz);

for i = slice_f + 1 : sz
    img2_section(:,:,i) = img2(:,:,i);
end
% %---------------------------------------------------------------------------------------------------------
% %---------------------------------------------------------------------------------------------------------
% %                                     CREATE EXTENDED IMAGE
% %---------------------------------------------------------------------------------------------------------
for i = 1:numel(img1)
    if img1(i) > 0
        img1_plus_img2_sec(i)=img1(i);
        else if img1(i) < 0
            img1_plus_img2_sec(i)=img1(i);
        else
            img1_plus_img2_sec(i)=img1(i) + img2_section(i);
            end 
    end
end
% %---------------------------------------------------------------------------------------------------------
% %---------------------------------------------------------------------------------------------------------
% %                         BLURR mMR UMAP UNTIL IT CAN BE USED FOR SUBTRACTION
%                                       (Used For mMR only)
% %---------------------------------------------------------------------------------------------------------
if CT_Umap_Switch == 1
    sigma = 1;
    smoothed_img2 = imgaussfilt3(img2, sigma);
    smoothed_img2=reshape(smoothed_img2,sxy,sxy,sz);
    for j = 1: numel(img1)
        if smoothed_img2(j) > 0
            smoothed_img2_q(j) = 1;
        else
            smoothed_img2_q(j) = 0;
        end 
    end
% %---------------------------------------------------------------------------------------------------------
% %---------------------------------------------------------------------------------------------------------
% %                                    CREATE FINAL IMAGE
% %---------------------------------------------------------------------------------------------------------
    Final_Image(:,:,:) = img1_plus_img2_sec(:,:,:) .* smoothed_img2_q(:,:,:);
else
    Final_Image(:,:,:) = img1_plus_img2_sec(:,:,:);
end

% %---------------------------------------------------------------------------------------------------------
% %---------------------------------------------------------------------------------------------------------
% %                                    WRITE FINAL IMAGE
% %---------------------------------------------------------------------------------------------------------
cd ..
cd output
cur_path=pwd;
fid=fopen('Input-LM-00-umap-CT.v','w');
fwrite(fid, Final_Image, 'float32');
fclose(fid);
cd ..
cd Headers
cd Umap_extend

copyfile('CT_umap_extended-MAC.hdr',cur_path);
copyfile('Input-LM-00-umap-CT.v.hdr',cur_path);
cd ../..
% %---------------------------------------------------------------------------------------------------------       
end % ends other processing
% %---------------------------------------------------------------------------------------------------------   
