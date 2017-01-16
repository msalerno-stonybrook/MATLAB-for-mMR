clearvars -except BR_array_bank BR1 BR2 BR3 BR4 BR5 BR6 BR7 BR8 BR9 BR10 BR11 BR12 BR13 BR14 BR15 BR16 BR17 BR18 BR19 BR20 BR21 BR22 BR23 BR24 BR25 BR26 BR27 BR28 BR29 BR30 BR31 BR32 BR33 BR34 BR35 BR36 BR37 BR38 BR39 BR40 BR41 BR42 BR43 BR44 BR45 BR46 BR47 BR48 BR49 BR50 BR51 BR52 BR53 BR54 BR55 BR56 BR57 BR58 BR59 BR60 BR61 BR62 BR63 BR64 BR65 BR66 BR67 BR68 BR69 BR70 BR71 BR72 BR73 BR74 BR75 BR76 BR77 BR78 BR79 BR80 BR81 BR82 BR83 BR84 BR85 BR86 WB ref_img FBP_noiseless_img
close all;
turn_all_calc_on = 1;   % 1 = turn on all calculations, 0 = does nothing (you must select desired calculations)
                        % 5 = AAR_switch only    
% %-----------------------------------------------------------------------------------------------
% %                            STEP 1.)  SET NUMBER OF IMAGE SETS
% %-----------------------------------------------------------------------------------------------
num_img_set = 1; % Select the number of image sets you will be importing
% %-----------------------------------------------------------------------------------------------
PlotSameGraph = 1; % 1=plot each calculation on the same graph for all image sets
                   % 0=plot each calculation on the separate graph for all image sets
                   % If on, use BR_select = 3 ONLY - you dont need to adjust
                   % BR_select, but you need to select the correct BR_num
% %-----------------------------------------------------------------------------------------------
% %                             STEP 2.) SET DIRECTORIES
% %-----------------------------------------------------------------------------------------------
% Specify the folder where the file path of the input images.  You only need to specify the number   
% of files = num_img_set. The others you can leave as is
myFolder = '/Users/Research_Macbook/Desktop/NC_Ideal';         % Must be Noiseless image

myFolder1 = '/Users/Research_Macbook/Desktop/C_test'; 
myFolder2 = '/Users/Research_Macbook/Desktop/C_test2'; 
myFolder3 = '/Users/Research_Macbook/Desktop/C_test3'; 
myFolder4 = '/Users/Research_Macbook/Desktop/C_test4'; 
myFolder5 = '/Users/Research_Macbook/Desktop/NC_Ideal'; 
myFolder6 = '/Users/Research_Macbook/Desktop/NC_Ideal'; 
myFolder7 = '/Users/Research_Macbook/Desktop/NC_Ideal'; 
myFolder8 = '/Users/Research_Macbook/Desktop/NC_Ideal'; 
myFolder9 = '/Users/Research_Macbook/Desktop/NC_Ideal'; 
myFolder10 = '/Users/Research_Macbook/Desktop/NC_Ideal'; 
myFolder11 = '/Users/Research_Macbook/Desktop/NC_Ideal';        
% %-----------------------------------------------------------------------------------------------
% %                                 STEP 3.) SELECT START IMAGE
% %-----------------------------------------------------------------------------------------------
j=10;            % Starting Image Number (sequential images)
inc_num=10;      % Increment Image Number (ex: inc_num=10 will select every 10 images in the sequence)
end_iter =100;   % Ending Iteration (the file image number in the sequence)
% %-----------------------------------------------------------------------------------------------
% %                           STEP 4.)  SELECT ATLAS BRAIN REGIONS
% %-----------------------------------------------------------------------------------------------
Use_ATLAS = 1;             % [1]=use Brain ATLAS Regions, [2]=use other VOI(s) 
                           % [0]=use whole image
                           % *** If [0] or [3], ignore the 3 switches below
    BR_select = 3;         % Select Region Grouping [1] All (1-87)
                           %                        [2] Left and Right combined (1-46)
                           %                        [3] Common Regions (1-8)   
    MultiPlot_Switch = 0;  % This selects all the regions in BR_select: [0]=off, [1]=on 
    BR_num = {1,3,5,8};  % Select all the regions you want to compare using BR number ex: BR_num = {1,2,3}
                       % This is also used for the VOI switch. VOIs are
                       % numbered 1 - n ex: {1,2,3,4}
                       
    BR_name_bank={'First VOI','Second VOI'};      % This is ONLY USED for the VOI switch, its cleared automatically otherwise
% %-----------------------------------------------------------------------------------------------
% %                            STEP 5.)  SELECT CALCULATIONS
% %-----------------------------------------------------------------------------------------------
PD_switch = 1;        % 1=include PD from previous iteration, 0=exclude PD from previous iteration
PDref_switch = 1;     % 1=include PD from Reference image, 0=exclude PD from Reference image    
PDFBP_switch = 1;     % 1=include PD from single FBP image, 0=exclude PD from single FBP image     
TA_switch = 1;        % 1=include Total Activity of Image, 0=exclude Total Activity of Image
TAR_switch = 0;       % 1=include Total Activity of Region, 0=exclude Total Activity of Region
AAR_switch = 1;       % 1=include Average Activity of Region, 0=exclude Average Activity of Region
SDR_switch = 0;       % 1=include Standard Deviation of Region, 0=exclude Standard Deviation of Region
%debug_switch = 1;
% %-----------------------------------------------------------------------------------------------
% %                            STEP 6.)  CREATE FBP OR ATLAS REFERENCE DATA?
% %-----------------------------------------------------------------------------------------------
% % This will add an array of a single FBP or ATLAS image = number of iterations selected
% % so that it can be plotted with the rest of the iterative reconstruction images
Plot_FBP_data = 1;
Plot_ATLASref_data = 0;
% %-----------------------------------------------------------------------------------------------
% %                            STEP 7.)  AVERAGE ALL NOISE REALIZATIONS?
% %-----------------------------------------------------------------------------------------------
Average_All_Noise_Realizations = 0;         % Averages all noise realizations provided, and plots as a single array.
    Plot_with_Noise_Realizations = 0;       % Plot the average along with the other nosie realizations

    
Setup_Test_Parameters % This script has the rest of the parameters