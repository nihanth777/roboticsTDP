function [x,y]=moment(phi,x,y,deltat)
%this function is used to update the position of robot
%   Detailed explanation goes here
    vx=robot_velocity*cos(phi);
    vy=robot_velocity*sin(phi);
    x=x+deltat*vx;
    y=x+deltat*vy;
end
