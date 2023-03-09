function [ball] = kick(ball,goal_phi)
% 
ball_speed_max=90;
frictionCoefficient=-28.2;
%ball_ac=2;
% ball_speed_max=15;
% frictionCoefficient=-10;

ball(2,:)=[ball_speed_max*cos(goal_phi);ball_speed_max*sin(goal_phi)];
ball(3,:)=[frictionCoefficient*cos(goal_phi);frictionCoefficient*sin(goal_phi)];
end

