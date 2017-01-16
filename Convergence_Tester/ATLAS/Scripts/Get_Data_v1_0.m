% %-----------------------------------------------------------------------------------------------
sum_switch = PD_switch + PDref_switch + TA_switch + TAR_switch + AAR_switch + SDR_switch + PDFBP_switch;
% %-----------------------------------------------------------------------------------------------
% %                                     SETUP EMPTY PLOT ARRAY
% %-----------------------------------------------------------------------------------------------
for q = 1 : num_img_set
    t = 1;
    if PD_switch == 1
        for BR = 1 : length(MR_img_set_data{1}{1})              
            for d = 1 : length(MR_img_set_data{1}{1}{1})        % For the number of data points for PD
                img_set_plot{q}{t}{BR}(d)=0;                    % Fill with zeros
            end %end of d loop
        end %end of BR loop
        t=t+1;
    end %end PD_switch
    for t = t : sum_switch                                  % For the number of switches turned on
        for BR = 1 : length(MR_img_set_data{1}{1})          
            for d = 1 : length(MR_img_set_data{1}{2}{1})    % For the number of data points for other calculations
                img_set_plot{q}{t}{BR}(d)=0;                % Fill with zeros
            end %end of d loop
        end %end of BR loop
    end %end of t loop  
end %end of q loop
% %-----------------------------------------------------------------------------------------------
% %                     FILL PLOT WITH DATA FROM SELECTED CALCULATIONS
% %-----------------------------------------------------------------------------------------------
for q = 1 : num_img_set
    t = 1;
    if PD_switch == 1
        for BR = 1 : length(MR_img_set_data{1}{1})                   
                img_set_plot{q}{t}{BR}=MR_img_set_data{q}{1}{BR}; 
        end %end of BR loop
        t=t+1;
    end %end PD_switch
% %-----------------------------------------------------------------------------------------------
    if PDref_switch == 1
        for BR = 1 : length(MR_img_set_data{1}{1})          
                img_set_plot{q}{t}{BR}=MR_img_set_data{q}{2}{BR};          
        end %end of BR loop
        t=t+1;
    end %end of PDref_switch
% %-----------------------------------------------------------------------------------------------
    if TA_switch == 1
        for BR = 1 : length(MR_img_set_data{1}{1})          
                img_set_plot{q}{t}{BR}=MR_img_set_data{q}{3}{BR};          
        end %end of BR loop
        t=t+1;
    end %end of TA_switch
% %-----------------------------------------------------------------------------------------------
    if TAR_switch == 1
        for BR = 1 : length(MR_img_set_data{1}{1})          
                img_set_plot{q}{t}{BR}=MR_img_set_data{q}{4}{BR};          
        end %end of BR loop
        t=t+1;
    end %end of TAR_switch
% %-----------------------------------------------------------------------------------------------
    if AAR_switch == 1
        for BR = 1 : length(MR_img_set_data{1}{1})          
                img_set_plot{q}{t}{BR}=MR_img_set_data{q}{5}{BR};          
        end %end of BR loop
        t=t+1;
    end %end of AAR_switch
% %-----------------------------------------------------------------------------------------------
    if SDR_switch == 1
        for BR = 1 : length(MR_img_set_data{1}{1})          
                img_set_plot{q}{t}{BR}=MR_img_set_data{q}{6}{BR};          
        end %end of BR loop
        t=t+1;
    end %end of SDR_switch
% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------
    if PDFBP_switch == 1
        for BR = 1 : length(MR_img_set_data{1}{1})          
                img_set_plot{q}{t}{BR}=MR_img_set_data{q}{7}{BR};          
        end %end of BR loop
        t=t+1;
    end %end of PDref_switch
% %-----------------------------------------------------------------------------------------------
end %end of q loop
% %-----------------------------------------------------------------------------------------------

Plot_Results_v2_0