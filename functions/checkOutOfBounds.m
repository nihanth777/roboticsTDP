function out_of_bounds = checkOutOfBounds(ball)
    % Define the boundaries of the field
    variables;
    x_min = 0;
    x_max = xlimit_inner;
    y_min = 0;
    y_max = ylimit_inner;
    
    % Check if the ball is out of bounds
    if ball(1,1) < x_min || ball(1,1) > x_max || ball(1,2) < y_min || ball(1,2) > y_max
        out_of_bounds = true;
    else
        out_of_bounds = false;
    end
end




