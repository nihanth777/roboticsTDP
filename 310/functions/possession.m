function [players,ball] = possession(indexOfPlayers,players, ball)
%if player i possess the ball ,set players{3}(i,:)=1
rx=players{1}(indexOfPlayers,1);
ry=players{1}(indexOfPlayers,2);
ball_x=ball(1,1);
ball_y=ball(1,2);
if abs(rx-ball_x)<=20 && abs(ry-ball_y)<=12
    ball(2,:)=0;
    players{3}(:) = 0;
    players{3}(indexOfPlayers)=1;

end

end

