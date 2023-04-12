
function [score_home, score_away] = goalscore(ball, score_home, score_away)
    % Check if ball is within goalpost limits for either team
    variables;
    
    %  if ball(1) <= goalpost_xlimit && ball(2) >= goal_point1 && ball(2) <= goal_point2
    if ball(1,1) <= goalpost_xlimit && ball(1,2) >= goal_point1 && ball(1,2) <= goal_point2
       % Ball is within goalpost limits for home team
        score_away = score_away + 1; % Add 1 to away team's score
        displayScoreBoard(score_home, score_away);
    %elseif ball(1) >= xlimit_outer - goalpost_xlimit && ball(2) >= goal_point1 && ball(2) <= goal_point2
    elseif ball(1,1) >= xlimit_outer - goalpost_xlimit && ball(1,2) >= goal_point1 && ball(1,2) <= goal_point2
        % Ball is within goalpost limits for away team
        score_home = score_home + 1; % Add 1 to home team's score
        displayScoreBoard(score_home, score_away);
        
    end
end

