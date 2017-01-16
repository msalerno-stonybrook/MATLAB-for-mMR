if Use_ATLAS == 0
    clear BR_array_bank
    cd ..
    cd Brain_Regions
    fid = fopen('Ones_Image.v');
    OnesImage=fread(fid,'float32');
    OnesImage=reshape(OnesImage,sxy,sxy,sz);
    fclose(fid);
    BR_array={OnesImage};
    BR_name_array={'Whole Image'};
    BR_array_all = BR_array;
    BR_name_array_all = BR_name_array;
end %end if Use_ATLAS=0
% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------

if Use_ATLAS == 1
% %-----------------------------------------------------------------------------------------------
if BR_select == 1
    BR_array_bank={BR1,BR2,BR3,BR4,BR5,BR6,BR7,BR8,BR9,BR10,BR11,BR12,BR13,BR14,BR15,BR16,BR17,BR18,BR19,BR20,BR21,BR22,BR23,BR24,BR25,BR26,BR27,BR28,BR29,BR30,BR31,BR32,BR33,BR34,BR35,BR36,BR37,BR38,BR39,BR40,BR41,BR42,BR43,BR44,BR45,BR46,BR47,BR48,BR49,BR50,BR51,BR52,BR53,BR54,BR55,BR56,BR57,BR58,BR59,BR60,BR61,BR62,BR63,BR64,BR65,BR66,BR67,BR68,BR69,BR70,BR71,BR72,BR73,BR74,BR75,BR76,BR77,BR78,BR79,BR80,BR81,BR82,BR83,BR84,BR85,BR86,WB};
    BR_name_bank={'Frontal Lobe Middle Front Gyrus (Left)','Frontal Lobe Middle Front Gyrus (Right)','Frontal Lobe Precentral Gyrus (Left)','Frontal Lobe Precentral Gyrus (Right)','Frontal Lobe Straight Gyrus (Left)','Frontal Lobe Straight Gyrus (Right)','Frontal Lobe Orbitofrontal Cortex Anterior Orbital Gyrus (Left)','Frontal Lobe Orbitofrontal Cortex Anterior Orbital Gyrus (Right)','Frontal Lobe Inferior Frontal Gyrus (Left)','Frontal Lobe Inferior Frontal Gyrus (Right)','Frontal Lobe Superior Frontal Gyrus (Left)','Frontal Lobe Superior Frontal Gyrus (Right)','Frontal Lobe Orbitofrontal Gyrus Medial Orbital Gyrus (Left)','Frontal Lobe Orbitofrontal Gyrus Medial Orbital Gyrus (Right)','Frontal Lobe Orbitofrontal Gyrus Lateral Orbital Gyrus (Left)','Frontal Lobe Orbitofrontal Gyrus Lateral Orbital Gyrus (Right)','Frontal Lobe Orbitofrontal Gyrus Posterior Orbital Gyrus (Left)','Frontal Lobe Orbitofrontal Gyrus Posterior Orbital Gyrus (Right)','Subgenual Anterior Cingulate Gyrus (Left)','Subgenual Anterior Cingulate Gyrus (Right)','Subcallosal Area (Left)','Subcallosal Area (Right)','Pre-subgenual Anterior Cingulate Gyrus (Left)','Pre-subgenual Anterior Cingulate Gyrus (Right)','Hippocampus (Right)','Hippocampus (Left)','Amygdala (Right)','Amygdala (Left)','Anterior Temporal Lobe, Medial Part (Right)','Anterior Temporal Lobe, Medial Part (Left)','Anterior Temporal Lobe Inferior, Lateral Part (Right)','Anterior Temporal Lobe Inferior, Lateral Part (Left)','Parahippocampal and Ambient Gyri (Right)','Parahippocampal and Ambient Gyri (Left)','Superior Temporal Gyrus, Posterior Part (Right)','Superior Temporal Gyrus, Posterior Part (Left)','Middle and Inferior Temporal Gyrus (Right)','Middle and Inferior Temporal Gyrus (Left)','Fusiform Gyrus (Right)','Fusiform Gyrus (Left)','Posterior Temporal Lobe (Left)','Posterior Temporal Lobe (Right)','Superior Temporal Gyrus, Anterior Part (Left)','Superior Temporal Gyrus, Anterior Part (Right)','Parietal Lobe Postcentral Gyrus (Left)','Parietal Lobe Postcentral Gyrus (Right)','Parietal Lobe Superior Parietal Gyrus (Left)','Parietal Lobe Superior Parietal Gyrus (Right)','Parietal Lobe Inferiolateral Remainder of Parietal Lobe (Left)','Parietal Lobe Inferiolateral Remainder of Parietal Lobe (Right)','Occipital Lobe Lateral Remainder of Occipital Lobe (Left)','Occipital Lobe Lateral Remainder of Occipital Lobe (Right)','Occipital Lobe Lingual Gyrus (Left)','Occipital Lobe Lingual Gyrus (Right)','Occipital Lobe Cuneus (Left)','Occipital Lobe Cuneus (Right)','Caudate Nucleus (Left)','Caudate Nucleus (Right)','Nucleus Accumbens (Left)','Nucleus Accumbens (Right)','Putamen (Left)','Putamen (Right)','Thalamus (Left)','Thalamus (Right)','Pallidum (Left)','Pallidum (Right)','Corpus Callosum','Substantia Nigra (Left)','Substantia Nigra (Right)','Insula (Left)','Insula (Right)','Cingulate Gyrus (Gyrus Cinguli), Anterior Part (Left)','Cingulate Gyrus (Gyrus Cinguli), Anterior Part (Right)','Cingulate Gyrus (Gyrus Cinguli), Posterior Part (Left)','Cingulate Gyrus (Gyrus Cinguli), Posterior Part (Right)','Cerebellum (Right)','Cerebellum (Left)','Brainstem','Ventricle, Frontal Horn (Right)','Ventricle, Frontal Horn (Left)','Lateral Ventricle, Temporal Horn (Right)','Lateral Ventricle, Temporal Horn (Left)','Third Ventricle','White Matter (Left)','White Matter (Right)','CBW','Whole Brain'};
    BR_array_all = BR_array_bank;
    BR_name_array_all = BR_name_bank;
end
% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------
if BR_select == 1
    if MultiPlot_Switch == 0       
        for p = 1 : length(BR_num)
            BR_array{p}=BR_array_bank{BR_num_q(p)};
            BR_name_array{p}=BR_name_bank{BR_num_q(p)};
        end
    end
    if MultiPlot_Switch == 1 
        BR_array=BR_array_bank;
        BR_name_array=BR_name_bank;
%         BR_array_all=BR_array_bank;
%         BR_name_array=BR_name_bank;
    end
end
% %-----------------------------------------------------------------------------------------------
if BR_select == 2
    % Frontal Lobe
    BR_1=BR1+BR2;
    BR_2=BR3+BR4;
    BR_3=BR5+BR6;
    BR_4=BR7+BR8;
    BR_5=BR9+BR10;
    BR_6=BR11+BR12;
    BR_7=BR13+BR14;
    BR_8=BR15+BR16;
    BR_9=BR17+BR18;
    BR_10=BR19+BR20;
    BR_11=BR21+BR22;
    BR_12=BR23+BR24;
    %end Frontal Lobe

    % Temporal Lobe
    BR_13=BR25+BR26;
    BR_14=BR27+BR28;
    BR_15=BR29+BR30;
    BR_16=BR31+BR32;
    BR_17=BR33+BR34;
    BR_18=BR35+BR36;
    BR_19=BR37+BR38;
    BR_20=BR39+BR40;
    BR_21=BR41+BR42;
    BR_22=BR43+BR44;
    %end Temporal Lobe

    % Parietal Lobe
    BR_23=BR45+BR46;
    BR_24=BR47+BR48;
    BR_25=BR49+BR50;
    %end Parietal Lobe

    % Occipital Lobe
    BR_26=BR51+BR52;
    BR_27=BR53+BR54;
    BR_28=BR55+BR56;
    %end Occipital Lobe

    % Central Structures
    BR_29=BR57+BR58;
    BR_30=BR59+BR60;
    BR_31=BR61+BR62;
    BR_32=BR63+BR64;
    BR_33=BR65+BR66;
    % BR67 = Corpus Callosom = Only 1 Region
    BR_34=BR68+BR69;
    %end Central Structures

    % Insula and Cingulate Gyri
    BR_35=BR70+BR71;
    BR_36=BR72+BR73;
    BR_37=BR74+BR75;
    %end Insula and Cingulate Gyri

    % Posterior Fossa
    BR_38=BR76+BR77;    
    % BR78 = Brainstem = Only 1 Region
    %end Posterior Fossa

    % Ventricles
    BR_39=BR79+BR80;
    BR_40=BR81+BR82;
    % BR83 = Third Ventricle = Only 1 Region
    BR_41=BR84+BR85;
    % BR86 = CBW = Only 1 Region
    %end Ventricles

    % Whole Brain
    % BR87 = Whole Brain = Only 1 Region
    %end Whole Brain
% %-----------------------------------------------------------------------------------------------     
    BR_array_bank={BR_1,BR_2,BR_3,BR_4,BR_5,BR_6,BR_7,BR_8,BR_9,BR_10,BR_11,BR_12,BR_13,BR_14,BR_15,BR_16,BR_17,BR_18,BR_19,BR_20,BR_21,BR_22,BR_23,BR_24,BR_25,BR_26,BR_27,BR_28,BR_29,BR_30,BR_31,BR_32,BR_33,BR67,BR_34,BR_35,BR_36,BR_37,BR_38,BR78,BR_39,BR_40,BR83,BR_41,BR86,WB};                   
    BR_name_bank={'Frontal Lobe Middle Front Gyrus','Frontal Lobe Precentral Gyrus','Frontal Lobe Straight Gyrus','Frontal Lobe Orbitofrontal Cortex Anterior Orbital Gyrus','Frontal Lobe Inferior Frontal Gyrus','Frontal Lobe Superior Frontal Gyrus','Frontal Lobe Orbitofrontal Gyrus Medial Orbital Gyrus','Frontal Lobe Orbitofrontal Gyrus Lateral Orbital Gyrus','Frontal Lobe Orbitofrontal Gyrus Posterior Orbital Gyrus','Subgenual Anterior Cingulate Gyrus','Subcallosal Area','Pre-subgenual Anterior Cingulate Gyrus','Hippocampus','Amygdala','Anterior Temporal Lobe, Medial Part','Anterior Temporal Lobe Inferior, Lateral Part','Parahippocampal and Ambient Gyri','Superior Temporal Gyrus, Posterior Part','Middle and Inferior Temporal Gyrus','Fusiform Gyrus','Posterior Temporal Lobe','Superior Temporal Gyrus, Anterior Part','Parietal Lobe Postcentral Gyrus','Parietal Lobe Superior Parietal Gyrus','Parietal Lobe Inferiolateral Remainder of Parietal Lobe','Occipital Lobe Lateral Remainder of Occipital Lobe','Occipital Lobe Lingual Gyrus','Occipital Lobe Cuneus','Caudate Nucleus','Nucleus Accumbens','Putamen','Thalamus','Pallidum','Corpus Callosum','Substantia Nigra','Insula','Cingulate Gyrus (Gyrus Cinguli), Anterior Part','Cingulate Gyrus (Gyrus Cinguli), Posterior Part','Cerebellum','Brainstem','Ventricle, Frontal Horn','Lateral Ventricle, Temporal Horn','Third Ventricle','White Matter','CBW','Whole Brain'};
    BR_array_all = BR_array_bank;
    BR_name_array_all = BR_name_bank;
% %-----------------------------------------------------------------------------------------------     
   if MultiPlot_Switch == 0
        for p = 1 : length(BR_num)
            BR_array{p}=BR_array_bank{BR_num_q(p)};
            BR_name_array{p}=BR_name_bank{BR_num_q(p)};
        end
%         BR_array_all = BR_array;
%         BR_name_array_all = BR_name_array;
   end
   if MultiPlot_Switch == 1 
       BR_array=BR_array_bank;
       BR_name_array=BR_name_bank;
%        BR_array_all = BR_array; 
%        BR_name_array_all = BR_name_array;
   end
end %end of BR_list = 2
% %-----------------------------------------------------------------------------------------------
if BR_select == 3
    BR_1=BR25+BR26;
    BR_2=BR57+BR58;
    BR_3=BR61+BR62;
    BR_4=BR63+BR64;
    BR_5=BR76+BR77;
% %-----------------------------------------------------------------------------------------------
    BR_array_bank={BR_1,BR_2,BR_3,BR_4,BR67,BR_5,BR78,WB};
    BR_name_bank={'Hippocampus','Caudate Nucleus','Putamen','Thalamus','Corpus Callosum','Cerebellum','Brainstem','Whole Brain'};
    BR_array_all = BR_array_bank;
    BR_name_array_all = BR_name_bank;
% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------
    if MultiPlot_Switch == 0
        for p = 1 : length(BR_num)
            BR_array{p}=BR_array_bank{BR_num_q(p)};
            BR_name_array{p}=BR_name_bank{BR_num_q(p)};
        end
%         BR_array_all = BR_array;
%         BR_name_array_all = BR_name_array;
    end
    if MultiPlot_Switch == 1
        BR_array=BR_array_bank;
        BR_name_array=BR_name_bank;
%         BR_array_all = BR_array;
%         BR_name_array_all = BR_name_array;
    end
end %end of BR_list = 3
% %-----------------------------------------------------------------------------------------------
end %end if Use_ATLAS = 1
% %-----------------------------------------------------------------------------------------------
if Use_ATLAS == 2
    BR_array_all = BR_array_bank;
    BR_name_array_all = BR_name_bank;
    if MultiPlot_Switch == 0       
        for p = 1 : length(BR_num)
            BR_array{p}=BR_array_bank{BR_num_q(p)};
            BR_name_array{p}=BR_name_bank{BR_num_q(p)};
        end
        
    end
    if MultiPlot_Switch == 1 
        BR_array=BR_array_bank;
        BR_name_array=BR_name_bank;
    end %end of MultiPlot_Switch
end %end if Use_ATLAS = 2
% %-----------------------------------------------------------------------------------------------
cd (M_Folder)  % Returns to Convergence Tester Directory
% %-----------------------------------------------------------------------------------------------