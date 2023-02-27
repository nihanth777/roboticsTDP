gamestate.start;

variables
initialparams
plotSoccerField


ballposition(x_ball_init,y_ball_init,ball_radius)
robotposition(robot_home_pos,'r',robot_radius,0);
robotposition(robot_away_pos,'b',robot_radius,0);

if ballposession.attacker_home
        goal_x = x_gk_away_init;
        goal_y = goal_point1 + (goal_point2-goal_point1)*randi(1,1);
        rx = robot_home_pos(4,1);
        ry = robot_home_pos(4,2);
        col = 'r';
elseif ballposession.attacker_away
        goal_x = x_gk_home_init;
        goal_y = goal_point1 + (goal_point2-goal_point1)*randi(1,1);
        rx = robot_away_pos(4,1);
        ry = robot_away_pos(4,2);
        col = 'b';
end

while rx < goal_x && ry ~=goal_y
    
    phi = phicalculate(rx,ry,goal_x,goal_y);
    [x_new,y_new] = movement(rx,ry,phi) ;
    plotSoccerField
    [x,y] = robotposition([x_new,y_new],col,robot_radius,phi)
    ballposition(x+ball_threshold,y,ball_radius)
    rx = x_new; ry = y_new;
    
end

