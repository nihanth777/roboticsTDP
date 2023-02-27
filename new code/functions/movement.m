function [x,y] = movement(X,Y,phi)
variables; 
        Vx = V*cos(phi);
        Vy = V*sin(phi);
        x= X+ sample_time*Vx ;
        y= Y+ sample_time*Vy;
end