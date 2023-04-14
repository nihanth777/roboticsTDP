function [x,y,index] = nearest_corner(ball)

variables;

ball_x = ball(1,1);
ball_y = ball(1,2);

corner1_x = xlimit_boarderstrip;
corner1_y = ylimit_boarderstrip;

corner2_x = xlimit_boarderstrip;
corner2_y = ylimit_boarderstrip+ylimit_inner;

corner3_x = xlimit_boarderstrip+xlimit_inner;
corner3_y = ylimit_boarderstrip+ylimit_inner;

corner4_x = xlimit_boarderstrip+xlimit_inner;
corner4_y = ylimit_boarderstrip;

dist_to_c1 = sqrt((ball_x - corner1_x)^2 + (ball_y - corner1_y)^2);
dist_to_c2 = sqrt((ball_x - corner2_x)^2 + (ball_y - corner2_y)^2);
dist_to_c3 = sqrt((ball_x - corner3_x)^2 + (ball_y - corner3_y)^2);
dist_to_c4 = sqrt((ball_x - corner4_x)^2 + (ball_y - corner4_y)^2);

[~,index] = min([dist_to_c1,dist_to_c2,dist_to_c3,dist_to_c4]);

if index == 1

    x = corner1_x;
    y = corner1_y;

elseif index == 2

    x = corner2_x;
    y = corner2_y;

elseif index == 3

    x = corner3_x;
    y = corner3_y;

elseif index == 4

    x = corner4_x;
    y = corner4_y;

end

