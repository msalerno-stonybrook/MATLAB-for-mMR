% %----------------------------------------PLOT---------------------------------------------------
if Compare_Switch == 1
    plot(TA_matrix{1});
    legend(Image1);
end
if Compare_Switch == 2
    plot(TA_matrix{1});
    hold on;
    plot(TA_matrix{2});
    legend(Image1,Image2);
end
title('Image Compare')
set(legend,'location','northeastoutside');
ylabel('Total Activity');
xlabel(Xaxis_name);
xlim([1 k])
% %----------------------------------------------------------------------------------------------