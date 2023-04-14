function [players,ball,flag] = outOfBounds(players,ball,team,flag)

variables;

[index] = nearestToBall(players,ball,team);

if index <=4 % to make the support player go to ball always
    index = 2;
else
    index = 6;
end

tx = ball(1,1);

if ball(1,2) >= ylimit_boarderstrip+ylimit_inner
    
    ball(1,2) = ylimit_boarderstrip+ylimit_inner;
    ty = ylimit_boarderstrip+ylimit_inner+2*robot_radius;


    if players{1}(index,2) > ty  
    
        [players] = target(index,players,ball,tx,ty);
        index_near = shortPass(players,index);
        goal_phi = phicalculate(players{1}(index,1),players{1}(index,2),players{1}(index_near,1),players{1}(index_near,2));
        [players,ball] = kick(players,ball,index,goal_phi);
        flag = 0;

    end

else

    ball(1,2) = ylimit_boarderstrip;
    ty = ylimit_boarderstrip-2*robot_radius;

    if players{1}(index,2) < ty  
    
        index_near = shortPass(players,index);
        goal_phi = phicalculate(players{1}(index,1),players{1}(index,2),players{1}(index_near,1),players{1}(index_near,2));
        [players,ball] = kick(players,ball,index,goal_phi);
        flag = 0;

    end



end

[players] = target(index,players,ball,tx,ty);

end



