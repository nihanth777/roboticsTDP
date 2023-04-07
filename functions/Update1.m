function [players,ball] = Update1(players,ball)
% update the players and ball
for indexOfPlayer = 1:8
    % [players, ball] = chaseball(players, ball, indexOfPlayer);
    if indexOfPlayer==1 || indexOfPlayer==5 % goalkeeper
        [players,ball]=goalKeep(players,ball,indexOfPlayer);

    else % defender or attacker
        [players, ball] = chaseball(players, ball, indexOfPlayer);

    end

end

ball = ballfree(ball);

end

