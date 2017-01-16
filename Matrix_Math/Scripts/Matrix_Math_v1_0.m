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


if One_file == 0
% %-------------------------Create Empty Arrays-------------------------% %
% %--------------------------------------------------------------------% %
new_file = zeros(sx,sy,sz);
for k = 1 : Number_of_files
    all_files{k} = new_file;
    if Operation_switch == 7
        Noise_sino{k} = new_file;
    end
end
for k = 1 : Number_of_files - 1
    output_{k} = new_file;
end
% %--------------------------------------------------------------------% %
% %--------------------------------------------------------------------% %
% %                             IMPORT FILES
% %--------------------------------------------------------------------% %
if Math_or_createDate == 0
m = 1;
fid = fopen(File1);
file_1 = fread(fid,'float32');
file_1 = reshape(file_1,sx,sy,sz);
fclose(fid);
all_files{m} = file_1;
m=m+1;

if Number_of_files >= 2
if Operation_switch == 7
fid = fopen(File1);
else
fid = fopen(File2);
end
file_2 = fread(fid,'float32');
file_2 = reshape(file_2,sx,sy,sz);
fclose(fid);
all_files{m} = file_2;
m=m+1;

if Number_of_files >= 3
if Operation_switch == 7
fid = fopen(File1);
else
fid = fopen(File3);
end
file_3 = fread(fid,'float32');
file_3 = reshape(file_3,sx,sy,sz);
fclose(fid);
all_files{m} = file_3;
m=m+1;

if Number_of_files >= 4
if Operation_switch == 7
fid = fopen(File1);
else
fid = fopen(File4);
end
file_4 = fread(fid,'float32');
file_4 = reshape(file_4,sx,sy,sz);
fclose(fid);
all_files{m} = file_4;
m=m+1;

if Number_of_files >= 5
if Operation_switch == 7
    fid = fopen(File1);
else
    fid = fopen(File5);
end
file_5 = fread(fid,'float32');
file_5 = reshape(file_5,sx,sy,sz);
fclose(fid);
all_files{m} = file_5;
m=m+1;

if Number_of_files >= 6
if Operation_switch == 7
fid = fopen(File1);
else
fid = fopen(File6);
end
file_6 = fread(fid,'float32');
file_6 = reshape(file_6,sx,sy,sz);
fclose(fid);
all_files{m} = file_6;
m=m+1;

if Number_of_files >= 7
if Operation_switch == 7
fid = fopen(File1);
else
fid = fopen(File7);
end
file_7 = fread(fid,'float32');
file_7 = reshape(file_7,sx,sy,sz);
fclose(fid);
all_files{m} = file_7;
m=m+1;

if Number_of_files >= 8
if Operation_switch == 7
fid = fopen(File1);
else
fid = fopen(File8);
end
file_8 = fread(fid,'float32');
file_8 = reshape(file_8,sx,sy,sz);
fclose(fid);
all_files{m} = file_8;
m=m+1;

if Number_of_files >= 9
if Operation_switch == 7
fid = fopen(File1);
else
fid = fopen(File9);
end
file_9 = fread(fid,'float32');
file_9 = reshape(file_9,sx,sy,sz);
fclose(fid);
all_files{m} = file_9;
m=m+1;

if Number_of_files >= 10
if Operation_switch == 7
fid = fopen(File1);
else
fid = fopen(File10);
end
file_10 = fread(fid,'float32');
file_10 = reshape(file_10,sx,sy,sz);
fclose(fid);
all_files{m} = file_10;
m=m+1;
end
end
end
end
end
end
end
end
end
% %--------------------------------------------------------------------% %
% %--------------------------------------------------------------------% %
% %                             PERFORM OPERATIONS
% %--------------------------------------------------------------------% %
m = 1;
for k = 1 : length(all_files)-1
        m = m + 1;
        n = 1;
    if Operation_switch == 1 % Addition
        output_{k}(:,:,:) = all_files{1}(:,:,:) + all_files{m}(:,:,:);
    end
    if Operation_switch == 2 % Subtraction
        output_{k}(:,:,:) = all_files{1}(:,:,:) - all_files{m}(:,:,:);
    end
    if Operation_switch == 3 % Multiplication
        output_{k}(:,:,:) = all_files{1}(:,:,:) .* all_files{m}(:,:,:);
    end
    if Operation_switch == 4 % Division
        output_{k}(:,:,:) = rdivide(all_files{1}(:,:,:),all_files{m}(:,:,:));
    end
    if Operation_switch == 5 % Quick Percent Difference
        for i=PD_slice 
        figure(n)
        imagesc([all_files{1}(100:250,100:250,i) all_files{m}(100:250,100:250,i)])
        colorbar
        figure(m)
%         bmask = all_files{1}(100:250,100:250,i)>4000;
        t=100*abs(rdivide((all_files{m}(100:250,100:250,i)-all_files{1}(100:250,100:250,i)),all_files{1}(100:250,100:250,i)));
%         imagesc(t.*bmask,[-100 100])
        imagesc(t,[neg_lim pos_lim])
        colorbar
        title(i)
        pause(0.5)
        end      
    end
    if Operation_switch == 6 % Percent Difference save
        output_{k}(:,:,:)=100*abs(rdivide((all_files{m}(:,:,:)-all_files{1}(:,:,:)),all_files{1}(:,:,:)));
    end  
% %--------------------------------------------------------------------% %
if Operation_switch == 5
else
    cd (output_folder)
    if Sinogram_or_Image == 0
        fid=fopen(sprintf('output%d.s',k),'w');
        fwrite(fid,output_{k},'float32');
        fclose(fid);
    end
    if Sinogram_or_Image == 1
        fid=fopen(sprintf('output%d.v',k),'w');
        fwrite(fid,output_{k},'float32');
        fclose(fid);
    end
    cd ..
end % 

n=n+1;
end % end of operations initial
for k = 1 : length(all_files)
if Operation_switch == 7   % Poisson Random Number Generator             
    Noise_sino{k}(:,:,:)=poissrnd(all_files{1}(:,:,:));
    cd (output_folder)
    if Sinogram_or_Image == 0
        fid=fopen(sprintf('output%d.s',k),'w');
        fwrite(fid,Noise_sino{k},'float32');
        fclose(fid);
    end
    if Sinogram_or_Image == 1
        fid=fopen(sprintf('output%d.v',k),'w');
        fwrite(fid,Noise_sino{k},'float32');
        fclose(fid);
    end
    cd ..
end 
end
end 
end % end of multi-file

% %--------------------------------------------------------------------% %
% %                           ONE FILE OPERATIONS
% %--------------------------------------------------------------------% %
if One_file == 1
    fid = fopen(File1);
    file_1 = fread(fid,'float32');
    file_1 = reshape(file_1,sx,sy,sz);
    fclose(fid);
    if Operation_switch == 1
        file_1_p(:,:,:)=file_1(:,:,:) + Scalar1; 
    end
    if Operation_switch == 2
        file_1_p(:,:,:)=file_1(:,:,:) - Scalar1;
    end
    if Operation_switch == 3
        file_1_p(:,:,:)=file_1(:,:,:) .* Scalar1;
    end
    if Operation_switch == 4
        file_1_p(:,:,:)=rdivide(file_1(:,:,:),Scalar1);
    end
    cd (output_folder)
    if Sinogram_or_Image == 0
        fid=fopen('output.s','w');
        fwrite(fid,file_1_p,'float32');
        fclose(fid);
    end
    if Sinogram_or_Image == 1
        fid=fopen('output.v','w');
        fwrite(fid,file_1_p,'float32');
        fclose(fid);
    end
    cd .. 
end