[data,count]= fread(fid1,'float32');
fclose(fid1);

segment5 = zeros(344, 252, 127);
segment6 = zeros(344, 252, 115);
segment4 = zeros(344, 252, 115);
segment7 = zeros(344, 252, 93);
segment3 = zeros(344, 252, 93);
segment8 = zeros(344, 252, 71);
segment2 = zeros(344, 252, 71);
segment9 = zeros(344, 252, 49);
segment1 = zeros(344, 252, 49);
segment10 = zeros(344, 252, 27);
segment0 = zeros(344, 252, 27);
% Segment0: +27
for j = 1:(9362304  /  4)
    segment0(j)=data(j);
end
% Segment1: +49
for j = (j+1):((j)+(16990848  /  4))
    segment1(j-((9362304  /  4)))=data(j);
end
% Segment2: +71
for j = (j+1):((j)+(24619392  /  4))
    segment2(j-(16990848  /  4)-(9362304  /  4))=data(j);
end
% Segment3: +93
for j = (j+1):((j)+(32247936  /  4))
    segment3(j-(24619392  /  4)-(16990848  /  4)-(9362304  /  4))=data(j);
end
% Segment4: +115
for j = (j+1):((j)+(39876480  /  4))
    segment4((j-(32247936  /  4)-(24619392  /  4)-(16990848 / 4)-(9362304 / 4)))=data(j);
end
% Segment5: Direct Planes: 127
for j = (j+1):((j)+(44037504 / 4))
    segment5((j-(39876480 / 4)-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4)))=data(j);
end
% Segment6: -115
for j = (j+1):((j)+(39876480 / 4))
    segment6((j-(44037504 / 4)-(39876480 / 4)-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4)))=data(j);
end
% Segment7: -93
for j = (j+1):((j)+(32247936 / 4))
    segment7((j-(39876480 / 4)-(44037504 / 4)-(39876480 / 4)-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4)))=data(j);
end
%Segment8: -71
for j = (j+1):((j)+(24619392 / 4))
    segment8((j-(32247936 / 4)-(39876480 / 4)-(44037504 / 4)-(39876480 / 4)-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4)))=data(j);
end
% Segment9: -49
for j = (j+1):((j)+(16990848 / 4))
    segment9((j-(24619392 / 4)-(32247936 / 4)-(39876480 / 4)-(44037504 / 4)-(39876480 / 4)-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4)))=data(j);
end
% Segment10: -27
for j = (j+1):((j)+(9362304 / 4))
    segment10((j-(16990848 / 4)-(24619392 / 4)-(32247936 / 4)-(39876480 / 4)-(44037504 / 4)-(39876480 / 4)-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4)))=data(j);
end

% Segment 0: Direct Planes: 127
segment5=reshape(segment5, 344, 127, 252);
segment5=permute(segment5, [1,3,2]);
for i = 1:127
Siemens_sino(:,:,i) = segment5(:,:,i);
end 
% Segment1: +115
segment4=reshape(segment4, 344, 115, 252);
segment4=permute(segment4, [1,3,2]);
for i = (i+1):(i+115)
Siemens_sino(:,:,i) = segment4(:,:,i-127);
end 
% Segment2: -115
segment6=reshape(segment6, 344, 115, 252);
segment6=permute(segment6, [1,3,2]);
for i = (i+1):(i+115)
Siemens_sino(:,:,i) = segment6(:,:,i-115-127);
end 
% Segment3: +93
segment3=reshape(segment3, 344, 93, 252);
segment3=permute(segment3, [1,3,2]);
for i = (i+1):(i+93)
Siemens_sino(:,:,i) = segment3(:,:,i-115-115-127);
end 
% Segment4: -93
segment7=reshape(segment7, 344, 93, 252);
segment7=permute(segment7, [1,3,2]);
for i = (i+1):(i+93)
Siemens_sino(:,:,i) = segment7(:,:,i-93-115-115-127);
end 
% Segment5: +71
segment2=reshape(segment2, 344, 71, 252);
segment2=permute(segment2, [1,3,2]);
for i = (i+1):(i+71)
Siemens_sino(:,:,i) = segment2(:,:,i-93-93-115-115-127);
end 
% Segment6: -71
segment8=reshape(segment8, 344, 71, 252);
segment8=permute(segment8, [1,3,2]);
for i = (i+1):(i+71)
Siemens_sino(:,:,i) = segment8(:,:,i-71-93-93-115-115-127);
end 
% Segment7: +49
segment1=reshape(segment1, 344, 49, 252);
segment1=permute(segment1, [1,3,2]);
for i = (i+1):(i+49)
Siemens_sino(:,:,i) = segment1(:,:,i-71-71-93-93-115-115-127);
end 
% Segment8: -49
segment9=reshape(segment9, 344, 49, 252);
segment9=permute(segment9, [1,3,2]);
for i = (i+1):(i+49)
Siemens_sino(:,:,i) = segment9(:,:,i-49-71-71-93-93-115-115-127);
end 
% Segment9: +27
segment0=reshape(segment0, 344, 27, 252);
segment0=permute(segment0, [1,3,2]);
for i = (i+1):(i+27)
Siemens_sino(:,:,i) = segment0(:,:,i-49-49-71-71-93-93-115-115-127);
end 
% Segment10: -27
segment10=reshape(segment10, 344, 27, 252);
segment10=permute(segment10, [1,3,2]);
for i = (i+1):(i+27)
Siemens_sino(:,:,i) = segment10(:,:,i-27-49-49-71-71-93-93-115-115-127);
end 
