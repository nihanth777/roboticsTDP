function [players,ball] = chaseball(players,ball,indexOfPlayers)
%PLAYER Summary of this function goes here
%   Detailed explanation goes here
initialparams;
rx=players{1}(indexOfPlayers,1);
ry=players{1}(indexOfPlayers,2);
rv=players{2}(indexOfPlayers,1);
r_phi=players{2}(indexOfPlayers,2);


% team who possess the ball
% po=find(players{3}==1);
% if po<=4 & indexOfPlayers<=4
%     flag=1;
% elseif po>4 & indexOfPlayers>4
%     flag=1;
% else
%     flag=0;



if indexOfPlayers<=4
    goal_x = x_gk_away_init;
    goal_y = goal_point1 + (goal_point2-goal_point1)*randi(1,1);
    keep_x=x_gk_home_init;
    keep_y=goal_point1 + (goal_point2-goal_point1)*randi(1,1);
else
    goal_x = x_gk_home_init;
    goal_y = goal_point1 + (goal_point2-goal_point1)*randi(1,1);
    keep_x = x_gk_away_init;
    keep_y = goal_point1 + (goal_point2-goal_point1)*randi(1,1);
end



ball_x=ball(1,1);
ball_y=ball(1,2);


disttoball=sqrt((ball_x - rx)^2 + (ball_y - ry)^2);

if disttoball<maxactdist% act or not 
    if players{3}(indexOfPlayers)==0 % player and its teammates not possess the ball
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

    elseif players{3}(indexOfPlayers)==2 %goalkeeper after its defend, go back
        [x_new,y_new,phi_new,v_new] = movement2(rx,ry,keep_x,keep_y,r_phi,rv);
        %update player
        players{1}(indexOfPlayers,1)=x_new;
        players{1}(indexOfPlayers,2)=y_new;
        players{2}(indexOfPlayers,1)=v_new;
        players{2}(indexOfPlayers,2)=phi_new;
        if abs(x_new-keep_x)<=4.8 && abs(y_new-keep_y)<=4.8
            players{3}(indexOfPlayers)=0;
        end
    else %possess the ball 
        %pass ball test
        %playerIndex=shortPass(players,indexOfPlayers);
        %goal_x=players{1}(playerIndex,1);
        %goal_y=players{1}(playerIndex,2);
        if indexOfPlayers==1 
            playerIndex=shortPass(players,indexOfPlayers);
            goal_x=players{1}(playerIndex,1);
            goal_y=players{1}(playerIndex,2);
        end
        if indexOfPlayers==5 
            playerIndex=shortPass(players,indexOfPlayers);
            goal_x=players{1}(playerIndex,1);
            goal_y=players{1}(playerIndex,2);
        
        end
        goal_phi = phicalculate(rx,ry,goal_x,goal_y);
        [players,ball]=kick(players,ball,indexOfPlayers,goal_phi);
        % players{3}(1)=2;
        % players{3}(5)=2;

        %players{2}(indexOfPlayers,2)=goal_phi;

    end
end




end

