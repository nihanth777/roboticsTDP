function [players,ball] = goalKeep(players,ball,indexOfPlayers)

variables;

%goalkeep
x_gk_home_init = xlimit_boarderstrip;
y_gk_home_init = ylimit_outer/2;
x_gk_away_init = xlimit_inner+xlimit_boarderstrip;
y_gk_away_init = ylimit_outer/2;


rx=players{1}(indexOfPlayers,1);
ry=players{1}(indexOfPlayers,2);
rv=players{2}(indexOfPlayers,1);
r_phi=players{2}(indexOfPlayers,2);

if indexOfPlayers<=4
   
    keep_x=x_gk_home_init;
    keep_y=y_gk_home_init;
else
   
    keep_x = x_gk_away_init;
    keep_y = y_gk_away_init;
end

ball_x=ball(1,1);
ball_y=ball(1,2);

disttoball=sqrt((ball_x - rx)^2 + (ball_y - ry)^2);

if disttoball<maxactdist% act or not 
    if players{3}(indexOfPlayers)==0 % player and its teammates not possess the ball
        if abs(rx-ball_x)<=4.8 && abs(ry-ball_y)<=4.8
            [players,ball] = possession(indexOfPlayers,players, ball);
            
        else %if the player does not possess the ball ,move to ball
            [x_new,y_new,phi_new,v_new] = movement2(rx,ry,ball_x,ball_y,r_phi,rv);
            %update player
            players{1}(indexOfPlayers,1)=x_new;
            players{1}(indexOfPlayers,2)=y_new;
            players{2}(indexOfPlayers,1)=v_new;
            players{2}(indexOfPlayers,2)=phi_new;
        end   

    else %possess the ball 
        %pass ball test
        playerIndex=shortPass(players,indexOfPlayers);
        goal_x=players{1}(playerIndex,1);
        goal_y=players{1}(playerIndex,2);
    
        goal_phi = phicalculate(rx,ry,goal_x,goal_y);
        [players,ball]=kick(players,ball,indexOfPlayers,goal_phi);

        %players{2}(indexOfPlayers,2)=goal_phi;

    end
else
    [x_new,y_new,phi_new,v_new] = movement2(rx,ry,keep_x,keep_y,r_phi,rv);
    %update player
    players{1}(indexOfPlayers,1)=x_new;
    players{1}(indexOfPlayers,2)=y_new;
    players{2}(indexOfPlayers,1)=v_new;
    players{2}(indexOfPlayers,2)=phi_new;
    if abs(x_new-keep_x)<=4.8 && abs(y_new-keep_y)<=4.8
        %players{3}(indexOfPlayers)=0;
        
    end

end



