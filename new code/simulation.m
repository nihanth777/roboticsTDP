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

elseif ballposession.attacker_away
        goal_x = x_gk_home_init;
        goal_y = goal_point1 + (goal_point2-goal_point1)*randi(1,1);
        rx = robot_away_pos(4,1);
        ry = robot_away_pos(4,2);

end

rv=0;
while rx < goal_x && ry ~=goal_y
    
    plotSoccerField
    
    phi = phicalculate(rx,ry,goal_x,goal_y);
    [x_new,y_new,v_new] = movement(rx,ry,phi,rv) ;
    [x,y] = robotposition([x_new,y_new],col,robot_radius,phi)


    if ballposession.attacker_home
        robot_home_pos(4,1) = x_new;
        robot_home_pos(4,2) = y_new;
    elseif ballposession.attacker_away
        robot_away_pos(4,1) = x_new;
        robot_away_pos(4,2) = y_new;
    end
    robotposition(robot_home_pos,'r',robot_radius,0);
    robotposition(robot_away_pos,'b',robot_radius,180);

    ballposition(x_new+ball_threshold,y_new,ball_radius)
    rx = x_new; ry = y_new; rv = v_new;
    

end

