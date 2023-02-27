function [x,y,v] = movement(X,Y,phi,v)
variables; 
    a=3;
    if v<V 
        vx = v*cos(phi);
        vy = v*sin(phi);
        x = X+sample_time*vx+0.5*a*sample_time^2;
        y = Y+sample_time*vy+0.5*a*sample_time^2;
        v = v+a*sample_time;
    else
        v = V;
        vx = v*cos(phi);
        vy = v*sin(phi);
        x = X+sample_time*vx; 
        y = Y+sample_time*vy;
    end
    x=x+0.1*rand()-0.05;
    y=y+0.1*rand()-0.05;
end