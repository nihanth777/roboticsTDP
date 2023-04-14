function [index] = nearestToBall(players,ball,team)
%find the nearest player to the ball
ball_pos=ball(1,:);

if strcmp(team, "red")
    T=players{1}(2:4,:);%3*2
    distances = vecnorm(T - ball_pos, 2, 2);
    [~, min_idx] = min(distances);
    index=min_idx+1;

elseif strcmp(team, "blue")
    T=players{1}(6:8,:);
    distances = vecnorm(T - ball_pos, 2, 2);
    [~, min_idx] = min(distances);
    index=min_idx+5;
end

