function [flag] = checkOutOfBounds(ball,last_possession)
    % Define the boundaries of the field
    variables;
    x_min = xlimit_boarderstrip;
    x_max = xlimit_inner+xlimit_boarderstrip;
    y_min = ylimit_boarderstrip;
    y_max = ylimit_inner+ylimit_boarderstrip;
    
    % condition for corner kick on home team side or away team side
    if (ball(1,1) < x_min && (ball(1,2) < goal_point1 || ball(1,2) > goal_point2)) || (ball(1,1) > x_max && (ball(1,2) < goal_point1 || ball(1,2) > goal_point2))
       
        if last_possession <= 4  %red team kicked out of bounds
              
            flag = 1;
          
        else %blue team kicked out of bounds

            flag = 2;
            
        end
    
    %out of bounds on top or bottom of field
    elseif ball(1,2) >= y_max || ball(1,2) <= y_min
       
        if last_possession <= 4 %red team kicked out of bounds

            flag = 3;
            
        else

            flag = 4;
            
        end
    else

        flag = 0;
    
    end
end
