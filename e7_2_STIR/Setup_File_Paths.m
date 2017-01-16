clear all;
close all;
clc;
% %---------------------------------------------------------------------------------------------------------
% %                                     INSTRUCTIONS
% %---------------------------------------------------------------------------------------------------------
% %   
% First, run the e7 tools with debugging output on.  Make sure you turn gap filling OFF
% To run change the file path below to the e7 tools folder and MATLAB
% folder for this code.  Note: each switch can be run indiviudally.  Each
% script creates a folder and moves the new files to it
myFolder = '/Users/Research_Macbook/Desktop/stir_test/Input-LM-00';
% %---------------------------------------------------------------------------------------------------------
STIR3_0_switch = 0;   % Convert all of the files needed for STIR3.0 to run
STIR3_1_switch = 0;   % Convert all of the files needed for STIR3.1 to run
ISSRB_switch = 0;     % Calculate 3D scatter sinogram using the e7 tools 2D scatter estimate.
PR_switch = 0;        % Segment prompts and randoms sinogram and save both files
SinoConvert_switch = 0;  % Convert sinograms from Siemens to GE or from GE to Siemens.  See parameters switch belwo
Norm_switch = 0;        % Take the 3D norm sinogram from the e7 tools without gaps and add large values in gaps
Norm_adjust_switch = 1; % Adjust the norm file using the following three options
    Norm_adjust_switch1 = 1;  % 1=Set each component  2=Correct bad crystals  3=fill gaps  
    
    
% %---------------------------------------------------------------------------------------------------------
% % This is for Norm_adjust_switch1 = 1
    %Component[1]: Geometric Effects
        norm_component_switch1 = 0;
            norm_component_value1 = 1;
    %Component[2]: Crystal Interference
        norm_component_switch2 = 0;
            norm_component_value2 = 1;
    %Component[3]: Crystal Efficiencies
        norm_component_switch3 = 0;
            norm_component_value3 = 1;
    %Component[4]: Axial Effects
        norm_component_switch4 = 0;
            norm_component_value4 = 1;
    %Component[5]: Paralyzing Ring DT Parameters
        norm_component_switch5 = 0;
            norm_component_value5 = 1;
    %Component[6]: Non-Paralyzing Ring DT Parameters
        norm_component_switch6 = 0;
            norm_component_value6 = 1;
    %Component[7]: TX Crystal DT Parameter
        norm_component_switch7 = 0;
            norm_component_value7 = 1;
    %Component[8]: Additional Axial Effects
        norm_component_switch8 = 0;
            norm_component_value8 = 1;
% %---------------------------------------------------------------------------------------------------------
% % This is for Norm_adjust_switch1 = 2
    norm_thresh = .20;
% %---------------------------------------------------------------------------------------------------------
% %This is for Norm_adjust_switch1 = 3
    gap_fill = 10000000;
% %---------------------------------------------------------------------------------------------------------
% For Process_Indiv/SinoConvert, pick the file and file extension of the file you
% want to convert.  Note: the file extension will be converted to .s
FileName = 'acf_00';
FileExt = '.a';
Conversion_Switch = 0;  % 0=convert Siemens to GE  1=convert GE to Siemens
% %---------------------------------------------------------------------------------------------------------
















% %---------------------------------------------------------------------------------------------------------
% %---------------------------------------------------------------------------------------------------------
% %---------------------------------------------------------------------------------------------------------
% %---------------------------------------------------------------------------------------------------------
% %---------------------------------------------------------------------------------------------------------
MFolder = pwd;
if Norm_adjust_switch == 1
    cd Process_Indiv
    NormAdjust
end
if STIR3_0_switch == 1
    cd Scripts
    STIR3_0_Processing_v1_1
end

if STIR3_1_switch == 1
    cd Scripts
    STIR3_1_Processing_v1_1
end
% %---------------------------------------------------------------------------------------------------------
if ISSRB_switch == 1
    cd Process_Indiv
    Inverse_Single_Slice_Rebinning
end
if PR_switch == 1
    cd Process_Indiv
    PR_Segment
    
end
if SinoConvert_switch == 1
    cd Process_Indiv
    SinoConvert
end
if Norm_switch == 1
    cd Process_Indiv
    Normalization
end
% %---------------------------------------------------------------------------------------------------------
% %---------------------------------------------------------------------------------------------------------
% %---------------------------------------------------------------------------------------------------------


