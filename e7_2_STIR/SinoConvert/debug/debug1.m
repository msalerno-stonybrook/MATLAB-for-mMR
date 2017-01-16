clear all
close all
clc
fid1=fopen('C:\Users\SUNY\Desktop\Test\acf_00.a');
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

% % ------------------------------------------------------------------------------------------------




% % ------------------------------------------------------------------------------------------------
% %                         NO PERMUTE
% % ------------------------------------------------------------------------------------------------

% % Segment 0 - Direct Planes: 127
% segment0(:,:,1:127) = prompts_s(:,:,1:127);
% step1=segment0;
% % Segment 1: +115
% segment1(:,:,1:115) = prompts_s(:,:,128:242);
% % Segment 2: -115
% segment2(:,:,1:115) = prompts_s(:,:,243:357);
% % Segment 3: +93
% segment3(:,:,1:93) = prompts_s(:,:,358:450);
% % Segment 4: -93
% segment4(:,:,1:93) = prompts_s(:,:,451:543);
% % Segment 5: +71
% segment5(:,:,1:71) = prompts_s(:,:,544:614);
% % Segment 6: -71
% segment6(:,:,1:71) = prompts_s(:,:,615:685);
% % Segment 7: +49
% segment7(:,:,1:49) = prompts_s(:,:,686:734);
% % Segment 8: -49
% segment8(:,:,1:49) = prompts_s(:,:,735:783);
% % Segment 9: +27
% segment9(:,:,1:27) = prompts_s(:,:,784:810);
% % Segment 10: -27
% segment10(:,:,1:27) = prompts_s(:,:,811:837);

% % ------------------------------------------------------------------------------------------------


% %
% % ------------------------------------------------------------------------------------------------
% % This is the bit of code from the original code
% % ------------------------------------------------------------------------------------------------
% GE_sino = zeros(344, 837, 252);
% 
% %+27
% GE_sino(:,1:27,:)=segment9(:,1:27,:);
% 
% %+49
% GE_sino(:,28:76,:)=segment7(:,1:49,:);
% 
% %+71
% GE_sino(:,77:147,:)=segment5(:,1:71,:);
% 
% %+93
% GE_sino(:,148:240,:)=segment3(:,1:93,:);
% 
% %+115
% GE_sino(:,241:355,:)=segment1(:,1:115,:);
% 
% %127
% GE_sino(:,356:482,:)=segment0(:,1:127,:);
% step2_seg0=segment0;
% 
% %-115
% GE_sino(:,483:597,:)=segment2(:,1:115,:);
% 
% %-93
% GE_sino(:,598:690,:)=segment4(:,1:93,:);
% 
% %-71
% GE_sino(:,691:761,:)=segment6(:,1:71,:);
% 
% %-49
% GE_sino(:,762:810,:)=segment8(:,1:49,:);
% 
% %-27
% GE_sino(:,811:837,:)=segment10(:,1:27,:);
% % ------------------------------------------------------------------------------------------------


% % ------------------------------------------------------------------------------------------------
% %  This is the same as the original, but without permute
% % ------------------------------------------------------------------------------------------------

% GE_sino = zeros(344, 252, 837);
% 
% %+27
% GE_sino(:,:,1:27)=segment9(:,:,1:27);
% segment9 = permute(segment9, [1 3 2]);
% 
% %+49
% GE_sino(:,:,28:76)=segment7(:,:,1:49);
% 
% %+71
% GE_sino(:,:,77:147)=segment5(:,:,1:71);
% 
% %+93
% GE_sino(:,:,148:240)=segment3(:,:,1:93);
% 
% %+115
% GE_sino(:,:,241:355)=segment1(:,:,1:115);
% 
% %127
% GE_sino(:,:,356:482)=segment0(:,:,1:127);
% %step2 = GE_sino;
% 
% %-115
% GE_sino(:,:,483:597)=segment2(:,:,1:115);
% 
% %-93
% GE_sino(:,:,598:690)=segment4(:,:,1:93);
% 
% %-71
% GE_sino(:,:,691:761)=segment6(:,:,1:71);
% 
% %-49
% GE_sino(:,:,762:810)=segment8(:,:,1:49);
% 
% %-27
% GE_sino(:,:,811:837)=segment10(:,:,1:27);

% % ------------------------------------------------------------------------------------------------

% % ------------------------------------------------------------------------------------------------
% %  No Permute, same order as Siemens
% % ------------------------------------------------------------------------------------------------

% % Segment 0 - Direct Planes: 127
% Siemens_sino(:,:,1:127)=segment0(:,:,1:127);
% 
% % Segment 1: +115
% Siemens_sino(:,:,128:242)=segment1(:,:,1:115);
% 
% % Segment 2: -115
% Siemens_sino(:,:,244:359)=segment2(:,:,1:115);
% 
% % Segment 3: +93
% Siemens_sino(:,:,360:453)=segment3(:,:,1:93);
% 
% % Segment 4: -93
% Siemens_sino(:,:,454:547)=segment4(:,:,1:93);
% 
% % Segment 5: +71
% Siemens_sino(:,:,548:619)=segment5(:,:,1:71);
% 
% % Segment 6: -71
% Siemens_sino(:,:,620:691)=segment6(:,:,1:71);
% 
% % Segment 7: +49
% Siemens_sino(:,:,692:741)=segment7(:,:,1:49);
% 
% % Segment 8: -49
% Siemens_sino(:,:,742:791)=segment8(:,:,1:49);
% 
% % Segment 9: +27
% Siemens_sino(:,:,792:810)=segment9(:,:,1:27);
% 
% % Segment 10: -27
% Siemens_sino(:,:,811:837)=segment10(:,:,1:27);
% 
% % % ------------------------------------------------------------------------------------------------


% fid11=fopen('C:\Users\SUNY\Desktop\Test\debug1.s','w');
% [data11,count11]=fread(fid11,'float32');
% fclose(fid11);




% fid=segment9;
% [data,count]=fread(fid,'float32');
% fclose(fid);



% b1 = (9362304  /  4);
% b2 = (16990848  /  4);
% b3 = (24619392  /  4);
% b4 = (32247936  /  4);
% b5 = (39876480  /  4);
% b6 = (44037504 / 4);
% b7 = (b6 + b5);
% b8 = (b7 + b4);
% b9 = (b8 + b3);
% b10 = (b9 + b2);
% 
% % 27
%     data11(1:b1)=segment9;
% % %49
%     data11((b1+1):(b1+b2))=segment7;
% % %71
%     data11((b1+b2+1):(b2+b3))=segment5;
% % %93
%     data11((b1+b2+b3+1):(b3+b4))=segment3;
% % %115
%     data11((b1_b2+b3+b4+1):(b4+b5))=segment1;
% % %127
%     data11((b1+b2+b3+b4+b5+1):(b5+b6))=segment0;
% % %115
%     data11((b1+b2+b3+b4+b5+b6+1):(b6+b5))=segment2;
% % %93
%     data11((b1+b2+b3+b4+b5+b6+b7+1):(b7+b4))=segment4;
% % %71
%     data11((b1+b2+b3+b4+b5+b6+b7+b8+1):(b8+b3))=segment6;
% % %49
%     data11((b1+b2+b3+b4+b5+b6+b7+b8+b9+1):(b9+b2))=segment8;
% %27
%     data11((b1+b2+b3+b4+b5+b6+b7+b8+b9+b10+1):(b10+b1))=segment10;
%     
% 
% fid11=fopen('C:\Users\SUNY\Desktop\Test\GE_test_codechange.s','w');
% fwrite(fid11,data11,'float32');
% fclose(fid11);

% % % ------------------------------------------------------------------------------------------------
    % %                     WORKING
% % % ------------------------------------------------------------------------------------------------

% % 27
% for j = 1:(9362304 / 4)
%     data11(j)=segment9(j);
% end
% %49
% for j = (j+1):((j)+(16990848 / 4))
%     data11(j)=segment7(j-((9362304 / 4)));
% end
% %71
% for j = (j+1):((j)+(24619392 / 4))
%     data11(j)=segment5(j-(16990848 / 4)-(9362304 / 4));
% end
% %93
% for j = (j+1):((j)+(32247936 / 4))
%     data11(j)=segment3(j-(24619392 / 4)-(16990848 / 4)-(9362304 / 4));
% end
% %115
% for j = (j+1):((j)+(39876480 / 4))
%     data11(j)=segment1(j-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4));
% end
% %127
% for j = (j+1):((j)+(44037504 / 4))
%     data11(j)=segment0(j-(39876480 / 4)-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4));
% end
% %115
% for j = (j+1):((j)+(39876480 / 4))
%     data11(j)=segment2(j-(44037504 / 4)-(39876480 / 4)-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4));
% end
% %93
% for j = (j+1):((j)+(32247936 / 4))
%     data11(j)=segment4(j-(39876480 / 4)-(44037504 / 4)-(39876480 / 4)-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4));
% end
% %71
% for j = (j+1):((j)+(24619392 / 4))
%     data11(j)=segment6(j-(32247936 / 4)-(39876480 / 4)-(44037504 / 4)-(39876480 / 4)-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4));
% end
% %49
% for j = (j+1):((j)+(16990848 / 4))
%     data11(j)=segment8(j-(24619392 / 4)-(32247936 / 4)-(39876480 / 4)-(44037504 / 4)-(39876480 / 4)-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4));
% end
% %27
% for j = (j+1):((j)+(9362304 / 4))
%     data11(j)=segment10(j-(16990848 / 4)-(24619392 / 4)-(32247936 / 4)-(39876480 / 4)-(44037504 / 4)-(39876480 / 4)-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4));
% end
% 
% 
% fid11=fopen('C:\Users\SUNY\Desktop\Test\change_step1.s','w');
% fwrite(fid11,data11,'float32');
% fclose(fid11);
% % % ------------------------------------------------------------------------------------------------

% 27
for j = 1:(9362304 / 4)
    data11(j)=segment9(j);
end
%49
for j = (j+1):((j)+(16990848 / 4))
    data11(j)=segment7(j-((9362304 / 4)));
end
%71
for j = (j+1):((j)+(24619392 / 4))
    data11(j)=segment5(j-(16990848 / 4)-(9362304 / 4));
end
%93
for j = (j+1):((j)+(32247936 / 4))
    data11(j)=segment3(j-(24619392 / 4)-(16990848 / 4)-(9362304 / 4));
end
%115
for j = (j+1):((j)+(39876480 / 4))
    data11(j)=segment1(j-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4));
end
%127
for j = (j+1):((j)+(44037504 / 4))
    data11(j)=segment0(j-(39876480 / 4)-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4));
end
%115
for j = (j+1):((j)+(39876480 / 4))
    data11(j)=segment2(j-(44037504 / 4)-(39876480 / 4)-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4));
end
%93
for j = (j+1):((j)+(32247936 / 4))
    data11(j)=segment4(j-(39876480 / 4)-(44037504 / 4)-(39876480 / 4)-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4));
end
%71
for j = (j+1):((j)+(24619392 / 4))
    data11(j)=segment6(j-(32247936 / 4)-(39876480 / 4)-(44037504 / 4)-(39876480 / 4)-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4));
end
%49
for j = (j+1):((j)+(16990848 / 4))
    data11(j)=segment8(j-(24619392 / 4)-(32247936 / 4)-(39876480 / 4)-(44037504 / 4)-(39876480 / 4)-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4));
end
%27
for j = (j+1):((j)+(9362304 / 4))
    data11(j)=segment10(j-(16990848 / 4)-(24619392 / 4)-(32247936 / 4)-(39876480 / 4)-(44037504 / 4)-(39876480 / 4)-(32247936 / 4)-(24619392 / 4)-(16990848 / 4)-(9362304 / 4));
end


fid11=fopen('C:\Users\SUNY\Desktop\Test\test_working.s','w');
fwrite(fid11,data11,'float32');
fclose(fid11);



























    
% 
% 
% 
% fid11=fopen('C:\Users\SUNY\Desktop\Test\GE_prompts.s','w');
% fwrite(fid11,Siemens_sino,'float32');
% fclose(fid11);














% fid11=fopen('C:\Users\SUNY\Desktop\Test\step1_seg0.s','w');
% fwrite(fid11,step1_seg0,'float32');
% fclose(fid11);
% 
% 
% fid11=fopen('C:\Users\SUNY\Desktop\Test\step2_seg0.s','w');
% fwrite(fid11,step1_seg0,'float32');
% fclose(fid11);



% 
% fid11=fopen('C:\Users\SUNY\Desktop\Test\GE_prompts.s','w');
% fwrite(fid11,GE_sino,'float32');
% fclose(fid11);
