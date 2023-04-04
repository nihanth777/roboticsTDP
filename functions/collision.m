function [players,ball] = collision(players,ball)
% collision
collisiondist=8;
distance=radiusOfPlayer(players);
dist=distance(1:4,:);
[row,col]=find(dist<collisiondist); %find the index 
























end

