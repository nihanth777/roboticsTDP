function [goal_phi,goal_x,goal_y] = kickaim(players,indexOfPlayers)
% kick aim is the farest position from the goalkeeper
initialparams;
rx=players{1}(indexOfPlayers,1);
ry=players{1}(indexOfPlayers,2);

if indexOfPlayers<=4
    goal_x = x_gk_away_init;
else
    goal_x = x_gk_home_init;
end
goal_y1 = goal_point1 + (goal_point2-goal_point1)*randi(1,1)+0.7*scaling;
goal_y2 = goal_point1 + (goal_point2-goal_point1)*randi(1,1)-1*scaling;




dis_1=sqrt((rx-goal_x)^2+(ry-goal_y1)^2);
dis_2=sqrt((rx-goal_x)^2+(ry-goal_y2)^2);

% p=rand(1,1);
% threshold=0.7;

if dis_1<dis_2 %set the nearest position as the goal position 
    % if p>threshold
    %     goal_y=goal_y1;
    % else 
    %     goal_y=goal_y2;
    % end
    goal_y=goal_y1;
    
else
    % if p>threshold
    %     goal_y=goal_y2;
    % else 
    %     goal_y=goal_y1;
    % end
    goal_y=goal_y2;
end

goal_phi=phicalculate(rx,ry,goal_x,goal_y);

end





