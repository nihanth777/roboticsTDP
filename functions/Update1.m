function [players,ball] = Update1(players,ball)
% update the players and ball
for indexOfPlayer = 2:4
    % TODO, make sure the row/column formating is correct here
    [players, ball] = chaseball(players, ball, indexOfPlayer);
end

for indexOfPlayer = 6:8
    % TODO, make sure the row/column formating is correct here
    [players, ball] = chaseball(players, ball, indexOfPlayer);
end


ball = ballfree(ball);

end

