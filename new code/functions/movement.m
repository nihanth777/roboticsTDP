function [x,y] = movement(X,Y,phi)
variables; 
        Vx = V_robot*cos(phi);
        Vy = V_robot*sin(phi);
        x= X+ sample_time*Vx ;
        y= Y+ sample_time*Vy;
end