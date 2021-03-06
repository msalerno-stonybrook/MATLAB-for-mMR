% %----------------------------------------ACF SCALE FACTOR---------------------------------------------
prompts_avg = mean(mean(mean(prompts_q(:,:,:))));
SF = 1/prompts_avg;
% %---------------------------------------------------------------------------------------------------------
% %---------------------------------------SUM SINOGRAMS-----------------------------------------------------
for i=1:sx 
    prompts_q_sum(i) = sum(sum(prompts_q(i,:,:))); 
    randoms_q_sum(i) = sum(sum(randoms_q(i,:,:))); 
    trues_q_sum(i) = sum(sum(trues_q(i,:,:))); 
    acf_s_sum(i) = sum(sum(acf_s(i,:,:)));
    acf_s_sum(i) = rdivide(acf_s_sum(i),SF);
    scat_s_sum(i) = sum(sum(scat_s(i,:,:)));
end 
% %---------------------------------------------------------------------------------------------------------