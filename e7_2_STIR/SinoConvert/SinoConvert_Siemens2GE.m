prompts_q = fread(fid1,'float32');
fclose(fid1);
prompts_s = reshape(prompts_q, 344, 252, 837); 

segment0 = zeros(344, 252, 127);
segment1 = zeros(344, 252, 115);
segment2 = zeros(344, 252, 115);
segment3 = zeros(344, 252, 93);
segment4 = zeros(344, 252, 93);
segment5 = zeros(344, 252, 71);
segment6 = zeros(344, 252, 71);
segment7 = zeros(344, 252, 49);
segment8 = zeros(344, 252, 49);
segment9 = zeros(344, 252, 27);
segment10 = zeros(344, 252, 27);

% Segment 0 - Direct Planes: 127
segment0(:,:,1:127) = prompts_s(:,:,1:127);
segment0 = permute(segment0, [1 3 2]);
step1_seg0=segment0;
% Segment 1: +115
segment1(:,:,1:115) = prompts_s(:,:,128:242);
segment1 = permute(segment1, [1 3 2]);
% Segment 2: -115
segment2(:,:,1:115) = prompts_s(:,:,243:357);
segment2 = permute(segment2, [1 3 2]);
% Segment 3: +93
segment3(:,:,1:93) = prompts_s(:,:,358:450);
segment3 = permute(segment3, [1 3 2]);
% Segment 4: -93
segment4(:,:,1:93) = prompts_s(:,:,451:543);
segment4 = permute(segment4, [1 3 2]);
% Segment 5: +71
segment5(:,:,1:71) = prompts_s(:,:,544:614);
segment5 = permute(segment5, [1 3 2]);
% Segment 6: -71
segment6(:,:,1:71) = prompts_s(:,:,615:685);
segment6 = permute(segment6, [1 3 2]);
% Segment 7: +49
segment7(:,:,1:49) = prompts_s(:,:,686:734);
segment7 = permute(segment7, [1 3 2]);
% Segment 8: -49
segment8(:,:,1:49) = prompts_s(:,:,735:783);
segment8 = permute(segment8, [1 3 2]);
% Segment 9: +27
segment9(:,:,1:27) = prompts_s(:,:,784:810);
segment9 = permute(segment9, [1 3 2]);
% Segment 10: -27
segment10(:,:,1:27) = prompts_s(:,:,811:837);
segment10 = permute(segment10, [1 3 2]);


% 27
for j = 1:(9362304 / 4)
    GE_sino(j)=segment9(j);
end
%49
for j = (j+1):((j)+(16990848 / 4))
    GE_sino(j)=segment7(j-((9362304 / 4)));
end
%71
for j = (j+1):((j)+(24619392 / 4))
    GE_sino(j)=segment5(j-(16990848 / 4)-(9362304 / 4));
end
%93
for j = (j+1):((j)+(32247936 / 4))
    GE_sino(j)=segment3(j-(24619392 / 4)-(16990848 / 4)-(9362304 / 4));
end
%115
for j = (j+1):((j)+(39876480 / 4))
    GE_sino(j)=segment1(j-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4));
end
%127
for j = (j+1):((j)+(44037504 / 4))
    GE_sino(j)=segment0(j-(39876480 / 4)-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4));
end
%115
for j = (j+1):((j)+(39876480 / 4))
    GE_sino(j)=segment2(j-(44037504 / 4)-(39876480 / 4)-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4));
end
%93
for j = (j+1):((j)+(32247936 / 4))
    GE_sino(j)=segment4(j-(39876480 / 4)-(44037504 / 4)-(39876480 / 4)-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4));
end
%71
for j = (j+1):((j)+(24619392 / 4))
    GE_sino(j)=segment6(j-(32247936 / 4)-(39876480 / 4)-(44037504 / 4)-(39876480 / 4)-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4));
end
%49
for j = (j+1):((j)+(16990848 / 4))
    GE_sino(j)=segment8(j-(24619392 / 4)-(32247936 / 4)-(39876480 / 4)-(44037504 / 4)-(39876480 / 4)-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4));
end
%27
for j = (j+1):((j)+(9362304 / 4))
    GE_sino(j)=segment10(j-(16990848 / 4)-(24619392 / 4)-(32247936 / 4)-(39876480 / 4)-(44037504 / 4)-(39876480 / 4)-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4));
end