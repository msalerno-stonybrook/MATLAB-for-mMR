prompts_q = fread(fid1,'float32');
fclose(fid1);
GE_sino = reshape(prompts_q, 344, 837, 252); 

segment0 = zeros(344, 837, 252);
segment1 = zeros(344, 837, 252);
segment2 = zeros(344, 837, 252);
segment3 = zeros(344, 837, 252);
segment4 = zeros(344, 837, 252);
segment5 = zeros(344, 837, 252);
segment6 = zeros(344, 837, 252);
segment7 = zeros(344, 837, 252);
segment8 = zeros(344, 837, 252);
segment9 = zeros(344, 837, 252);
segment10 = zeros(344, 837, 252);

%+27
segment9(:,1:27,:)=GE_sino(:,1:27,:);
segment9 = permute(segment9, [1 3 2]);

%+49
segment7(:,1:49,:)=GE_sino(:,28:76,:);
segment7 = permute(segment7, [1 3 2]);

%+71
segment5(:,1:71,:)=GE_sino(:,77:147,:);
segment5 = permute(segment5, [1 3 2]);

%+93
segment3(:,1:93,:)=GE_sino(:,148:240,:);
segment3 = permute(segment3, [1 3 2]);

%+115
segment1(:,1:115,:)=GE_sino(:,241:355,:);
segment1 = permute(segment1, [1 3 2]);

%127
segment0(:,1:127,:)=GE_sino(:,356:482,:);
segment0 = permute(segment0, [1 3 2]);

%-115
segment2(:,1:115,:)=GE_sino(:,483:597,:);
segment2 = permute(segment2, [1 3 2]);

%-93
segment4(:,1:93,:)=GE_sino(:,598:690,:);
segment4 = permute(segment4, [1 3 2]);

%-71
segment6(:,1:71,:)=GE_sino(:,691:761,:);
segment6 = permute(segment6, [1 3 2]);

%-49
segment8(:,1:49,:)=GE_sino(:,762:810,:);
segment8 = permute(segment8, [1 3 2]);

%-27
segment10(:,1:27,:)=GE_sino(:,811:837,:);
segment10 = permute(segment10, [1 3 2]);




Siemens_sino = zeros(344, 252, 837);


% Segment 0 - Direct Planes: 127
Siemens_sino(:,:,1:127)=segment0(:,:,1:127);

% Segment 1: +115
Siemens_sino(:,:,128:242)=segment1(:,:,1:115);

% Segment 2: -115
Siemens_sino(:,:,243:357)=segment2(:,:,1:115);

% Segment 3: +93
Siemens_sino(:,:,358:450)=segment3(:,:,1:93);

% Segment 4: -93
Siemens_sino(:,:,451:543)=segment4(:,:,1:93);

% Segment 5: +71
Siemens_sino(:,:,544:614)=segment5(:,:,1:71);

% Segment 6: -71
Siemens_sino(:,:,615:685)=segment6(:,:,1:71);

% Segment 7: +49
Siemens_sino(:,:,686:734)=segment7(:,:,1:49);

% Segment 8: -49
Siemens_sino(:,:,735:783)=segment8(:,:,1:49);

% Segment 9: +27
Siemens_sino(:,:,784:810)=segment9(:,:,1:27);

% Segment 10: -27
Siemens_sino(:,:,811:837)=segment10(:,:,1:27);

