% %--------------------------------------------------------------------% %
% %                             SET CONSTANTS
% %--------------------------------------------------------------------% %
sx = 344;
if Sinogram_or_Image == 0
    sy = 252;
    if Set_Span == 1
        sz = 4084;
    end
    if Set_Span == 11,
        sz = 837;
    end
end
if Sinogram_or_Image == 1
    sy = sx;
    sz = 127;
end
% %-------------------------Create Empty Arrays-------------------------% %
% %-------------------------Create Empty Arrays-------------------------% %
% %--------------------------------------------------------------------% %
new_file = ones(sx,sy,sz);
new_file(:,:,:) = new_file(:,:,:) .* Make_Data_fill;
cd (output_folder)
if Sinogram_or_Image == 0
    fid=fopen(sprintf('output.s'),'w');
    fwrite(fid,new_file,'float32');
    fclose(fid);
end
if Sinogram_or_Image == 1
    fid=fopen(sprintf('output.v'),'w');
    fwrite(fid,new_file,'float32');
    fclose(fid);
end
cd ..
