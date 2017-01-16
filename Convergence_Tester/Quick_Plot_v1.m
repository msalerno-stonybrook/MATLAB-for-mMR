clear BR_array BR_name_array BR_reselect 
close all;
% Quick Plot only works if you have loaded in all brain regions for any of
% the Brain region lists.
% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------
PlotSameGraph = 1; % 1=plot each calculation on the same graph for all image sets
                   % 0=plot each calculation on the separate graph for all image sets  
% %-----------------------------------------------------------------------------------------------
num_img_set = 2;   % Set the number of image sets that you would like to plot
                   % If you included the ATLAS and FBP array, two
                   % additional image sets have been added to the the top of
                   % original image sets
% %-----------------------------------------------------------------------------------------------
BR_reselect_all = 0; % This will reselect all of the brain regions again


BR_reselect = {1,2,3};
% %-----------------------------------------------------------------------------------------------











% %-----------------------------------------------------------------------------------------------
BR_start=1;
for i = 1 : length(BR_array_all)
    BR_increment{i} = 1;
end
% %-----------------------------------------------------------------------------------------------
if BR_reselect_all == 1
clear BR_reselect
    for i = 1 : length(BR_array_all)
        BR_reselect{i}=i;
    end
end
% %-----------------------------------------------------------------------------------------------
    for i = 1 : length(BR_array_all)
        BR_select2{i}=0;
    end
    for i = 1 : length(BR_reselect)
        BR_select2{BR_reselect{i}}=1;
    end
% %-----------------------------------------------------------------------------------------------
BR_select2_sum = 0;
for i = 1 : length(BR_select2)
   BR_select2_sum=BR_select2_sum+BR_select2{i};
end

BR_array = BR_array_all;

for i = 1 : length(BR_reselect)
BR_name_array{i} = BR_name_array_all{BR_reselect{i}};
end
% %-----------------------------------------------------------------------------------------------
cd ATLAS
cd Scripts
Plot_Results_v2_0