function [players,ball] = goalKeep(X,Y,x_goal,y_goal,phi,v,ball)
%GOALKEEP Summary of this function goes here
%   Detailed explanation goes here
    variables;

    %if ball stick to one goalkeeper, turn to right angle and kick back
    %if left goalkeeper have the ball
    if players{3}(5)==1
        [x,y,phi,v] = movement1(X,Y,x_goal,y_goal,phi,v);

        % turn to right angle(0)
        if abs(pi-phi) > omega*sample_time    
            if (pi-phi) > 0
                phi = phi+omega*sample_time+noise;
            else
                phi = phi-omega*sample_time+noise;
            end
            v=0;
            x=X;
            y=Y;

        else %if it is the right angle
            ball=kick(ball,pi);
        end

    %if right goalkeeper have the ball
    elseif players{3}(1)==1
        % turn to right angle(pi)
        if abs(pi-phi) > omega*sample_time   

            if (pi-phi) > 0
                phi = phi+omega*sample_time+noise;
            else
                phi = phi-omega*sample_time+noise;
            end
            v=0;
            x=X;
            y=Y;

        else %if it is the right angle
            ball=kick(ball,0);
        end

    else %ball not with goalkeeper
        [x,y,phi,v] = movement1(X,Y,x_goal,y_goal,phi,v);
    end
end

