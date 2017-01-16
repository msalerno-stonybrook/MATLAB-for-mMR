% %-----------------------------------------------------------------------------------------------
sxy = 344;      % This sets the image size
sz = 127;    
% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------
cd (BR_Folder) % Change to brain region directory
% %-----------------------------------------------------------------------------------------------
% %-------------------------------IMPORT REFEENCE IMAGE-------------------------------------------
% This needs to be scaled to properly analyze
    fid = fopen('ATLAS.v');
    ref_img=fread(fid,'float32');
    ref_img=reshape(ref_img,sxy,sxy,sz);
    fclose(fid);
% %-----------------------------------------------------------------------------------------------
% %-------------------------------IMPORT NOISELESS FBP IMAGE-------------------------------------------
cd ..
cd FBP
cd Normal_Counts
cd Noiseless
    fid = fopen('output.v');
    FBP_noiseless_img=fread(fid,'float32');
    FBP_noiseless_img=reshape(FBP_noiseless_img,sxy,sxy,sz);
    fclose(fid);
cd ../../..
cd Brain_Regions
% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------
% %-----------------------------------------------------------------------------------------------
% %                                     IMPORT BRAIN REGIONS
% %-----------------------------------------------------------------------------------------------
cd Frontal_Lobe
fid=fopen('/FL_mid_fr_G_l.v');
BR1=fread(fid,'float32');
BR1=reshape(BR1,sxy,sxy,sz);
fclose(fid);

fid=fopen('/FL_mid_fr_G_r.v');
BR2=fread(fid,'float32');
BR2=reshape(BR2,sxy,sxy,sz);
fclose(fid);

fid=fopen('/FL_precen_G_l.v');
BR3=fread(fid,'float32');
BR3=reshape(BR3,sxy,sxy,sz);
fclose(fid);

fid=fopen('/FL_precen_G_r.v');
BR4=fread(fid,'float32');
BR4=reshape(BR4,sxy,sxy,sz);
fclose(fid);

fid=fopen('/FL_strai_G_l.v');
BR5=fread(fid,'float32');
BR5=reshape(BR5,sxy,sxy,sz);
fclose(fid);

fid=fopen('/FL_strai_G_r.v');
BR6=fread(fid,'float32');
BR6=reshape(BR6,sxy,sxy,sz);
fclose(fid);

fid=fopen('/FL_OFC_AOG_l.v');
BR7=fread(fid,'float32');
BR7=reshape(BR7,sxy,sxy,sz);
fclose(fid);

fid=fopen('/FL_OFC_AOG_r.v');
BR8=fread(fid,'float32');
BR8=reshape(BR8,sxy,sxy,sz);
fclose(fid);

fid=fopen('/FL_inf_fr_G_l.v');
BR9=fread(fid,'float32');
BR9=reshape(BR9,sxy,sxy,sz);
fclose(fid);

fid=fopen('/FL_inf_fr_G_r.v');
BR10=fread(fid,'float32');
BR10=reshape(BR10,sxy,sxy,sz);
fclose(fid);

fid=fopen('/FL_sup_fr_G_l.v');
BR11=fread(fid,'float32');
BR11=reshape(BR11,sxy,sxy,sz);
fclose(fid);

fid=fopen('/FL_sup_fr_G_r.v');
BR12=fread(fid,'float32');
BR12=reshape(BR12,sxy,sxy,sz);
fclose(fid);

fid=fopen('/FL_OFC_MOG_l.v');
BR13=fread(fid,'float32');
BR13=reshape(BR13,sxy,sxy,sz);
fclose(fid);

fid=fopen('/FL_OFC_MOG_r.v');
BR14=fread(fid,'float32');
BR14=reshape(BR14,sxy,sxy,sz);
fclose(fid);

fid=fopen('/FL_OFC_LOG_l.v');
BR15=fread(fid,'float32');
BR15=reshape(BR15,sxy,sxy,sz);
fclose(fid);

fid=fopen('/FL_OFC_LOG_r.v');
BR16=fread(fid,'float32');
BR16=reshape(BR16,sxy,sxy,sz);
fclose(fid);

fid=fopen('/FL_OFC_POG_l.v');
BR17=fread(fid,'float32');
BR17=reshape(BR17,sxy,sxy,sz);
fclose(fid);

fid=fopen('/FL_OFC_POG_r.v');
BR18=fread(fid,'float32');
BR18=reshape(BR18,sxy,sxy,sz);
fclose(fid);

fid=fopen('/Subgen_antCing_l.v');
BR19=fread(fid,'float32');
BR19=reshape(BR19,sxy,sxy,sz);
fclose(fid);

fid=fopen('/Subgen_antCing_r.v');
BR20=fread(fid,'float32');
BR20=reshape(BR20,sxy,sxy,sz);
fclose(fid);

fid=fopen('/Subcall_area_l.v');
BR21=fread(fid,'float32');
BR21=reshape(BR21,sxy,sxy,sz);
fclose(fid);

fid=fopen('/Subcall_area_r.v');
BR22=fread(fid,'float32');
BR22=reshape(BR22,sxy,sxy,sz);
fclose(fid);

fid=fopen('/Presubgen_antCing_l.v');
BR23=fread(fid,'float32');
BR23=reshape(BR23,sxy,sxy,sz);
fclose(fid);

fid=fopen('/Presubgen_antCing_r.v');
BR24=fread(fid,'float32');
BR24=reshape(BR24,sxy,sxy,sz);
fclose(fid);

cd ..
cd Temporal_Lobe
fid=fopen('/Hippocampus_r.v');
BR25=fread(fid,'float32');
BR25=reshape(BR25,sxy,sxy,sz);
fclose(fid);

fid=fopen('/Hippocampus_l.v');
BR26=fread(fid,'float32');
BR26=reshape(BR26,sxy,sxy,sz);
fclose(fid);

fid=fopen('/Amygdala_r.v');
BR27=fread(fid,'float32');
BR27=reshape(BR27,sxy,sxy,sz);
fclose(fid);

fid=fopen('/Amygdala_l.v');
BR28=fread(fid,'float32');
BR28=reshape(BR28,sxy,sxy,sz);
fclose(fid);

fid=fopen('/Ant_TL_med_r.v');
BR29=fread(fid,'float32');
BR29=reshape(BR29,sxy,sxy,sz);
fclose(fid);

fid=fopen('/Ant_TL_med_l.v');
BR30=fread(fid,'float32');
BR30=reshape(BR30,sxy,sxy,sz);
fclose(fid);

fid=fopen('/Ant_TL_inf_lat_r.v');
BR31=fread(fid,'float32');
BR31=reshape(BR31,sxy,sxy,sz);
fclose(fid);

fid=fopen('/Ant_TL_inf_lat_l.v');
BR32=fread(fid,'float32');
BR32=reshape(BR32,sxy,sxy,sz);
fclose(fid);

fid=fopen('/G_paraH_amb_r.v');
BR33=fread(fid,'float32');
BR33=reshape(BR33,sxy,sxy,sz);
fclose(fid);

fid=fopen('/G_paraH_amb_l.v');
BR34=fread(fid,'float32');
BR34=reshape(BR34,sxy,sxy,sz);
fclose(fid);

fid=fopen('/G_sup_temp_post_r.v');
BR35=fread(fid,'float32');
BR35=reshape(BR35,sxy,sxy,sz);
fclose(fid);

fid=fopen('/G_sup_temp_post_l.v');
BR36=fread(fid,'float32');
BR36=reshape(BR36,sxy,sxy,sz);
fclose(fid);

fid=fopen('/G_tem_midin_r.v');
BR37=fread(fid,'float32');
BR37=reshape(BR37,sxy,sxy,sz);
fclose(fid);

fid=fopen('/G_tem_midin_l.v');
BR38=fread(fid,'float32');
BR38=reshape(BR38,sxy,sxy,sz);
fclose(fid);

fid=fopen('/G_fus_r.v');
BR39=fread(fid,'float32');
BR39=reshape(BR39,sxy,sxy,sz);
fclose(fid);

fid=fopen('/G_fus_l.v');
BR40=fread(fid,'float32');
BR40=reshape(BR40,sxy,sxy,sz);
fclose(fid);

fid=fopen('/Post_TL_l.v');
BR41=fread(fid,'float32');
BR41=reshape(BR41,sxy,sxy,sz);
fclose(fid);

fid=fopen('/Post_TL_r.v');
BR42=fread(fid,'float32');
BR42=reshape(BR42,sxy,sxy,sz);
fclose(fid);

fid=fopen('/G_sup_temp_ant_l.v');
BR43=fread(fid,'float32');
BR43=reshape(BR43,sxy,sxy,sz);
fclose(fid);

fid=fopen('/G_sup_temp_ant_r.v');
BR44=fread(fid,'float32');
BR44=reshape(BR44,sxy,sxy,sz);
fclose(fid);

cd ..
cd Parietal_Lobe
fid=fopen('/PL_postce_G_l.v');
BR45=fread(fid,'float32');
BR45=reshape(BR45,sxy,sxy,sz);
fclose(fid);

fid=fopen('/PL_postce_G_r.v');
BR46=fread(fid,'float32');
BR46=reshape(BR46,sxy,sxy,sz);
fclose(fid);

fid=fopen('/PL_sup_pa_G_l.v');
BR47=fread(fid,'float32');
BR47=reshape(BR47,sxy,sxy,sz);
fclose(fid);

fid=fopen('/PL_sup_pa_G_r.v');
BR48=fread(fid,'float32');
BR48=reshape(BR48,sxy,sxy,sz);
fclose(fid);

fid=fopen('/PL_rest_l.v');
BR49=fread(fid,'float32');
BR49=reshape(BR49,sxy,sxy,sz);
fclose(fid);

fid=fopen('/PL_rest_r.v');
BR50=fread(fid,'float32');
BR50=reshape(BR50,sxy,sxy,sz);
fclose(fid);

cd ..
cd Occipital_Lobe
fid=fopen('/OL_rest_lat_l.v');
BR51=fread(fid,'float32');
BR51=reshape(BR51,sxy,sxy,sz);
fclose(fid);

fid=fopen('/OL_rest_lat_r.v');
BR52=fread(fid,'float32');
BR52=reshape(BR52,sxy,sxy,sz);
fclose(fid);

fid=fopen('/OL_ling_G_l.v');
BR53=fread(fid,'float32');
BR53=reshape(BR53,sxy,sxy,sz);
fclose(fid);

fid=fopen('/OL_ling_G_r.v');
BR54=fread(fid,'float32');
BR54=reshape(BR54,sxy,sxy,sz);
fclose(fid);

fid=fopen('/OL_cuneus_l.v');
BR55=fread(fid,'float32');
BR55=reshape(BR55,sxy,sxy,sz);
fclose(fid);

fid=fopen('/OL_cuneus_r.v');
BR56=fread(fid,'float32');
BR56=reshape(BR56,sxy,sxy,sz);
fclose(fid);

cd ..
cd Central_Structures
fid=fopen('/CaudateNucl_l.v');
BR57=fread(fid,'float32');
BR57=reshape(BR57,sxy,sxy,sz);
fclose(fid);

fid=fopen('/CaudateNucl_r.v');
BR58=fread(fid,'float32');
BR58=reshape(BR58,sxy,sxy,sz);
fclose(fid);

fid=fopen('/NuclAccumb_l.v');
BR59=fread(fid,'float32');
BR59=reshape(BR59,sxy,sxy,sz);
fclose(fid);

fid=fopen('/NuclAccumb_r.v');
BR60=fread(fid,'float32');
BR60=reshape(BR60,sxy,sxy,sz);
fclose(fid);

fid=fopen('/Putamen_l.v');
BR61=fread(fid,'float32');
BR61=reshape(BR61,sxy,sxy,sz);
fclose(fid);

fid=fopen('/Putamen_r.v');
BR62=fread(fid,'float32');
BR62=reshape(BR62,sxy,sxy,sz);
fclose(fid);

fid=fopen('/Thalamus_l.v');
BR63=fread(fid,'float32');
BR63=reshape(BR63,sxy,sxy,sz);
fclose(fid);

fid=fopen('/Thalamus_r.v');
BR64=fread(fid,'float32');
BR64=reshape(BR64,sxy,sxy,sz);
fclose(fid);

fid=fopen('/Pallidum_l.v');
BR65=fread(fid,'float32');
BR65=reshape(BR65,sxy,sxy,sz);
fclose(fid);

fid=fopen('/Pallidum_r.v');
BR66=fread(fid,'float32');
BR66=reshape(BR66,sxy,sxy,sz);
fclose(fid);

fid=fopen('/Corp_Callosum.v');
BR67=fread(fid,'float32');
BR67=reshape(BR67,sxy,sxy,sz);
fclose(fid);

fid=fopen('/S_nigra_l.v');
BR68=fread(fid,'float32');
BR68=reshape(BR68,sxy,sxy,sz);
fclose(fid);

fid=fopen('/S_nigra_r.v');
BR69=fread(fid,'float32');
BR69=reshape(BR69,sxy,sxy,sz);
fclose(fid);

cd ..
cd Insula_and_Cingulate_Gyri
fid=fopen('/Insula_l.v');
BR70=fread(fid,'float32');
BR70=reshape(BR70,sxy,sxy,sz);
fclose(fid);

fid=fopen('/Insula_r.v');
BR71=fread(fid,'float32');
BR71=reshape(BR71,sxy,sxy,sz);
fclose(fid);

fid=fopen('/G_cing_ant_l.v');
BR72=fread(fid,'float32');
BR72=reshape(BR72,sxy,sxy,sz);
fclose(fid);

fid=fopen('/G_cing_ant_r.v');
BR73=fread(fid,'float32');
BR73=reshape(BR73,sxy,sxy,sz);
fclose(fid);

fid=fopen('/G_cing_post_l.v');
BR74=fread(fid,'float32');
BR74=reshape(BR74,sxy,sxy,sz);
fclose(fid);

fid=fopen('/G_cing_post_r.v');
BR75=fread(fid,'float32');
BR75=reshape(BR75,sxy,sxy,sz);
fclose(fid);

cd ..
cd Posterior_Fossa
fid=fopen('/Cerebellum_r.v');
BR76=fread(fid,'float32');
BR76=reshape(BR76,sxy,sxy,sz);
fclose(fid);

fid=fopen('/Cerebellum_l.v');
BR77=fread(fid,'float32');
BR77=reshape(BR77,sxy,sxy,sz);
fclose(fid);

fid=fopen('/Brainstem.v');
BR78=fread(fid,'float32');
BR78=reshape(BR78,sxy,sxy,sz);
fclose(fid);

cd ..
cd Ventricles_and_White_Matter
fid=fopen('/FrontalHorn_r.v');
BR79=fread(fid,'float32');
BR79=reshape(BR79,sxy,sxy,sz);
fclose(fid);

fid=fopen('/FrontalHorn_l.v');
BR80=fread(fid,'float32');
BR80=reshape(BR80,sxy,sxy,sz);
fclose(fid);

fid=fopen('/TemporaHorn_r.v');
BR81=fread(fid,'float32');
BR81=reshape(BR81,sxy,sxy,sz);
fclose(fid);

fid=fopen('/TemporaHorn_l.v');
BR82=fread(fid,'float32');
BR82=reshape(BR82,sxy,sxy,sz);
fclose(fid);

fid=fopen('/ThirdVentricl.v');
BR83=fread(fid,'float32');
BR83=reshape(BR83,sxy,sxy,sz);
fclose(fid);

fid=fopen('/White_matter_l.v');
BR84=fread(fid,'float32');
BR84=reshape(BR84,sxy,sxy,sz);
fclose(fid);

fid=fopen('/White_matter_r.v');
BR85=fread(fid,'float32');
BR85=reshape(BR85,sxy,sxy,sz);
fclose(fid);

fid=fopen('/CBW.v');
BR86=fread(fid,'float32');
BR86=reshape(BR86,sxy,sxy,sz);
fclose(fid);

cd ..
fid=fopen('/Whole_Brain.v');
WB=fread(fid,'float32');
WB=reshape(WB,sxy,sxy,sz);
fclose(fid);
% %-----------------------------------------------------------------------------------------------

% %-----------------------------------------------------------------------------------------------
cd (M_Folder)  % Returns to Convergence Tester Directory
cd ..
% %-----------------------------------------------------------------------------------------------