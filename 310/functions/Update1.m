function [players,ball,last_possession,flag] = Update1(players,ball,flag,last_possession)

for indexOfPlayer = 1:8

    if flag == 1 %corner kick for blue team
    
        [players,ball,flag] = cornerKick(players,ball,"blue",flag);
    
    elseif flag == 2 %corner kick for red team
    
        [players,ball,flag] = cornerKick(players,ball,"red",flag);
    
    elseif flag == 3 %out of bound - ball to blue team

        [players,ball,flag] = outOfBounds(players,ball,"blue",flag);

    elseif flag == 4 %out of bound - ball to red team

        [players,ball,flag] = outOfBounds(players,ball,"red",flag);

    else
   
        if indexOfPlayer==1 || indexOfPlayer==5 % goalkeeper
            [players,ball,last_possession]=goalKeep(players,ball,indexOfPlayer,last_possession);
    
        else % defender or attacker
            [players, ball,last_possession] = chaseball(players, ball, indexOfPlayer,last_possession);
    
        end
    end
end

[players] = collision(players);
ball = ballfree(ball);

end
