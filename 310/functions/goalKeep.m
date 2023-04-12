function [players,ball] = goalKeep(players,ball,indexOfPlayers)
%GOALKEEP Summary of this function goes here
%   Detailed explanation goes here
variables;
noise=0.1*rand()-0.05;
rx=players{1}(indexOfPlayers,1);
ry=players{1}(indexOfPlayers,2);
rv=players{2}(indexOfPlayers,1);
r_phi=players{2}(indexOfPlayers,2);


%team who possess the ball
po=find(players{3}==1);
TF = isempty(po);
if TF==1
    flag=0;
   
else
    if po<=4 && indexOfPlayers<=4
        flag=1;
    elseif po>4 && indexOfPlayers>4
        flag=1;
    else
        flag=0;
    end
end




if indexOfPlayers<=4
    % goal_x = x_gk_away_init;
    % goal_y = goal_point1 + (goal_point2-goal_point1)*randi(1,1);
    keep_x=x_gk_home_init;
    keep_y=goal_point1 + (goal_point2-goal_point1)*randi(1,1);
    phi=0;
else
    % goal_x = x_gk_home_init;
    % goal_y = goal_point1 + (goal_point2-goal_point1)*randi(1,1);
    keep_x = x_gk_away_init;
    keep_y = goal_point1 + (goal_point2-goal_point1)*randi(1,1);
    phi=pi;
end



ball_x=ball(1,1);
ball_y=ball(1,2);


disttoball=sqrt((ball_x - rx)^2 + (ball_y - ry)^2);

if disttoball<maxactdist % act or not 
    if players{3}(indexOfPlayers)==0 && flag==0  % player and its teammates not possess the ball
        if abs(rx-ball_x)<=4.8 && abs(ry-ball_y)<=4.8 
            [players,ball] = possession(indexOfPlayers,players, ball);
            %possess_flag=ballposession.player;
        else %if the player does not possess the ball ,move to ball
            [x_new,y_new,phi_new,v_new] = movement2(rx,ry,ball_x,ball_y,r_phi,rv);
            %update player
            players{1}(indexOfPlayers,1)=x_new;
            players{1}(indexOfPlayers,2)=y_new;
            players{2}(indexOfPlayers,1)=v_new;
            players{2}(indexOfPlayers,2)=phi_new;
        end   
    elseif players{3}(indexOfPlayers)==1%possess the ball 
        %pass ball test
        playerIndex=shortPass(players,indexOfPlayers);
        goal_x=players{1}(playerIndex,1);
        goal_y=players{1}(playerIndex,2);
    
        goal_phi = phicalculate(rx,ry,goal_x,goal_y);
        [players,ball]=kick(players,ball,indexOfPlayers,goal_phi);

        %players{2}(indexOfPlayers,2)=goal_phi;
    else
        % do not move

    end
else
    [x_new,y_new,phi_new,v_new] = movement2(rx,ry,keep_x,keep_y,r_phi,rv);
    %update player
    players{1}(indexOfPlayers,1)=x_new;
    players{1}(indexOfPlayers,2)=y_new;
    players{2}(indexOfPlayers,1)=v_new;
    players{2}(indexOfPlayers,2)=phi_new;
    if abs(x_new-keep_x)<=4.8 && abs(y_new-keep_y)<=4.8
        %turn to the right angle
        if abs(r_phi-phi)>sample_time % if the angle right, kick
             if (phi-r_phi) > 0
                    rphi_new = r_phi+omega*sample_time+noise;
             else
                    rphi_new = r_phi-omega*sample_time+noise;
             end
             players{2}(indexOfPlayers,2)=rphi_new;
        end
              
    end

end




