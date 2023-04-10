function [rx,ry,ball_x,ball_y,distance] = playerPosition(indexOfPlayers,players, ball)
%if player i possess the ball ,set players{3}(i,:)=1
rx = players{1}(indexOfPlayers,1);
ry = players{1}(indexOfPlayers,2);
ball_x = ball(1,1);
ball_y = ball(1,2);
distance = sqrt((rx-ball_x)^2 + (ry-ball_y)^2);
end

