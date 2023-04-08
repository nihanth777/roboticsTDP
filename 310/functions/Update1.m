function [players,ball] = Update1(players,ball)

for indexOfPlayer = 2:4

    [players, ball] = robotbehaviour(players, ball, indexOfPlayer);

end

for indexOfPlayer = 6:8

    [players, ball] = robotbehaviour(players, ball, indexOfPlayer);

end

ball = ballfree(ball);

end

