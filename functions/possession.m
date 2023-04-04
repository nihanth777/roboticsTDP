function [players,ball] = possession(indexOfPlayers,players, ball)
%if player i possess the ball ,set players{3}(i,:)=1
variables;
rx=players{1}(indexOfPlayers,1);
ry=players{1}(indexOfPlayers,2);
% ball_x=ball(1,1);
% ball_y=ball(1,2);
angle=players{2}(indexOfPlayers,2);
% if abs(rx-ball_x)<=4.8 && abs(ry-ball_y)<=4.8


ball(2,:)=0;
players{3}(indexOfPlayers)=1;
%players{2}(indexOfPlayers,2)=goal_phi;
%hold the ball
ball(1,1)=rx+((2*robot_radius)*cos(angle));
ball(1,2)=ry+((2*robot_radius)*sin(angle));
ball(3,:)=0;


end

