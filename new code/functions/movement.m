function [x,y,phi_new,v] = movement(X,Y,phi,goal_phi,v)
variables; 
    a=3;
    omega=1;

    if abs(goal_phi-phi)>sample_time*omega
         if (goal_phi-phi) > 0
                phi_new = phi+omega*sample_time;
         else
                phi_new = phi-omega*sample_time;
         end
         v=v;
         x=X;
         y=Y;
    else
         phi_new = goal_phi;
         if v<V_robot
            vx = v*cos(goal_phi);
            vy = v*sin(goal_phi);
            x = X+sample_time*vx+0.5*a*cos(goal_phi)*sample_time^2;
            y = Y+sample_time*vy+0.5*a*sin(goal_phi)*sample_time^2;
            v = v+a*sample_time;
         else
            v = V_robot;
            vx = v*cos(goal_phi);
            vy = v*sin(goal_phi);
            x = X+sample_time*vx; 
            y = Y+sample_time*vy;
         end  
         x=x+0.1*rand()-0.05;
         y=y+0.1*rand()-0.05;      
    end
end