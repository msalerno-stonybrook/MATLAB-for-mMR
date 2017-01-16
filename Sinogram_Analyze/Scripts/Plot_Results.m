% %---------------------------------------------------------------------% %
% %-------------------------------One Sinograms--------------------------% %
% %---------------------------------------------------------------------% %
if NumSinos == 1
    k=1;
    figure;
    if Prompts_switch == 1
        SinoNameMatrix2{k}=SinoNameMatrix{1};
        k=k+1;
        SinoMatrix=SinoMatrix_q{1};
        plot(SinoMatrix{1},'r'); 
        hold on; 
    end
    if Randoms_switch == 1
        SinoNameMatrix2{k}=SinoNameMatrix{2};
        k=k+1;
        SinoMatrix=SinoMatrix_q{1};
        plot(SinoMatrix{2},'b'); 
        hold on;
    end
    if Trues_switch == 1
        SinoNameMatrix2{k}=SinoNameMatrix{3};
        k=k+1;
        SinoMatrix=SinoMatrix_q{1};
        plot(SinoMatrix{3},'g'); 
        hold on;
    end
    if ACF_switch == 1
        SinoNameMatrix2{k}=SinoNameMatrix{4};
        k=k+1;
        SinoMatrix=SinoMatrix_q{1};
        plot(SinoMatrix{4},'k');
        hold on;
    end
    if Scatter_switch == 1
        SinoNameMatrix2{k}=SinoNameMatrix{5};
        k=k+1;
        SinoMatrix=SinoMatrix_q{1};
        plot(SinoMatrix{5},'y');
    end
    if Use_bars == 1
        plot(bar1, 'k');
        ylim([0 max(prompts_q_sum)]);
    end
     legend(SinoNameMatrix2);
     ylabel('counts'); 
     xlabel('radial bin'); 
end

% %---------------------------------------------------------------------% %
% %-------------------------------Two Sinograms--------------------------% %
% %---------------------------------------------------------------------% %
if NumSinos == 2
% %-------------------------------For One Graph--------------------------% %
    if MulitPlot_switch == 0
        k=1;
        figure;
        if Prompts_switch == 1
            SinoNameMatrix2{k}=strcat(SinoNameMatrix{1},' 1');
            k=k+1;
            SinoMatrix=SinoMatrix_q{1};
            plot(SinoMatrix{1},'r'); 
            hold on; 
            SinoNameMatrix2{k}=strcat(SinoNameMatrix{1},' 2');
            k=k+1;
            SinoMatrix=SinoMatrix_q{2};
            plot(SinoMatrix{1},'r--'); 
            hold on; 
        end
        if Randoms_switch == 1
            SinoNameMatrix2{k}=strcat(SinoNameMatrix{2},' 1');
            k=k+1;
            SinoMatrix=SinoMatrix_q{1};
            plot(SinoMatrix{2},'b'); 
            hold on;
            SinoNameMatrix2{k}=strcat(SinoNameMatrix{2},' 2');
            k=k+1;
            SinoMatrix=SinoMatrix_q{2};
            plot(SinoMatrix{2},'b--'); 
            hold on;
        end
        if Trues_switch == 1
            SinoNameMatrix2{k}=strcat(SinoNameMatrix{3},' 1');
            k=k+1;
            SinoMatrix=SinoMatrix_q{1};
            plot(SinoMatrix{3},'g'); 
            hold on;
            SinoNameMatrix2{k}=strcat(SinoNameMatrix{3},' 2');
            k=k+1;
            SinoMatrix=SinoMatrix_q{2};
            plot(SinoMatrix{3},'g--'); 
            hold on;
        end
        if ACF_switch == 1
            SinoNameMatrix2{k}=strcat(SinoNameMatrix{4},' 1');
            k=k+1;
            SinoMatrix=SinoMatrix_q{1};
            plot(SinoMatrix{4},'k');
            hold on;
            if Diff_ACF == 1
                SinoNameMatrix2{k}=strcat(SinoNameMatrix{4},' 2');
                k=k+1;
                SinoMatrix=SinoMatrix_q{2};
                plot(SinoMatrix{4},'k--');
                hold on;
            end
        end
        if Scatter_switch == 1
            SinoNameMatrix2{k}=strcat(SinoNameMatrix{5},' 1');;
            k=k+1;
            SinoMatrix=SinoMatrix_q{1};
            plot(SinoMatrix{5},'y');
            hold on;
            SinoNameMatrix2{k}=strcat(SinoNameMatrix{5},' 2');
            k=k+1;
            SinoMatrix=SinoMatrix_q{2};
            plot(SinoMatrix{5},'y--');
        end
        if Use_bars == 1
            if prompts_q_sum2 >= prompts_q_sum
                y_limit = prompts_q_sum2;
            else
                y_limit = prompts_q_sum;
            end
            plot(bar1, 'k');
            ylim([0 max(prompts_q_sum)]);
        end
        legend(SinoNameMatrix2);
        ylabel('counts'); 
        xlabel('radial bin'); 
    end
end
% %---------------------------------------------------------------------% %
% %---------------------------------------------------------------------% %
% %-------------------------------Two Sinograms--------------------------% %
% %---------------------------------------------------------------------% %
if NumSinos == 2
    if MulitPlot_switch == 1
        k=1;
        % %---------------------------------------------------------------------% %
        figure;
        if Prompts_switch == 1
            SinoNameMatrix2{k}=strcat(SinoNameMatrix{1},' 1');
            k=k+1;
            SinoMatrix=SinoMatrix_q{1};
            plot(SinoMatrix{1},'r'); 
            hold on; 
        end
        if Randoms_switch == 1
            SinoNameMatrix2{k}=strcat(SinoNameMatrix{2},' 1');
            k=k+1;
            SinoMatrix=SinoMatrix_q{1};
            plot(SinoMatrix{2},'b'); 
            hold on;
        end
        if Trues_switch == 1
            SinoNameMatrix2{k}=strcat(SinoNameMatrix{3},' 1');
            k=k+1;
            SinoMatrix=SinoMatrix_q{1};
            plot(SinoMatrix{3},'g'); 
            hold on;
        end
        if ACF_switch == 1
            SinoNameMatrix2{k}=strcat(SinoNameMatrix{4},' 1');
            k=k+1;
            SinoMatrix=SinoMatrix_q{1};
            plot(SinoMatrix{4},'k');
            hold on;
        end
        if Scatter_switch == 1
            SinoNameMatrix2{k}=strcat(SinoNameMatrix{5},' 1');
            k=k+1;
            SinoMatrix=SinoMatrix_q{1};
            plot(SinoMatrix{5},'y');
        end
        if Use_bars == 1
            plot(bar1, 'k');
            ylim([0 max(prompts_q_sum2)]);
        end
        legend(SinoNameMatrix2);
        ylabel('counts'); 
        xlabel('radial bin'); 
% %---------------------------------------------------------------------% %
        figure;
        k=1;
        if Prompts_switch == 1
            SinoNameMatrix2{k}=strcat(SinoNameMatrix{1},' 2');
            k=k+1;
            SinoMatrix=SinoMatrix_q{2};
            plot(SinoMatrix{1},'r'); 
            hold on; 
        end
        if Randoms_switch == 1
            SinoNameMatrix2{k}=strcat(SinoNameMatrix{2},' 2');
            k=k+1;
            SinoMatrix=SinoMatrix_q{2};
            plot(SinoMatrix{2},'b'); 
            hold on;
        end
        if Trues_switch == 1
            SinoNameMatrix2{k}=strcat(SinoNameMatrix{3},' 2');
            k=k+1;
            SinoMatrix=SinoMatrix_q{2};
            plot(SinoMatrix{3},'g'); 
            hold on;
        end
        if ACF_switch == 1
            if Diff_ACF == 1
                SinoNameMatrix2{k}=strcat(SinoNameMatrix{4},' 2');
            else
                SinoNameMatrix2{k}=strcat(SinoNameMatrix{4},' 1');
            end
            k=k+1;
            SinoMatrix=SinoMatrix_q{2};
            plot(SinoMatrix{4},'k');
            hold on;
        end
        if Scatter_switch == 1
            SinoNameMatrix2{k}=strcat(SinoNameMatrix{5},' 2');
            k=k+1;
            SinoMatrix=SinoMatrix_q{2};
            plot(SinoMatrix{5},'y');
        end
        if Use_bars == 1
            plot(bar2, 'k');
            ylim([0 max(prompts_q_sum)]);
        end
        legend(SinoNameMatrix2);
        ylabel('counts'); 
        xlabel('radial bin'); 
    end
end
% %---------------------------------------------------------------------% %


     
     
% % figure; 
% % semilogy(prompts_q_sum,'r'); 
% % hold on; 
% % semilogy(randoms_q_sum, 'g');
% % hold on;
% % plot(acf_s_sum, 'b');
% % legend('Prompts - Frame 11', 'Randoms - Frame 11','ACF'); 
% % ylabel('counts'); 
% % xlabel('radial bins');
% 
% figure; 
% plot(prompts_q1_sum,'r'); 
% hold on; 
% plot(randoms_q1_sum, 'g');
% hold on;
% plot(acf_s_sum, 'b');
% legend('Prompts - Frame 9', 'Randoms - Frame 9','ACF'); 
% ylabel('counts'); 
% xlabel('radial bins'); 
%  
% % figure; 
% % semilogy(prompts_q1_sum,'r'); 
% % hold on; 
% % semilogy(randoms_q1_sum, 'g'); 
% % hold on;
% % plot(acf_s1_sum, 'b');
% % legend('Prompts - Frame 12', 'Randoms - Frame 12','ACF'); 
% % ylabel('counts'); 
% % xlabel('radial bins');
% 
%
% figure; 
% plot(trues_q_sum,'r'); 
% hold on; 
% plot(trues_q1_sum, 'g'); 
% hold on;
% plot(acf_s_sum, 'b');
% hold on;
% plot(bar1, 'k');
% legend('Trues - Frame 8', 'Trues - Frame 9','ACF'); 
% ylabel('counts'); 
% xlabel('radial bins'); 
% ylim([0 50000]);
%  
% % figure; 
% % semilogy(trues_q_sum,'r'); 
% % hold on; 
% % semilogy(trues_q1_sum, 'g'); 
% % hold on;
% % plot(acf_s1_sum, 'b');
% % legend('Trues - Frame 11', 'Trues - Frame 12','ACF'); 
% % ylabel('counts'); 
% % xlabel('radial bins');

cd (MFolder2)