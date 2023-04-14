function direction = turn(angle,angle_goal)
%output 1 if turn counter_clockwise, else 0
%   Detailed explanation goes here
if angle_goal-angle>0 
    if angle_goal-angle<=pi
        direction=1;
    else
        direction=0;
    end
elseif angle_goal-angle<0 
    if angle_goal-angle>=-pi
        direction=0;
    else
        direction=1;
    end
end
end

