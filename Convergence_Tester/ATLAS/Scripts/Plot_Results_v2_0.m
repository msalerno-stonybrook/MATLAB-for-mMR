% clear legends legends2 % for debug purposes
% %-----------------------------------------------------------------------------------------------
% %                                   PLOT DATA ON SEPARATE GRAPHS
% %-----------------------------------------------------------------------------------------------
ylabel_bank={'Percent Difference from Reference','Total Activity','Regional Total Activity','Regional Averaged Activity','Regional Standard Deviation','Percent Difference from Noiseless FBP Image'};
legend_bank={BR_name_array,'Whole Image',BR_name_array,BR_name_array,BR_name_array,BR_name_array};
m= 1;
if PDref_switch == 1
    ylabels{m} = ylabel_bank{1};
    legends{m} = legend_bank{1};
    m=m+1;
end
if TA_switch == 1
    ylabels{m} = ylabel_bank{2};
    legends{m} = legend_bank{2};
    m=m+1;
end
if TAR_switch == 1
    ylabels{m} = ylabel_bank{3};
    legends{m} = legend_bank{3};
    m=m+1;
end
if AAR_switch == 1
    ylabels{m} = ylabel_bank{4};
    legends{m} = legend_bank{4};
    m=m+1;
end
if SDR_switch == 1
    ylabels{m} = ylabel_bank{5};
    legends{m} = legend_bank{5};
    m=m+1;
end
if PDFBP_switch == 1
    ylabels{m} = ylabel_bank{6};
    legends{m} = legend_bank{6};
    m=m+1;
end
% %-----------------------------------------------------------------------------------------------
if PlotSameGraph == 0
    PlotSeparateGraph_v1_1
end %end PlotSameGraph = 0
% %-----------------------------------------------------------------------------------------------


% %-----------------------------------------------------------------------------------------------
% %                         PLOT ON SAME GRAPH FOR ALL IMAGE SETS
% %-----------------------------------------------------------------------------------------------
if PlotSameGraph == 1
for q = 1 : length(img_set_data)
    tmpTA_lgd={strcat('Whole Image',img_set_names{1}{q})};
    tmpTA_lgd2{q}= tmpTA_lgd;
    tmp_lgd = strcat(legend_bank{1},img_set_names{1}{q});
    tmp_lgd2{q}=tmp_lgd;   
end %end q loop
for q = 1 : num_img_set
    if q == 1
        tmp_lgd3=tmp_lgd2{1};
        tmpTA_lgd3=tmpTA_lgd2{1};    
    else
        tmp_lgd3=horzcat(tmp_lgd3,tmp_lgd2{q});
        tmpTA_lgd3=horzcat(tmpTA_lgd3,tmpTA_lgd2{q}); 
    end
end
n = 1;
if PDref_switch == 1
    legends2{n} = tmp_lgd3;
    n=n+1;
end
if TA_switch == 1
legends2{n} = tmpTA_lgd3;
    n=n+1;
end
if TAR_switch == 1
    legends2{n} = tmp_lgd3;
    n=n+1;
end
if AAR_switch == 1
    legends2{n} = tmp_lgd3;
    n=n+1;
end
if SDR_switch == 1
    legends2{n} = tmp_lgd3;
    n=n+1;
end
if PDFBP_switch == 1
    legends2{n} = tmp_lgd3;
end
% %-----------------------------------------------------------------------------------------------
% Create an array of the plot specifications 
color_array = {'r','b','g','c','m','y','k',''};
line_specs = {'-','--',':','-.','-x','+','*','o'};
g = 1; % for TA color/line array
% %-----------------------------------------------------------------------------------------------
t = 1;

if PD_switch == 1
    figure;
    line_trk = 1;
    for q = 1 : num_img_set 
        colr_trk = 1;
        BR = BR_start; %reset BR
        for BR = 1 : length(BR_array)
            if custom_iter_switch == 0
                if BR_select2{BR}==1;
%                 plot(img_set_data{q}{8},img_set_plot{q}{t}{BR},strcat(color_array{colr_trk},line_specs{line_trk }));
                plot(img_set_data{q}{8},img_set_plot{q}{t}{BR},line_specs{line_trk });
                hold on;
                
                colr_trk=colr_trk+1;
                if colr_trk == 8
                    colr_trk = 1;
                else %else BR loop condition for color track
                end %end BR loop condition for color track
                end
            else
                if BR_select2{BR}==1;
%                 plot(img_set_data{q}{11},img_set_plot{q}{t}{BR},strcat(color_array{colr_trk},line_specs{line_trk }));
                plot(img_set_data{q}{11},img_set_plot{q}{t}{BR},line_specs{line_trk });
                hold on;
                
                colr_trk=colr_trk+1;
                if colr_trk == 8
                    colr_trk = 1;
                else %else BR loop condition for color track
                end %end BR loop condition for color track
                end
            end 
        end %end of BR loop
%         title(img_set_name{q})
         line_trk=line_trk+1;
            if line_trk == 8
                line_trk = 1;
            else %else q loop condition for line track
            end %end q loop condition for line track 
            set(gca,'ColorOrderIndex',1); % resets plot color order
    end %end q loop1
    legend(tmp_lgd3);
    title('Convergence');
%     set(legend,'location','northeastoutside');
    set(legend,'location','BestOutside');
    ylabel('Percent Difference from Previous Iteration');
    xlabel(set_xlabel);
    t=t+1;
    BR=BR_start;
end %end PD_switch
m = 1; 
p = 0;
% %-----------------------------------------------------------------------------------------------
for t = t : sum_switch
line_trk = 1;
figure;
for q = 1 : num_img_set
   BR=BR_start; %reset BR
        if length(legends2{m}) == num_img_set
            p = p + 1;
            TA_dynarray_num = t;
        else
        p = 0;
        end
    if p == 0
        colr_trk = 1;
% %-----------------------------------------------------------------------------------------------
    for BR = 1 : length(BR_array) 
        if custom_iter_switch == 0
            if BR_select2{BR}==1;
%             plot(img_set_data{q}{9},img_set_plot{q}{t}{BR},strcat(color_array{colr_trk},line_specs{line_trk }));
            plot(img_set_data{q}{9},img_set_plot{q}{t}{BR},line_specs{line_trk });
            hold on;
            
            colr_trk=colr_trk+1;
            if colr_trk == 8
                colr_trk = 1;
            else %else BR loop condition for color track
            end %end BR loop condition for color track      
            end
        else
            if BR_select2{BR}==1;
%             plot(img_set_data{q}{10},img_set_plot{q}{t}{BR},strcat(color_array{colr_trk},line_specs{line_trk}));
            plot(img_set_data{q}{10},img_set_plot{q}{t}{BR},line_specs{line_trk});
            hold on;
            
            colr_trk=colr_trk+1;
            if colr_trk == 8
                colr_trk = 1;
            else %else BR loop condition for color track
            end %end BR loop condition for color track 
            end
        end 
    end %end of BR loop
    else %else p if statement
            colr_trk = 1;

        line_trk=line_trk+1;
        if line_trk == 8
            line_trk = 1;
        else %else q loop condition for line track
        end %end q loop condition for line track
% %-----------------------------------------------------------------------------------------------
    if custom_iter_switch == 0
%         plot(img_set_data{q}{9},img_set_plot{q}{TA_dynarray_num}{colr_trk},strcat(color_array{colr_trk},line_specs{line_trk }));
        plot(img_set_data{q}{9},img_set_plot{q}{TA_dynarray_num}{colr_trk},strcat(color_array{g},line_specs{g}));
%         plot(img_set_data{q}{9},img_set_plot{q}{TA_dynarray_num}{colr_trk},line_specs{g});
        hold on;
        g=g+1;
    else
%         plot(img_set_data{q}{10},img_set_plot{q}{TA_dynarray_num}{colr_trk},strcat(color_array{colr_trk},line_specs{line_trk }));
        plot(img_set_data{q}{10},img_set_plot{q}{TA_dynarray_num}{colr_trk},strcat(color_array{g},line_specs{g }));
%         plot(img_set_data{q}{10},img_set_plot{q}{TA_dynarray_num}{colr_trk},line_specs{g});
        hold on;
        g=g+1;
%         set(gca,'ColorOrderIndex',1); % resets plot color order
    end 
    colr_trk=colr_trk+1;
    if colr_trk == 8
        colr_trk = 1;
    else %else BR loop condition for color track
    end %end BR loop condition for color track
%     title(img_set_name{q})
% %-----------------------------------------------------------------------------------------------
    end %end p loop
    line_trk=line_trk+1;
            if line_trk == 8
                line_trk = 1;
            else %else q loop condition for line track
            end %end q loop condition for line track 
            set(gca,'ColorOrderIndex',1); % resets plot color order
end %end q loop2 
% %-----------------------------------------------------------------------------------------------
        title('Convergence');
%         set(legend,'location','northeastoutside');
        set(legend,'location','BestOutside');
        xlabel(set_xlabel);
% %-----------------------------------------------------------------------------------------------
        ylabel(ylabels{m});
% %-----------------------------------------------------------------------------------------------
        legend(legends2{m}); 
        m=m+1; 
% %-----------------------------------------------------------------------------------------------
end %end of t loop
% %-----------------------------------------------------------------------------------------------

% %-----------------------------------------------------------------------------------------------
end %end PlotSameGraph = 1
cd ../..