% %-----------------------------------------------------------------------------------------------
sxy = 344;      % This sets the image size
sz = 127;    
% %-----------------------------------------------------------------------------------------------
img_set_name = {'Noiseless','Noise 1', 'Noise 2','Noise 3','Noise 4','Noise 5','Noise 6','Noise 7','Noise 8','Noise 9','Noise 10','FBP'};
% Right now this is just used for num_img_set > 1.  This can be used to append legend
% Legends names with an additional string *** must be equal to num_img_set
% %-----------------------------------------------------------------------------------------------
custom_iter_switch = 0;    % Use this if the number of iterations is not sequential
    custom_iter = [10 20 30 40 50 60 70 80 90 100]; 
% %-----------------------------------------------------------------------------------------------
set_xlabel='Iteration'; % Set label of x-axis for all plots
% %-----------------------------------------------------------------------------------------------

% %-----------------------------------------------------------------------------------------------


% %-----------------------------------------------------------------------------------------------


% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------
num_iter_imgs = ((end_iter-j) / inc_num)+1;
if turn_all_calc_on == 1
    PD_switch = 1;        
    PDref_switch = 1; 
    PDFBP_switch = 1;
    TA_switch = 1;        
    TAR_switch = 1;       
    AAR_switch = 1;       
    SDR_switch = 1;
    Plot_FBP_data = 1;
    Plot_ATLASref_data = 0;
    Average_All_Noise_Realizations = 1;
    Plot_with_Noise_Realizations = 1;
else
end
if turn_all_calc_on == 5
    PD_switch = 0;        
    PDref_switch = 0;
    PDFBP_switch = 0;
    TA_switch = 0;        
    TAR_switch = 0;       
    AAR_switch = 1;       
    SDR_switch = 0;
    Plot_FBP_data = 1;
    Plot_ATLASref_data = 1;
    Average_All_Noise_Realizations = 1;
    Plot_with_Noise_Realizations = 1;
else
end
if num_img_set == 1
    Average_All_Noise_Realizations = 0;      
    Plot_with_Noise_Realizations = 0;  
end

if Use_ATLAS == 2
else
    clear BR_name_bank  % Clears the name bank called above in this script if you are not using custom regions
end
if Use_ATLAS == 0
    MultiPlot_Switch = 0;
    BR_num = {1};
else
end
M_Folder=pwd;
cd ATLAS
cd Brain_Regions
BR_Folder=pwd;
cd ..
cd Scripts
Convergence_test_v1_7