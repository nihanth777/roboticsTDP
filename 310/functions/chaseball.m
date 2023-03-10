function [players,ball] = chaseball(players,ball,indexOfPlayers)
%PLAYER Summary of this function goes here
%   Detailed explanation goes here
initialparams;
rx=players{1}(indexOfPlayers,1);
ry=players{1}(indexOfPlayers,2);
rv=players{2}(indexOfPlayers,1);
r_phi=players{2}(indexOfPlayers,2);


if indexOfPlayers<=4
    goal_x = x_gk_away_init;
    goal_y = goal_point1 + (goal_point2-goal_point1)*randi(1,1);
else
    goal_x = x_gk_home_init;
    goal_y = goal_point1 + (goal_point2-goal_point1)*randi(1,1);
end



ball_x=ball(1,1);
ball_y=ball(1,2);

if abs(rx-ball_x)<=2 && abs(ry-ball_y)<=2 
    goal_phi = phicalculate(rx,ry,goal_x,goal_y);
    ball=kick(ball,goal_phi);
    %update angle
    players{2}(indexOfPlayers,2)=goal_phi;
end




if fix(rx) ~= ball_x || ry ~=ball_y
    target_phi = phicalculate(rx,ry,ball_x,ball_y);
    %[x_new,y_new,phi_new,v_new] = movement(rx,ry,r_phi,target_phi,rv);
    [x_new,y_new,phi_new,v_new] = movement1(rx,ry,ball_x,ball_y,r_phi,target_phi,rv);
    %update player
    players{1}(indexOfPlayers,1)=x_new;
    players{1}(indexOfPlayers,2)=y_new;
    players{2}(indexOfPlayers,1)=v_new;
    players{2}(indexOfPlayers,2)=phi_new;

end





end

