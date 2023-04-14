function [x,y,phi,v] = movement2(X,Y,x_goal,y_goal,phi,v)
    variables; 
    noise=0.1*rand()-0.05;
    x=X;
    y=Y;
    
    %calculate goal_phi
    goal_phi=phicalculate(X,Y,x_goal,y_goal);

    %%%%%%% turn to right angle before run
    if abs(wrapToPi(goal_phi)-wrapToPi(phi)) >= omega*sample_time    
         if turn(phi,goal_phi) ==1
            phi = phi+omega*sample_time+noise;
         else
            phi = phi-omega*sample_time+noise;
         end
         v=v;
         x=X;
         y=Y;

    %%%%%%% run
    else
         phi = goal_phi;
         
         %%%%%% if distance is close enough, deaccelerate
         if sqrt((x_goal-x)^2 + (y_goal-y)^2) <= 0.5*V^2/a
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
    
end