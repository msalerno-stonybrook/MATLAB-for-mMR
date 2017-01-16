% %-----------------------------------------------------------------------------------------------
for q = 1 : num_img_set
% %-----------------------------------------------------------------------------------------------
    t = 1;
    if PD_switch == 1
        figure;
        
        for BR = 1 : length(BR_array)  
                if custom_iter_switch == 0
                    if BR_select2{BR}==1
                    plot(img_set_data{q}{8},img_set_plot{q}{t}{BR});
                    hold on;
                    end
                else
                    if BR_select2{BR}==1
                    plot(img_set_data{q}{11},img_set_plot{q}{t}{BR});
                    hold on;
                    end
                end 
                
        end %end of BR loop
        legend(BR_name_array);
        title(img_set_name{q})
        %title('Convergence');
        set(legend,'location','northeastoutside');
        ylabel('Percent Difference from Previous Iteration');
        xlabel(set_xlabel);
        t=t+1;
    end %end PD_switch
    m = 1; 
% %-----------------------------------------------------------------------------------------------
z = 0;
    for t = t : sum_switch
        figure;
        if length(legends{m}) == 11
            z = z + 1;
        else
            z = 0;
        end
        if z == 0
        for BR = 1 : length(BR_array)                          
                if custom_iter_switch == 0
                    if BR_select2{BR}==1
                    plot(img_set_data{q}{9},img_set_plot{q}{t}{BR});
                    hold on;
                    end
                else
                    if BR_select2{BR}==1
                    plot(img_set_data{q}{10},img_set_plot{q}{t}{BR});
                    hold on;
                    end
                end 
                
        end %end of BR loop
        else %else z if statement
            if custom_iter_switch == 0
                plot(img_set_data{q}{9},img_set_plot{q}{3}{1});
                    hold on;
            else
                plot(img_set_data{q}{10},img_set_plot{q}{3}{1});
                hold on;
            end 
        end %end z if statement
        
        legend(legends{m});
        %title('Convergence');
        title(img_set_name{q})
        set(legend,'location','northeastoutside');
        ylabel(ylabels{m}); 
        xlabel(set_xlabel); 
        m=m+1; 
    end %end of t loop
% %-----------------------------------------------------------------------------------------------
end %end q loop
% %-----------------------------------------------------------------------------------------------
