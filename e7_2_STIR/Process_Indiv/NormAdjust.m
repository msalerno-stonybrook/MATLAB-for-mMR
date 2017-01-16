% %---------------------------------------------------------------------------------------------------------
cd (myFolder)
mkdir('MATLAB_output_forSTIR_NormAdjust');
cd MATLAB_output_forSTIR_NormAdjust
path1 = pwd;
cd ..
path2 = pwd;
cd ..
% %---------------------------------------------------------------------------------------------------------

% %---------------------------------------------------------------------------------------------------------
% %---------------------------------------------------------------------------------------------------------
% %                                         SEARCH FILE
% %---------------------------------------------------------------------------------------------------------
if Norm_adjust_switch1 == 1
    fid=fopen('Input-norm.n');
    [data,count]=fread(fid,'float32');
    fclose(fid);
    cd (myFolder)
    %Component[1]: Geometric Effects
    geo_eff=data((0 / 4+1):(174752 / 4));
    %Component[2]: Crystal Interference
    crys_intf=data((174752 / 4+1):(187136 / 4));
    %Component[3]: Crystal Efficiencies
    crys_eff=data((187136 / 4+1):(316160 / 4));
    %Component[4]: Axial Effects
    ax_eff=data((316160 / 4+1):(319508 / 4));
    %Component[5]: Paralyzing Ring DT Parameters
    Par_DetParam=data((319508 / 4+1):(319764 / 4));
    %Component[6]: Non-Paralyzing Ring DT Parameters
    NonPar_DetParam=data((319764 / 4+1):(320020 / 4));
    %Component[7]: TX Crystal DT Parameter
    crys_DetParm=data((320020 / 4+1):(320056 / 4));
    %Component[8]: Additional Axial Effects
    addax_eff=data((320056 / 4+1):(323404 / 4));
% %---------------------------------------------------------------------------------------------------------
% %---------------------------------------------------------------------------------------------------------
% %                                         ADJUST NORM (.n) FILE
% %---------------------------------------------------------------------------------------------------------
    %Component[1]: Geometric Effects
    if norm_component_switch1 == 1
        geo_eff(:)=norm_component_value1;
    end
    %Component[2]: Crystal Interference
    if norm_component_switch2 == 1
        crys_intf(:)=norm_component_value2;
    end
    %Component[3]: Crystal Efficiencies
    if norm_component_switch3 == 1
        crys_eff(:)= norm_component_value3;
    end
    %Component[4]: Axial Effects
    if norm_component_switch4 == 1
        ax_eff(:)=norm_component_value4;
    end
    %Component[5]: Paralyzing Ring DT Parameters
    if norm_component_switch5 == 1
        Par_DetParam(:)=norm_component_value5;
    end
    %Component[6]: Non-Paralyzing Ring DT Parameters
    if norm_component_switch6 == 1
        NonPar_DetParam(:)=norm_component_value6;
    end     
    %Component[7]: TX Crystal DT Parameter
    if norm_component_switch7 == 1
        crys_DetParm(:)=norm_component_value7;
    end
    %Component[8]: Additional Axial Effects
    if norm_component_switch8 == 1
        addax_eff(:)=norm_component_value8;
    end
    % Make Template file to be filled
    new_norm=data(1:(323404 / 4)) .* 0;
% %---------------------------------------------------------------------------------------------------------
% %---------------------------------------------------------------------------------------------------------
% %                                         REASSEMBLE NORM (.n) FILE
% %---------------------------------------------------------------------------------------------------------
    %Component[1]: Geometric Effects
    new_norm((0 / 4+1):(174752 / 4))=geo_eff;

    %Component[2]: Crystal Interference
    new_norm((174752 / 4+1):(187136 / 4))= crys_intf;

    %Component[3]: Crystal Efficiencies
    new_norm((187136 / 4+1):(316160 / 4))=crys_eff;

    %Component[4]: Axial Effects
    new_norm((316160 / 4+1):(319508 / 4))=ax_eff;

    %Component[5]: Paralyzing Ring DT Parameters
    new_norm((319508 / 4+1):(319764 / 4))=Par_DetParam;

    %Component[6]: Non-Paralyzing Ring DT Parameters
    new_norm((319764 / 4+1):(320020 / 4))=NonPar_DetParam;

    %Component[7]: TX Crystal DT Parameter
    new_norm((320020 / 4+1):(320056 / 4))=crys_DetParm;

    %Component[8]: Additional Axial Effects
    new_norm((320056 / 4+1):(323404 / 4))=addax_eff;
% %---------------------------------------------------------------------------------------------------------

    fid1=fopen('MATLAB_output_forSTIR_NormAdjust/Input-norm-adjusted.n','w');
    fwrite(fid1,new_norm,'float');
    fclose(fid1);
% %---------------------------------------------------------------------------------------------------------
end
% %---------------------------------------------------------------------------------------------------------


% %---------------------------------------------------------------------------------------------------------
if Norm_adjust_switch1 == 2
% %---------------------------------------------------------------------------------------------------------
% %                                       CORRECT BAD CRYSTALS
% %---------------------------------------------------------------------------------------------------------
fid=fopen('Input-norm.n');
[data,count]=fread(fid,'float32');
fclose(fid);
cd (myFolder)
% Make Template file to be filled
crystal_eff=data(1:(323404 / 4)) .* 0;
m = 0;
for j = 1 : (187136 / 4)
    crystal_eff(j)=data(j);
end
for i = (187136 / 4+1):(316160 / 4+1);
    if data(i) >= norm_thresh
        crystal_eff(i)=data(i);
    else
        crystal_eff(i)=1;
        m=m+1;
        m
    end
end
m 
for i = (316160 / 4+2):length(data)
    crystal_eff(i) = data(i);
end
 
fid=fopen('MATLAB_output_forSTIR_NormAdjust/Input-norm-adjusted.n','w');
fwrite(fid,crystal_eff,'float32');
fclose(fid);
%---------------------------------------------------------------------------------------------------------
end
% %---------------------------------------------------------------------------------------------------------


% %---------------------------------------------------------------------------------------------------------
if Norm_adjust_switch1 == 3
% %---------------------------------------------------------------------------------------------------------
% %                                       FILL NORM SINO GAPS
% %---------------------------------------------------------------------------------------------------------
cd (path2)
fid=fopen('norm3d_00.a');
[data,count]=fread(fid,'float32');
fclose(fid);
cd (myFolder)
for i = 1:(290231424 / 4)
    if data(i) > 0
        data1(i)=data(i);
    else if data(i) < 0
        data1(i)=data(i);
        else
        data1(i)=gap_fill;
        end
    end
end
fid=fopen('MATLAB_output_forSTIR_NormAdjust/norm3d_00_gf.a','w');
fwrite(fid,data1,'float32');
fclose(fid);
%---------------------------------------------------------------------------------------------------------
end
% %---------------------------------------------------------------------------------------------------------


cd (MFolder);