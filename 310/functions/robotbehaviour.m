function [players, ball] = robotbehaviour(players,ball,index)
variables;
ball_posession = players{3}(index);




% if players{3}(:,1) == 0
%     for i=1:8
%         [~,~,~,~,dist] = playerPosition(i,players,ball);
%         if dist<20
%             [players,~]= possession(i,players,ball);
%         else
%             [ball] = ballfree(ball);
%         end
%     end
% end 



if players{3}(:,1) == 0 %% condition to be changed to assign ball to someone
    [ball] = ballfree(ball);
end

if  ball_posession == 1 && index == 1  %goal kepper has ball red team
    
    %% to to centre of goal area and kicks ball to nearest player
    [px,py,~,~,~] = playerPosition(index,players,ball);
    tx = x_gk_away_init;
    ty = ylimit_outer/2;

    if px<=tx

        distance_all = radiusOfPlayer(players);
        [~,near_index] = min(distance_all(1,2:4));
    
        p2x = players{1}(near_index,1);
        p2y = players{1}(near_index,2);
        t_phi = phicalculate(px,py,p2x,p2y);
    
        [players,ball] = kick(players,ball,index,t_phi);
            
    else

        [players]=target(index,players,ball,tx,ty);
        [ball] = dribble(players,ball,index);

    end

elseif ball_posession == 1 && index == 2   %%support main attacker(4) or try to goal
    
    %%%%if player 2 is in goal radius(to be defined)
    
    distance_all = radiusOfPlayer(players);
    [px,py,~,~,~] = playerPosition(index,players,ball);
    %% for now its random point, to be changed to point that is farthest angle from defending goal keep & with in goal frame
    goal_x = x_gk_home_init;
    goal_y = goal_point1 + (goal_point2-goal_point1)*randi(1,1);

    goal_point = [px,py;goal_x,goal_y];
    goal_dist = pdist(goal_point,"euclidean");

    if goal_dist <= distance_all(index,4)
      
        tx = goal_x;
        ty = goal_y;
       
    else

        [p4x,p4y,~,~,~] = playerPosition(index,players,ball);
      
        tx = p4x;
        ty = p4y;
    
    end
    t_phi = phicalculate(px,py,tx,ty);
    [players,ball] = kick(players,ball,2,t_phi);
        

    %%%player is in goal radius (to be defined)

    
    %%%%%if player 2 is out of goal area , condition to be done

elseif ball_posession == 1 && index == 3 %% checks for the nearest team players and passes the ball
   
    distance_all = radiusOfPlayer(players);
    [px,py,~,~,~] = playerPosition(index,players,ball);
    
    [p2x,p2y,~,~,~] = playerPosition(2,players,ball);
    [p4x,p4y,~,~,~] = playerPosition(4,players,ball);
   

    if distance_all(index,2) < distance_all(index,4)  %% add condition to check for opp players and select acc to angle to avoid as well
      
        tx = p2x;
        ty = p2y;
       
    else
      
        tx = p4x;
        ty = p4y;
    
    end
    
    t_phi = phicalculate(px,py,tx,ty);
    [players,ball] = kick(players,ball,2,t_phi);
    

elseif ball_posession == 1 && index == 4 %% checks for the nearest player among 2,3 and kicks ball towards them
   
    [px,py,~,~,~] = playerPosition(index,players,ball);
    tx = xlimit_outer-xlimit_boarderstrip-2*penaltymark;
    ty = ylimit_outer/2-20;
    
    if (tx<=px)
      
        distance_all = radiusOfPlayer(players);
        if distance_all(4,2)<distance_all(4,3)

            p2x = players{1}(2,1);
            p2y = players{1}(2,2);
            
        else

            p2x = players{1}(3,1);
            p2y = players{1}(3,2);
            
        end

        t_phi = phicalculate(px,py,p2x,p2y);
        [players,ball] = kick(players,ball,index,t_phi);
        
    else
       
        [players] = target(index,players,ball,tx,ty);
        [ball] = dribble(players,ball,index);
    
    end

elseif ball_posession == 1 && index == 5    %goal keeper has ball blue team
          %% to to centre of goal area and kicks ball to nearest player
    [px,py,~,~,~] = playerPosition(index,players,ball);
    tx = x_gk_away_init;
    ty = ylimit_outer/2;

    if px<=tx

        distance_all = radiusOfPlayer(players);
        [~,near_index] = min(distance_all(1,6:8));
    
        p2x = players{1}(near_index,1);
        p2y = players{1}(near_index,2);
        t_phi = phicalculate(px,py,p2x,p2y);
    
        [players,ball] = kick(players,ball,index,t_phi);
            
    else

        [players]=target(index,players,ball,tx,ty);
        [ball] = dribble(players,ball,index);

    end
  

elseif ball_posession == 1 && index == 6

    [players]=target(index,players,ball,xlimit_outer/2,ylimit_outer/4);

elseif ball_posession == 1 && index == 7 %% checks for the nearest team mem and kick the ball
    
    distance_all = radiusOfPlayer(players);
    [px,py,~,~,~] = playerPosition(index,players,ball);
    
    [p6x,p6y,~,~,~] = playerPosition(6,players,ball);
    [p8x,p8y,~,~,~] = playerPosition(8,players,ball);
   

    if distance_all(index,6) < distance_all(index,8)  %% add condition to check for opp players and select acc to angle to avoid as well
      
        tx = p6x;
        ty = p6y;
       
    else
      
        tx = p8x;
        ty = p8y;
    
    end
    
    t_phi = phicalculate(px,py,tx,ty);
    [players,ball] = kick(players,ball,index,t_phi);

elseif ball_posession == 1 && index == 8

        [px,py,~,~,~] = playerPosition(index,players,ball);
        distance_all = radiusOfPlayer(players);
        [~,near_index] = min(distance_all(4,2:3));

        p2x = players{1}(near_index,1);
        p2y = players{1}(near_index,2);
        t_phi = phicalculate(px,py,p2x,p2y);

        [players,ball] = kick(players,ball,index,t_phi);

%%%%%%possession 0 - No BALL conditions
elseif ball_posession == 0 && index == 1
    
  %%add condition to move towards ball within goal area if inside a
  %%particular distance and blocks the goal if the trajectory  interceppts
  %%with goal keep through random number generation

elseif ball_posession == 0 && index == 2
    
    [players]=target(index,players,ball,xlimit_outer/2,ylimit_outer/4);   %%example to be modified to implement behaviour

elseif ball_posession == 0 && index == 3   %%% stand in defending position
    
    [players]=target(index,players,ball,xlimit_outer/4,ylimit_outer/2);

elseif ball_posession == 0 && index == 4
    
    
 
elseif ball_posession == 0 && index == 5
    
  %%add condition to move towards ball within goal area if inside a
  %%particular distance and blocks the goal if the trajectory  interceppts
  %%with goal keep through random number generation

elseif ball_posession == 0 && index == 6
    
    [px,py,~,~,~] = playerPosition(index,players,ball);
    [players]=target(index,players,ball,px-20,py-10);   %%example to be modified to implement behaviour

elseif ball_posession == 0 && index == 7 %%%% stand in defending position
    
    [players]=target(index,players,ball,3*xlimit_outer/4,ylimit_outer/2);

elseif ball_posession == 0 && index == 8
    
    
end

%intercept coding to be done - generate a random number to set condition
%who gets the ball

%player collision code to be done

%score board implementation

%%Behaviour for 2 and 6%%
%%set support position for both teams according to main attacker and
%%support players will try to got to the nearest support position(there 
%%will be 4 in 4 quadrants acc.to attacker among the options to assist

%%calculation part%%

%%ball speed to be set appropriately... too fast right now

%%short pass parameters to be implemented like vel and acc for ball

%%robots only turn in one direction so if the angle is more it will make like a
%%250 degree turn

%%calculation part%%

end