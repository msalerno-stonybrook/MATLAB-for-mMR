clear all;
close all;
clc;
% This will will sum all of the counts for each radial bin, and plot the
% number of counts as a function of the radial bin.  
% % To run, run the e7 tools with debugging output on.  Make sure you turn gap filling OFF
% % then change the file path below to the e7 tools folder and MATLAB folder for this code.  
% %---------------------------------------------------------------------------------------------------------
% %                                     SET FILE PATH - MUST BE SPAN 11
% %---------------------------------------------------------------------------------------------------------
myFolder = '/Users/Research_Macbook/Desktop/stir_test2/Input-LM-00';       % Directory of first sinogram
myFolder2 = '/Users/Research_Macbook/Desktop/stir_test/Input-LM-00';     % Directory of second sinogram
% %---------------------------------------------------------------------------------------------------------
NumSinos = 1;               % Set Number of Input Sinograms for comparison
File_Status = 0;            % 0 = run using e7 tools output.  This runs with hard-coded files and can only be run for one sinogram
                             % 1 = select the files you want to compare.  This can be run for 1 or 2 sinograms
MulitPlot_switch = 0;        % 0 = plot on same graph, 1 = plot on two different graphs
ISSRB_switch = 0;            % 1 = run ISSRB to cacluate 3D scatter sinogram using a e7_2_STIR script, 0 = off
Prompts_switch=1;            % Plot Prompts
Randoms_switch=1;            % Plot Randoms
Trues_switch=1;              % Calculate and Plot Trues
Scatter_switch=0;            % Plot Scatter  
ACF_switch=1;                % Plot ACF
Diff_ACF = 1;        % If you are using two sinograms are the ACFs different? 1 = yes, 0 = no
Use_bars = 1;        % This will put bars at the beginning of the tails for each plott
% %---------------------------------------------------------------------------------------------------------
% %---------------------------------For File_Status = 1---------------------------------------------------------   
% % This allows you to manually select the sinograms you want to plot.
% File_status == 0 takes hardcoded files from the e7 tools output
% %---------------------------------------------------------------------------------------------------------
Sino1_name = 'emis_00.s';
Sino2_name = 'emis_00.s';
ACF1_name = 'acf_second_00.a';
ACF2_name = 'acf_second_00.a';
Scat1_name = 'sino-scat_00.s';
Scat2_name = 'sino-scat_00.s';
% %---------------------------------------------------------------------------------------------------------
% %---------------------------------------------------------------------------------------------------------












% %---------------------------------------------------------------------------------------------------------
% %---------------------------------------------------------------------------------------------------------
MFolder2 = pwd;
cd ..
cd e7_2_STIR % Directory for creating 3D scatter sinogram via ISSRB
MFolder = pwd;
cd (MFolder2)

if File_Status == 0
    NumSinos = 1;
    MulitPlot_switch = 0;
end
if NumSinos == 1
    MulitPlot_switch = 0;
end
if NumSinos == 2
    File_Status = 1;
end
if Use_bars == 1
    ACF_switch = 1;
end
if ISSRB_switch == 1
    cd (MFolder)
    cd Process_Indiv
    Inverse_Single_Slice_Rebinning
end
cd (MFolder2)
% %---------------------------------------------------------------------------------------------------------
cd Scripts
Sinogram_Process


