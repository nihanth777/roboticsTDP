function [X,Y] = nextPosition(x,y,phi,l)
%NEXTPOSITION is a function used to calculate the next position wrt
%distance and heading angle.
%   Detailed explanation goes here
X=x+l*cos(phi);
Y=y+l*sin(phi);
end

