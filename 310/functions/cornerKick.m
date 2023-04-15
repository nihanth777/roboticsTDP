function [players,ball,flag] = cornerKick(players,ball, team,flag)

variables;

[x_corner,y_corner,corner] = nearest_corner(ball);

ball(1,1) = x_corner;
ball(1,2) = y_corner;

if corner == 1 %lower left corner

    tx = x_corner-2*robot_radius;
    ty = y_corner-2*robot_radius;

elseif corner == 2 %upper left corner
   
    tx = x_corner-2*robot_radius;
    ty = y_corner+2*robot_radius;

elseif corner == 3 %upper right corner

    tx = x_corner+2*robot_radius;
    ty = y_corner+2*robot_radius;

elseif corner == 4 %lower right corner

    tx = x_corner+2*robot_radius;
    ty = y_corner-2*robot_radius;

end



if team == "red"

    index = 2;

else

    index = 6;

end

[players] = target(index,players,ball,tx,ty);


if players{1}(index,1) < tx && players{1}(index,2) > ty  %need condition for all players to stop moving
    
    index_near = shortPass(players,index);
    goal_phi = phicalculate(players{1}(index,1),players{1}(index,2),players{1}(index_near,1),players{1}(index_near,2));
    [players,ball] = kick(players,ball,index,goal_phi);
    pause(5);
    flag = 0;

end
end
