function [score_home, score_away, players, ball] = goalscore(players,ball, score_home, score_away,gamesection)
    % Check if ball is within goalpost limits for either team
    variables;
    
    %left
    if ball(1,1) < x_gk_home_init && ball(1,2) > goal_point1 && ball(1,2) < goal_point2
      
        % Ball is within goalpost limits for home team
        score_away = score_away + 1; % Add 1 to away team's score
        displayScoreBoard(score_home, score_away,gamesection);
        [players,ball] = restartgame(players,"red");

    %right
    elseif ball(1,1) > x_gk_away_init  && ball(1,2) > goal_point1 && ball(1,2) < goal_point2
    
        % Ball is within goalpost limits for away team
        score_home = score_home + 1; % Add 1 to home team's score
        displayScoreBoard(score_home, score_away,gamesection);
        [players,ball] = restartgame(players,"blue");
        
    end
end

