function [players, ball] = robotbehaviour(players,ball,index)
variables;
ball_posession = players{3}(index);




if players{3}(:,1) == 0
    for i=1:8
        [~,~,~,~,dist] = playerPosition(i,players,ball);
        if dist<20
            [players,~]= possession(i,players,ball);
        else
            [ball] = ballfree(ball);
        end
    end
end 

if  ball_posession == 1 && index == 4
    
    [px,py,~,~,~] = playerPosition(index,players,ball);
    tx = xlimit_outer-xlimit_boarderstrip-2*penaltymark;
    ty = ylimit_outer/2;
    
    if (tx<=px)
      
        p2x = players{1}(2,1);
        p2y = players{1}(2,2);
        t_phi = phicalculate(px,py,p2x,p2y);
        [players,ball] = kick(players,ball,2,t_phi);
        
    else
       
        [players] = target(index,players,ball,tx,ty);
        [ball] = dribble(players,ball,index);
    
    end

elseif ball_posession == 1 && index == 8

    [players] = target(index,players,ball,xlimit_boarderstrip,ylimit_boarderstrip);
    [ball] = dribble(players,ball,index);

elseif ball_posession == 0 && index == 2
    [players]=target(index,players,ball,xlimit_outer/2,ylimit_outer/4);

% elseif ball_posession == 1 && index == 2
%     [players] = target(index,players,ball,xlimit_outer,ylimit_outer);
%     [ball] = dribble(players,ball,index);
end


end