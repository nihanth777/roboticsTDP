function [ball] = dribble(players,ball,index)

variables;

x = players{4}(index,1);
y = players{4}(index,2);
ball(1,1) = x;
ball(1,2) = y;

end