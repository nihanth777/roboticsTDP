function [goal_phi,goal_x,goal_y] = kickaim(players,indexOfPlayers)
% kick aim is the farest position from the goalkeeper
variables;
rx=players{1}(indexOfPlayers,1);
ry=players{1}(indexOfPlayers,2);

if indexOfPlayers<=4
    x_goal_keep = players{1}(5,1);
    y_goal_keep = players{1}(5,2);
    goal_x = x_gk_away_init;
else
    goal_x = x_gk_home_init;
    x_goal_keep = players{1}(1,1);
    y_goal_keep = players{1}(1,2);
end

% goal_y1 = goal_point1 + (goal_point2-goal_point1)*randi(1,1);
% goal_y2 = goal_point1 + (goal_point2-goal_point1)*randi(1,1);

goal_y1 = goal_point1 + rand*scaling;
goal_y2 = goal_point2 - rand*scaling;

dis_1=sqrt((x_goal_keep-goal_x)^2+(y_goal_keep-goal_y1)^2);
dis_2=sqrt((x_goal_keep-goal_x)^2+(y_goal_keep-goal_y2)^2);

% p=rand(1,1);
% threshold=0.7;

if dis_1<dis_2 %set the nearest position as the goal position 

    goal_y=goal_y2;
    
else

    goal_y=goal_y1;

end

goal_phi=phicalculate(rx,ry,goal_x,goal_y);

end





