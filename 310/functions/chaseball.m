function [players,ball] = chaseball(players,ball,indexOfPlayers)

variables;

rx=players{1}(indexOfPlayers,1);
ry=players{1}(indexOfPlayers,2);
rv=players{2}(indexOfPlayers,1);
r_phi=players{2}(indexOfPlayers,2);

ball_x=ball(1,1);
ball_y=ball(1,2);


disttoball=sqrt((ball_x - rx)^2 + (ball_y - ry)^2);

    if players{3}(indexOfPlayers)==0 % player and its teammates not possess the ball
        
        if abs(rx-ball_x)<=4.8 && abs(ry-ball_y)<=4.8 %improve: adding probability of interception
                [players,ball] = possession(indexOfPlayers,players, ball);
        else
            if indexOfPlayers == 4 || indexOfPlayers ==8 
                %if the player does not possess the ball ,move to ball
                [players] = target(indexOfPlayers,players,ball,ball_x,ball_y);
             
        
            elseif indexOfPlayers == 3

                if disttoball<=maxactdist
            
                    [players] = target(indexOfPlayers,players,ball,ball_x,ball_y);
                
                else

                    %do nothing

                end
            
            elseif indexOfPlayers == 2 
            
                if players{3}(3:4) == 0
                    
                    [players] = target(indexOfPlayers,players,ball,ball_x,ball_y);
                
                else
    
                   
                    
                    [players] = target(indexOfPlayers,players,ball,near_point(id,1),near_point(id,2));
                end
            
            elseif indexOfPlayers == 6

            elseif indexOfPlayers == 7  
           
            end
        end

        

    else %possess the ball 

        if indexOfPlayers==4 
           
            playerIndex=shortPass(players,indexOfPlayers);
            [goal_phi,goal_x,goal_y] = kickaim(players,indexOfPlayers);
            dist_to_goal = sqrt((goal_x - rx)^2 + (goal_y - ry)^2);
            
            prob = rand;

            if dist_to_goal < d_ball/2

                if prob<0.7
                    
                    [players,ball] = kick(players,ball,indexOfPlayers,goal_phi);
                    
                else
                    goal_x=players{1}(playerIndex,1);
                    goal_y=players{1}(playerIndex,2);
                    t_phi = phicalculate(rx,ry,goal_x,goal_y);
                    [players,ball] = kick(players,ball,indexOfPlayers,t_phi);
                end


            else 
                [players] = target(indexOfPlayers,players,ball,goal_x,goal_y); %need tx,ty to be selected near goal 
                [ball] = dribble(players,ball,indexOfPlayers);
            end
        
        elseif indexOfPlayers==2 
            
            distance_all = radiusOfPlayer(players);
             
            [goal_phi,goal_x,goal_y] = kickaim(players,indexOfPlayers);
           
            goal_point = [rx,ry;goal_x,goal_y];
            
            goal_dist = pdist(goal_point,"euclidean");
        
            if goal_dist <= distance_all(index,4) && goal_dist < d_ball/2
              
                [players,ball] = kick(players,ball,indexOfPlayers,goal_phi);
               
            else 
        
                [p4x,p4y,~,~,~] = playerPosition(index,players,ball);
              
                tx = p4x;
                ty = p4y;
                t_phi = phicalculate(rx,ry,tx,ty);
                [players,ball] = kick(players,ball,indexOfPlayers,t_phi);
            
            end
            
            

        elseif indexOfPlayers == 3

            distance_all = radiusOfPlayer(players);
           
            [p2x,p2y,~,~,~] = playerPosition(2,players,ball);
            [p4x,p4y,~,~,~] = playerPosition(4,players,ball);
           
        
            if distance_all(index,2) < distance_all(index,4)  %% add condition to check for opp players and select acc to angle to avoid as well
              
                tx = p2x;
                ty = p2y;
               
            else
              
                tx = p4x;
                ty = p4y;
            
            end
            
            t_phi = phicalculate(rx,ry,tx,ty);
            [players,ball] = kick(players,ball,indexOfPlayers,t_phi);
        
        
        end
    end




end
