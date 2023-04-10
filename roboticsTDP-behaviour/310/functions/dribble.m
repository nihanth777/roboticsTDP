function [players,ball] = dribble(players,ball,index)
%DRIBBLE Summary of this function goes here
%   Detailed explanation goes here

variables;
x = players{1}(index,1);
y = players{1}(index,2);
ball(1,1) = x+((2*robot_radius))+ball_threshold;
ball(1,2) = y;

%ballposition(x+((2*robot_radius))+ball_threshold,y,ball_radius);

end

