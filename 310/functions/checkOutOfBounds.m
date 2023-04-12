function out_of_bounds = checkOutOfBounds(ball)
    % Define the boundaries of the field
    x_min = 0;
    x_max = xlimit_outer;
    y_min = ylimit_lower;
    y_max = ylimit_upper;
    
    % Check if the ball is out of bounds
    if ball(1) < x_min || ball(1) > x_max || ball(2) < y_min || ball(2) > y_max
        out_of_bounds = true;
    else
        out_of_bounds = false;
    end
end
