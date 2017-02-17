close all;
% 
% 
% figure;
% histfit(FBPNormal,100)
% set(gca, 'Xlim', [-50 50])
% grid
% title('FBP - Normal Counts')
% ylabel('Counts'); 
% xlabel('Average Percent Difference'); 
% 
% figure;
% histfit(MLEMNormal,100)
% set(gca, 'Xlim', [-50 50])
% grid
% title('MLEM - Normal Counts')
% ylabel('Counts'); 
% xlabel('Average Percent Difference'); 
% 
% figure;
% histfit(FBPNormal,100)
% hold on;
% histfit(FBPNormal,100)
% set(gca, 'Xlim', [-50 50])
% grid
% title('Normal Counts')
% legend('FBP','MLEM');
% ylabel('Counts'); 
% xlabel('Average Percent Difference'); 
% 
% 
% 
% 
% figure;
% histfit(MLEMLow,100)
% set(gca, 'Xlim', [-50 50])
% grid
% title('MLEM - Low Counts')
% ylabel('Counts'); 
% xlabel('Average Percent Difference'); 
% 
% 
% figure;
% histfit(FBPLow,100)
% set(gca, 'Xlim', [-50 50])
% grid
% title('FBP - Low Counts')
% ylabel('Counts'); 
% xlabel('Average Percent Difference'); 
% 
% figure;
% histfit(FBPLow,100)
% hold on;
% histfit(FBPLow,100)
% set(gca, 'Xlim', [-50 50])
% grid
% title('Low Counts')
% legend('FBP','MLEM');
% ylabel('Counts'); 
% xlabel('Average Percent Difference'); 














figure;
histogram(FBPNormal,100); 
set(gca, 'Xlim', [-15 15])
title('FBP - Normal Counts')
ylabel('Counts'); 
xlabel('Average Percent Difference'); 

figure;
histogram(MLEMNormal,100);
set(gca, 'Xlim', [-15 15])
title('MLEM - Normal Counts')
ylabel('Counts'); 
xlabel('Average Percent Difference'); 


figure;
histogram(FBPNormal,100); 
hold on;
histogram(MLEMNormal,100); 
title('Normal Counts')
legend('FBP','MLEM');
ylabel('Counts'); 
xlabel('Average Percent Difference'); 





figure;
histogram(FBPLow,100); 
set(gca, 'Xlim', [-20 70])
title('FBP - Low Counts')
ylabel('Counts'); 
xlabel('Average Percent Difference'); 

figure;
histogram(MLEMLow,100); 
set(gca, 'Xlim', [-20 70])
title('MLEM - Low Counts')
ylabel('Counts'); 
xlabel('Average Percent Difference'); 


figure;
histogram(FBPLow,100); 
hold on;
histogram(MLEMLow,100); 
title('Low Counts')
legend('FBP','MLEM');
ylabel('Counts'); 
xlabel('Average Percent Difference'); 




