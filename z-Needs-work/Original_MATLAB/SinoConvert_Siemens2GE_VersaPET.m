fid1=fopen('C:\Users\SUNY\Desktop\prompt_micro_hotrod_0001.scn');

% %---------------------------------------------------------------------------------------------------------
% %                                            CONSTANTS
% %---------------------------------------------------------------------------------------------------------

% % SINOGRAM
sx = 191;
sy = 96;
% There are 31 segments, 256 slices
sz = 256;

% Bytes of 1 slice
szslice = (73344/4);

s0=16;
s1=15;
s2=14;
s3=13;
s4=12;
s5=11;
s6=10;
s7=9;
s8=8;
s9=7;
s10=6;
s11=5;
s12=4;
s13=3;
s14=2;
s15=1;

% %---------------------------------------------------------------------------------------------------------

prompts_q = fread(fid1,'int32');
fclose(fid1);
prompts_s = reshape(prompts_q, sx, sy, sz); 

segment0 = zeros(sx, sy, s0);
segment1 = zeros(sx, sy, s1);
segment2 = zeros(sx, sy, s1);
segment3 = zeros(sx, sy, s2);
segment4 = zeros(sx, sy, s2);
segment5 = zeros(sx, sy, s3);
segment6 = zeros(sx, sy, s3);
segment7 = zeros(sx, sy, s4);
segment8 = zeros(sx, sy, s4);
segment9 = zeros(sx, sy, s5);
segment10 = zeros(sx, sy, s5);
segment11 = zeros(sx, sy, s6);
segment12 = zeros(sx, sy, s6);
segment13 = zeros(sx, sy, s7);
segment14 = zeros(sx, sy, s7);
segment15 = zeros(sx, sy, s8);
segment16 = zeros(sx, sy, s8);
segment17 = zeros(sx, sy, s9);
segment18 = zeros(sx, sy, s9);
segment19 = zeros(sx, sy, s10);
segment20 = zeros(sx, sy, s10);
segment21 = zeros(sx, sy, s11);
segment22 = zeros(sx, sy, s11);
segment23 = zeros(sx, sy, s12);
segment24 = zeros(sx, sy, s12);
segment25 = zeros(sx, sy, s13);
segment26 = zeros(sx, sy, s13);
segment27 = zeros(sx, sy, s14);
segment28 = zeros(sx, sy, s14);
segment29 = zeros(sx, sy, s15);
segment30 = zeros(sx, sy, s15);

% GE_sino = zeros(sx, sz, sy);

% Segment 0 - Direct Planes: 16
segment0(:,:,1:s0) = prompts_s(:,:,1:s0);
segment0 = permute(segment0, [1 3 2]);
step1_seg0=segment0;
% Segment 1: +15
segment1(:,:,1:s1) = prompts_s(:,:,(s0+1):(s0+s1));
segment1 = permute(segment1, [1 3 2]);
% Segment 2: -15
segment2(:,:,1:s1) = prompts_s(:,:,(s0+s1+1):(s0+(2*s1)));
segment2 = permute(segment2, [1 3 2]);
% Segment 3: +14
segment3(:,:,1:s2) = prompts_s(:,:,(s0+(2*s1)+1):(s0+(2*s1)+s2));
segment3 = permute(segment3, [1 3 2]);
% Segment 4: -14
segment4(:,:,1:s2) = prompts_s(:,:,(s0+(2*s1)+s2+1):(s0+(2*s1)+(2*s2)));
segment4 = permute(segment4, [1 3 2]);
% Segment 5: +13
segment5(:,:,1:s3) = prompts_s(:,:,(s0+(2*s1)+(2*s2)+1):(s0+(2*s1)+(2*s2)+s3));
segment5 = permute(segment5, [1 3 2]);
% Segment 6: -13
segment6(:,:,1:s3) = prompts_s(:,:,(s0+(2*s1)+(2*s2)+s3+1):(s0+(2*s1)+(2*s2)+(2*s3)));
segment6 = permute(segment6, [1 3 2]);
% Segment 7: +12
segment7(:,:,1:s4) = prompts_s(:,:,(s0+(2*s1)+(2*s2)+(2*s3)+1):(s0+(2*s1)+(2*s2)+(2*s3)+s4));
segment7 = permute(segment7, [1 3 2]);
% Segment 8: -12
segment8(:,:,1:s4) = prompts_s(:,:,s0+(2*s1)+(2*s2)+(2*s3)+s4+1:(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)));
segment8 = permute(segment8, [1 3 2]);
% Segment 9: +11
segment9(:,:,1:s5) = prompts_s(:,:,(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+1):(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+s5));
segment9 = permute(segment9, [1 3 2]);
% Segment 10: -11
segment10(:,:,1:s5) = prompts_s(:,:,(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+s5+1):(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)));
segment10 = permute(segment10, [1 3 2]);
% Segment 11: +10
segment11(:,:,1:s6) = prompts_s(:,:,(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+1):(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+s6));
segment11 = permute(segment11, [1 3 2]);
% Segment 12: -10
segment12(:,:,1:s6) = prompts_s(:,:,(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+s6+1):(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)));
segment12 = permute(segment12, [1 3 2]);
% Segment 13: +9
segment13(:,:,1:s7) = prompts_s(:,:,(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+1):(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+s7));
segment13 = permute(segment13, [1 3 2]);
% Segment 14: -9
segment14(:,:,1:s7) = prompts_s(:,:,(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+s7+1):(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)));
segment14 = permute(segment14, [1 3 2]);
% Segment 15: +8
segment15(:,:,1:s8) = prompts_s(:,:,(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+1):(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+s8));
segment15 = permute(segment15, [1 3 2]);
% Segment 16: -8
segment16(:,:,1:s8) = prompts_s(:,:,(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+s8+1):(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)));
segment16 = permute(segment16, [1 3 2]);
% Segment 17: +7
segment17(:,:,1:s9) = prompts_s(:,:,(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+1):(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+s9));
segment17 = permute(segment17, [1 3 2]);
% Segment 18: -7
segment18(:,:,1:s9) = prompts_s(:,:,(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+s9+1):(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+(2*s9)));
segment18 = permute(segment18, [1 3 2]);
% Segment 19: +6
segment19(:,:,1:s10) = prompts_s(:,:,(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+(2*s9)+1):(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+(2*s9)+s10));
segment19 = permute(segment19, [1 3 2]);
% Segment 20: -6
segment20(:,:,1:s10) = prompts_s(:,:,(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+(2*s9)+s10+1):(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+(2*s9)+(2*s10)));
segment20 = permute(segment20, [1 3 2]);
% Segment 21: +5
segment21(:,:,1:s11) = prompts_s(:,:,(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+(2*s9)+(2*s10)+1):(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+(2*s9)+(2*s10)+s11));
segment21 = permute(segment21, [1 3 2]);
% Segment 22: -5
segment22(:,:,1:s11) = prompts_s(:,:,(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+(2*s9)+(2*s10)+s11+1):(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+(2*s9)+(2*s10)+(2*s11)));
segment22 = permute(segment22, [1 3 2]);
% Segment 23: +4
segment23(:,:,1:s12) = prompts_s(:,:,(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+(2*s9)+(2*s10)+(2*s11)+1):(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+(2*s9)+(2*s10)+(2*s11)+s12));
segment23 = permute(segment23, [1 3 2]);
% Segment 24: -4
segment24(:,:,1:s12) = prompts_s(:,:,(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+(2*s9)+(2*s10)+(2*s11)+s12+1):(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+(2*s9)+(2*s10)+(2*s11)+(2*s12)));
segment24 = permute(segment24, [1 3 2]);
% Segment 25: +3
segment25(:,:,1:s13) = prompts_s(:,:,(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+(2*s9)+(2*s10)+(2*s11)+(2*s12)+1):(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+(2*s9)+(2*s10)+(2*s11)+(2*s12)+s13));
segment25 = permute(segment25, [1 3 2]);
% Segment 26: -3
segment26(:,:,1:s13) = prompts_s(:,:,(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+(2*s9)+(2*s10)+(2*s11)+(2*s12)+s13+1):(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+(2*s9)+(2*s10)+(2*s11)+(2*s12)+(2*s13)));
segment26 = permute(segment26, [1 3 2]);
% Segment 27: +2
segment27(:,:,1:s14) = prompts_s(:,:,(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+(2*s9)+(2*s10)+(2*s11)+(2*s12)+(2*s13)+1):(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+(2*s9)+(2*s10)+(2*s11)+(2*s12)+(2*s13)+s14));
segment27 = permute(segment27, [1 3 2]);
% Segment 28: -2
segment28(:,:,1:s14) = prompts_s(:,:,(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+(2*s9)+(2*s10)+(2*s11)+(2*s12)+(2*s13)+s14+1):(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+(2*s9)+(2*s10)+(2*s11)+(2*s12)+(2*s13)+(2*s14)));
segment28 = permute(segment28, [1 3 2]);
% Segment 29: +1
segment29(:,:,1:s15) = prompts_s(:,:,(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+(2*s9)+(2*s10)+(2*s11)+(2*s12)+(2*s13)+(2*s14)+1):(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+(2*s9)+(2*s10)+(2*s11)+(2*s12)+(2*s13)+(2*s14)+s15));
segment29 = permute(segment29, [1 3 2]);
% Segment 30: -1
segment30(:,:,1:s15) = prompts_s(:,:,(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+(2*s9)+(2*s10)+(2*s11)+(2*s12)+(2*s13)+(2*s14)+s15+1):(s0+(2*s1)+(2*s2)+(2*s3)+(2*s4)+(2*s5)+(2*s6)+(2*s7)+(2*s8)+(2*s9)+(2*s10)+(2*s11)+(2*s12)+(2*s13)+(2*s14)+(2*s15)));
segment30 = permute(segment30, [1 3 2]);

% GE_sino(:,:,(1:s15)) = segment29(:,:,:);
% GE_sino(:,:,(s15+1):(s15+s14)) = segment27(:,:,:);
% GE_sino(:,:,(s15+s14+1):(s15+s14+s13)) = segment25(:,:,:);
% GE_sino(:,:,(s15+s14+s13+1):(s15+s14+s13+s12)) = segment23(:,:,:);
% GE_sino(:,:,(s15+s14+s13+s12+1):(s15+s14+s13+s12+s11)) = segment21(:,:,:);
% GE_sino(:,:,(s15+s14+s13+s12+s11+1):(s15+s14+s13+s12+s11+s10)) = segment19(:,:,:);
% GE_sino(:,:,(s15+s14+s13+s12+s11+s10+1):(s15+s14+s13+s12+s11+s10+s9)) = segment17(:,:,:);
% GE_sino(:,:,(s15+s14+s13+s12+s11+s10+s9+1):(s15+s14+s13+s12+s11+s10+s9+s8)) = segment15(:,:,:);
% GE_sino(:,:,(s15+s14+s13+s12+s11+s10+s9+s8+1):(s15+s14+s13+s12+s11+s10+s9+s8+s7)) = segment13(:,:,:);
% GE_sino(:,:,(s15+s14+s13+s12+s11+s10+s9+s8+s7+1):(s15+s14+s13+s12+s11+s10+s9+s8+s7+s6)) = segment11(:,:,:);
% GE_sino(:,:,(s15+s14+s13+s12+s11+s10+s9+s8+s7+s6+1):(s15+s14+s13+s12+s11+s10+s9+s8+s7+s6+s5)) = segment9(:,:,:);
% GE_sino(:,:,(s15+s14+s13+s12+s11+s10+s9+s8+s7+s6+s5+1):(s15+s14+s13+s12+s11+s10+s9+s8+s7+s6+s5+s4)) = segment7(:,:,:);
% GE_sino(:,:,(s15+s14+s13+s12+s11+s10+s9+s8+s7+s6+s5+s4+1):(s15+s14+s13+s12+s11+s10+s9+s8+s7+s6+s5+s4+s3)) = segment5(:,:,:);
% GE_sino(:,:,(s15+s14+s13+s12+s11+s10+s9+s8+s7+s6+s5+s4+s3+1):(s15+s14+s13+s12+s11+s10+s9+s8+s7+s6+s5+s4+s3+s2)) = segment3(:,:,:);
% GE_sino(:,:,(s15+s14+s13+s12+s11+s10+s9+s8+s7+s6+s5+s4+s3+s2+1):(s15+s14+s13+s12+s11+s10+s9+s8+s7+s6+s5+s4+s3+s2+s1)) = segment1(:,:,:);
% GE_sino(:,:,(s15+s14+s13+s12+s11+s10+s9+s8+s7+s6+s5+s4+s3+s2+s1+1):(s15+s14+s13+s12+s11+s10+s9+s8+s7+s6+s5+s4+s3+s2+s1+s0)) = segment0(:,:,:);
% 
% ss1=(s15+s14+s13+s12+s11+s10+s9+s8+s7+s6+s5+s4+s3+s2+s1+s0);
% 
% GE_sino(:,:,(ss1+1):(ss1+s1)) = segment2(:,:,:);
% GE_sino(:,:,(ss1+s1+1):(ss1+s1+s2)) = segment4(:,:,:);
% GE_sino(:,:,(ss1+s1+s2+1):(ss1+s1+s2+s3)) = segment6(:,:,:);
% GE_sino(:,:,(ss1+s1+s2+s3+1):(ss1+s1+s2+s3+s4)) = segment8(:,:,:);
% GE_sino(:,:,(ss1+s1+s2+s3+s4+1):(ss1+s1+s2+s3+s4+s5)) = segment10(:,:,:);
% GE_sino(:,:,(ss1+s1+s2+s3+s4+s5+1):(ss1+s1+s2+s3+s4+s5+s6)) = segment12(:,:,:);
% GE_sino(:,:,(ss1+s1+s2+s3+s4+s5+s6+1):(ss1+s1+s2+s3+s4+s5+s6+s7)) = segment14(:,:,:);
% GE_sino(:,:,(ss1+s1+s2+s3+s4+s5+s6+s7+1):(ss1+s1+s2+s3+s4+s5+s6+s7+s8)) = segment16(:,:,:);
% GE_sino(:,:,(ss1+s1+s2+s3+s4+s5+s6+s7+s8+1):(ss1+s1+s2+s3+s4+s5+s6+s7+s8+s9)) = segment18(:,:,:);
% GE_sino(:,:,(ss1+s1+s2+s3+s4+s5+s6+s7+s8+s9+1):(ss1+s1+s2+s3+s4+s5+s6+s7+s8+s9+s10)) = segment20(:,:,:);
% GE_sino(:,:,(ss1+s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+1):(ss1+s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11)) = segment22(:,:,:);
% GE_sino(:,:,(ss1+s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+1):(ss1+s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12)) = segment24(:,:,:);
% GE_sino(:,:,(ss1+s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+1):(ss1+s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13)) = segment26(:,:,:);
% GE_sino(:,:,(ss1+s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+1):(ss1+s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14)) = segment28(:,:,:);
% GE_sino(:,:,(ss1+s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+1):(ss1+s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15)) = segment30(:,:,:);


% 1
for j = 1:(szslice)
    GE_sino(j)=segment29(j);
end
% 2
for j = (j+1):((j)+(2*szslice))
    GE_sino(j)=segment27(j-((szslice)));
end
% 3
for j = (j+1):((j)+(3*szslice))
    GE_sino(j)=segment25(j-((3*szslice)));
end
% 4
for j = (j+1):((j)+(4*szslice))
    GE_sino(j)=segment23(j-((6*szslice)));
end
% 5
for j = (j+1):((j)+(5*szslice))
    GE_sino(j)=segment21(j-((10*szslice)));
end
% 6
for j = (j+1):((j)+(6*szslice))
    GE_sino(j)=segment19(j-((15*szslice)));
end
% 7
for j = (j+1):((j)+(7*szslice))
    GE_sino(j)=segment17(j-((21*szslice)));
end
% 8
for j = (j+1):((j)+(8*szslice))
    GE_sino(j)=segment15(j-((28*szslice)));
end
% 9
for j = (j+1):((j)+(9*szslice))
    GE_sino(j)=segment13(j-((36*szslice)));
end
% 10
for j = (j+1):((j)+(10*szslice))
    GE_sino(j)=segment11(j-((45*szslice)));
end
% 11
for j = (j+1):((j)+(11*szslice))
    GE_sino(j)=segment9(j-((55*szslice)));
end
% 12
for j = (j+1):((j)+(12*szslice))
    GE_sino(j)=segment7(j-((66*szslice)));
end
% 13
for j = (j+1):((j)+(13*szslice))
    GE_sino(j)=segment5(j-((78*szslice)));
end
% 14
for j = (j+1):((j)+(14*szslice))
    GE_sino(j)=segment3(j-((91*szslice)));
end
% 15 
for j = (j+1):((j)+(15*szslice))
    GE_sino(j)=segment1(j-((105*szslice)));
end
% 16
for j = (j+1):((j)+(16*szslice))
    GE_sino(j)=segment0(j-((120*szslice)));
end
% 15
for j = (j+1):((j)+(15*szslice))
    GE_sino(j)=segment2(j-((136*szslice)));
end
% 14
for j = (j+1):((j)+(14*szslice))
    GE_sino(j)=segment4(j-((151*szslice)));
end
% 13
for j = (j+1):((j)+(13*szslice))
    GE_sino(j)=segment6(j-((165*szslice)));
end
% 12
for j = (j+1):((j)+(12*szslice))
    GE_sino(j)=segment8(j-((178*szslice)));
end
% 11
for j = (j+1):((j)+(11*szslice))
    GE_sino(j)=segment10(j-((190*szslice)));
end
% 10
for j = (j+1):((j)+(10*szslice))
    GE_sino(j)=segment12(j-((201*szslice)));
end
% 9
for j = (j+1):((j)+(9*szslice))
    GE_sino(j)=segment14(j-((211*szslice)));
end
% 8
for j = (j+1):((j)+(8*szslice))
    GE_sino(j)=segment16(j-((220*szslice)));
end
% 7
for j = (j+1):((j)+(7*szslice))
    GE_sino(j)=segment18(j-((228*szslice)));
end
% 6
for j = (j+1):((j)+(6*szslice))
    GE_sino(j)=segment20(j-((235*szslice)));
end
% 5
for j = (j+1):((j)+(5*szslice))
    GE_sino(j)=segment22(j-((241*szslice)));
end
% 4
for j = (j+1):((j)+(4*szslice))
    GE_sino(j)=segment24(j-((246*szslice)));
end
% 3
for j = (j+1):((j)+(3*szslice))
    GE_sino(j)=segment26(j-((250*szslice)));
end
% 2
for j = (j+1):((j)+(2*szslice))
    GE_sino(j)=segment28(j-((253*szslice)));
end
% 1
for j = (j+1):((j)+(1*szslice))
    GE_sino(j)=segment30(j-((255*szslice)));
end


fid = fopen('C:\Users\SUNY\Desktop\VersaPET_sino_convert_test.s','w');
fwrite(fid,GE_sino,'int32');
fclose(fid);
