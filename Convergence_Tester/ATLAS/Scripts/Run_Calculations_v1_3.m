% %-----------------------------------------------------------------------------------------------
% %                                     SETUP EMPTY PLOT ARRAY
% %-----------------------------------------------------------------------------------------------
for q = 1 : num_img_set
    for BR = 1 : length(BR_array)                         % For the number of brain regions
        for d = 1 : length(img_set_data{1}{2})        % For the number of data points for PD
            MR_img_set_data{q}{BR}{1}(d)=0;              % Fill with zeros
        end %end of d loop
    end %end of BR loop
    for t = 2 : 7
        for BR = 1 : length(BR_array)              % For the number of brain regions
            for d = 1 : length(img_set_data{1}{3})        % For the number of data points for PD
                MR_img_set_data{q}{BR}{t}(d)=0;                    % Fill with zeros
            end %end of d loop
        end %end of BR loop
    end %end of t loop
end %end of q loop
% %-----------------------------------------------------------------------------------------------
% %                                     RUN CALCULATIONS
% %-----------------------------------------------------------------------------------------------
for q = 1 : num_img_set
% %-----------------------------Create Additional Placeholder Array-------------------------------
for BR = 1 : length(BR_array)
    for d = 1 : length(img)-1
        MR_PD_matrix{BR}(d)=0;
    end %end d loop
end %end k loop
for BR = 1 : length(BR_array)
    for d = 1 : length(img)
        MR_PDref_matrix{BR}(d)=0;
        MR_TA_matrix{BR}(d)=0;
        MR_TAR_matrix{BR}(d)=0;
        MR_AAR_matrix{BR}(d)=0;
        MR_SDR_matrix{BR}(d)=0;
        MR_PDFBP_matrix{BR}(d)=0;
    end %end d loop
end %end k loop
% %-----------------------------------------------------------------------------------------------
for BR = 1 : length(BR_array)
    for k = 1 : length(img_set_data{1}{1})
% %-----------------------------------------------------------------------------------------------
        mask1 = (img_set_data{q}{1}{k}(1:sxy,1:sxy,1:sz).*BR_array{BR}(1:sxy,1:sxy,1:sz));
        numb_elem = sum(sum(sum(BR_array{BR}(1:sxy,1:sxy,1:sz))));
        mask_elem = find(BR_array{BR}==1);
        temp_array{k}(1:numb_elem)= img_set_data{q}{1}{k}(mask_elem);
% %-----------------------------------------------------------------------------------------------
        if k == 1 % Percent Difference from Previous Iteration
        else
            if PD_switch == 1
                PD_matrix(k-1)=((temp_array{k}-temp_array{k-1}) / temp_array{k-1})*100;
            end 
        end
% %-----------------------------------------------------------------------------------------------
        if PDref_switch == 1 % Percent Difference from Reference Image
            temp_array2{k}(1:numb_elem)= ref_img(mask_elem);
            PDref_matrix(k)=((temp_array{k}-temp_array2{k}) / temp_array2{k})*100;
        end 
% %-----------------------------------------------------------------------------------------------
        if TA_switch == 1  % Total Activity of Whole Image %
        TA_matrix(k)=sum(sum(sum(img_set_data{q}{1}{k}(1:sxy,1:sxy,1:sz))));
        end 
% %-----------------------------------------------------------------------------------------------
        if TAR_switch == 1 % Total Activity of Region %
            TAR_matrix(k)=sum(sum(sum(mask1)));
        end 
% %-----------------------------------------------------------------------------------------------
        if AAR_switch == 1 % Averaged Activity of Region % 
            AAR_matrix(k)=mean(temp_array{k});
        end
% %-----------------------------------------------------------------------------------------------
        if SDR_switch == 1 % Standard Deviation of Region %
            SDR_matrix(k)= std(temp_array{k});  
        end 
% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------
        if PDFBP_switch == 1 % Percent Difference from FBP Image
            temp_arrayFBP{k}(1:numb_elem)= FBP_noiseless_img(mask_elem);
            PDFBP_matrix(k)=((temp_array{k}-temp_arrayFBP{k}) / temp_arrayFBP{k})*100;
        end 
% %-----------------------------------------------------------------------------------------------
    end %end of for k loop
% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------
% %                       BUILD MULTI-BRAIN-REGION MATRIX FOR EACH OPERATION 
% %-----------------------------------------------------------------------------------------------
    if PD_switch == 1
            MR_PD_matrix{BR} = PD_matrix;
    end
    if PDref_switch == 1
            MR_PDref_matrix{BR} = PDref_matrix;
    end
    if TA_switch == 1
            MR_TA_matrix{BR} = TA_matrix;
    end
    if TAR_switch == 1
            MR_TAR_matrix{BR} = TAR_matrix;
    end
    if AAR_switch == 1
            MR_AAR_matrix{BR} = AAR_matrix;
    end
    if SDR_switch == 1
        MR_SDR_matrix{BR} = SDR_matrix;
    end 
    if PDFBP_switch == 1
            MR_PDFBP_matrix{BR} = PDFBP_matrix;
    end
% %-----------------------------------------------------------------------------------------------
% %                         BUILD MATRIX WITH EACH OPERATION MATRIX
% %-----------------------------------------------------------------------------------------------
    MR_img_set_data{q}={MR_PD_matrix,MR_PDref_matrix,MR_TA_matrix,MR_TAR_matrix,MR_AAR_matrix,MR_SDR_matrix,MR_PDFBP_matrix};
% %-----------------------------------------------------------------------------------------------    
end %end BR loop
% %----------------------------------------------------------------------------------------------
clear mask1 numb_elem mask_elem temp_array temp_array2 temp_arrayFBP
% %----------------------------------------------------------------------------------------------
end %end for num_img_set
% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------
m = 1;
Get_Data_v1_0