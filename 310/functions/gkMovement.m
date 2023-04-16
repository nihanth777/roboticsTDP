function [x,y,phi,v] = gkMovement(X,Y,x_goal,y_goal,phi,v)
%GKMOVEMENT Summary of this function goes here
%   Detailed explanation goes here
variables; 
    noise=0.1*rand()-0.05;
    x=X;
    y=Y;
    
    %calculate goal_phi
    goal_phi=phicalculate(X,Y,x_goal,y_goal);

if sqrt((x_goal-x)^2 + (y_goal-y)^2) <= 0.5*v^2/a
            if v-sample_time*a > 0
                vx = v*cos(goal_phi);
                vy = v*sin(goal_phi);
                x = X+sample_time*vx-0.5*a*sample_time^2;
                y = Y+sample_time*vy-0.5*a*sample_time^2;
                v = v-a*sample_time+noise;
            else
                v=0;
                x=x;
                y=y;
            end

        %%%%%% if distance is not close enough, accelerate    
        else
            if v+a*sample_time < V 
                vx = v*cos(goal_phi);
                vy = v*sin(goal_phi);
                x = X+sample_time*vx+0.5*a*sample_time^2;
                y = Y+sample_time*vy+0.5*a*sample_time^2;
                v = v+a*sample_time+noise;
            else
                v = V+noise;
                vx = v*cos(goal_phi);
                vy = v*sin(goal_phi);
                x = X+sample_time*vx; 
                y = Y+sample_time*vy;
            end
end
end

