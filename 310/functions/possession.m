function [players,ball,last_possession] = possession(indexOfPlayers,players, ball)
%if player i possess the ball ,set players{3}(i,:)=1

ball(2,:) = 0;
players{3}(:) = 0;
players{3}(indexOfPlayers) = 1;
last_possession = indexOfPlayers;

end

