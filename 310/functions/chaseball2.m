function [players,ball,last_possession] = chaseball2(players,ball,indexOfPlayers,last_possession)

variables;

rx=players{1}(indexOfPlayers,1);
ry=players{1}(indexOfPlayers,2);

ball_x=ball(1,1);
ball_y=ball(1,2);

disttoball=sqrt((ball_x - rx)^2 + (ball_y - ry)^2);

if players{3}(indexOfPlayers)==0  % player not possess the ball
        
    if indexOfPlayers <=4
        if players{3}(1:4) == 0

            if abs(rx-ball_x)<=4.8 && abs(ry-ball_y)<=4.8 %improve: adding probability of interception
                        [players,ball,last_possession] = possession(indexOfPlayers,players, ball);
            else
                if indexOfPlayers == 4 
                 
                %move to ball
                %[players] = target(indexOfPlayers,players,ball,ball_x,ball_y);
                %g -he will move to the ball only in opp half in own team
                %half hes makes space
                 
                if ball(1,1)>180
                    [players] = target(indexOfPlayers,players,ball,ball_x,ball_y);
                else
                    
                    [players] = target(indexOfPlayers,players,ball,(ball_x+170)/2,(ball_y+130)/2);
                end
                %%g code for player 4 ends here
                elseif indexOfPlayers == 3 

                    if ball(1,1) > xlimit_outer/2

                        %go to efend position
                        [players] = target(indexOfPlayers,players,ball,penaltyarea_xlimit+xlimit_boarderstrip,ylimit_outer/2);
                        
                    else
                    
                        if disttoball<=maxactdist || ball(1,1) < penaltyarea_xlimit+xlimit_boarderstrip
                    
                            [players] = target(indexOfPlayers,players,ball,ball_x,ball_y);
                        
                        else
        
                            %go to defend position
                            [players] = target(indexOfPlayers,players,ball,penaltyarea_xlimit+xlimit_boarderstrip,ylimit_outer/2);
        
                        end
                    end
                    
                elseif indexOfPlayers == 2 
                                
                            [~,~,bx,by,~] = playerPosition(indexOfPlayers,players,ball);
                            [players] = target(indexOfPlayers,players,ball,(30+((bx)/3)),(192+by)/2);%2 and 3 matters in y
                          
                       
                end
            end
                
        else    
                if players{3}(4)==1
                      %gcode - 
                    %[pos] = supportposition(players,indexOfPlayers);
                    [~,~,bx,by,~] = playerPosition(4,players,ball);
                    [players] = target(2,players,ball,(200+bx)/2,(170+by)/2);
                    [players] = target(3,players,ball,(270+bx)/2,(70+by)/2);

                
                elseif indexOfPlayers == 2

                    [pos] = supportposition(players,indexOfPlayers);
                    [players] = target(indexOfPlayers,players,ball,pos(1)+10,pos(2)+10);

                elseif indexOfPlayers == 3 
                    %gcode for defending
                    if ball(1,1)<170
                         [~,~,bx,by,~] = playerPosition(3,players,ball);
                         [players] = target(indexOfPlayers,players,ball,(40+bx)/2,(140+by)/2);
                    end

                    if ball(1,1) > xlimit_outer/2

                        %go to defend position
                        [players] = target(indexOfPlayers,players,ball,penaltyarea_xlimit+xlimit_boarderstrip,ylimit_outer/2);
                        
                    else
                    
                        if disttoball<=maxactdist || ball(1,1) < penaltyarea_xlimit+xlimit_boarderstrip
                    
                            [players] = target(indexOfPlayers,players,ball,ball_x,ball_y);
                        
                        else
        
                            %go to defend position
                            [players] = target(indexOfPlayers,players,ball,penaltyarea_xlimit+xlimit_boarderstrip,ylimit_outer/2);
        
                        end
                    end
                end
        
        end
    
    else
            if players{3}(5:8) == 0
                if abs(rx-ball_x)<=4.8 && abs(ry-ball_y)<=4.8 %improve: adding probability of interception
                        [players,ball,last_possession] = possession(indexOfPlayers,players, ball);
                else
                    if indexOfPlayers == 6 %support attacker
         
                         [players] = target(indexOfPlayers,players,ball,ball_x,ball_y);
                        
                    elseif indexOfPlayers ==7

                      if ball(1,1)>200
                         [players] = target(indexOfPlayers,players,ball,ball_x,ball_y);
                      end
                        
                      if ball(1,1) < xlimit_outer/2

                        %go to defend position
                        [players] = target(indexOfPlayers,players,ball,xlimit_inner+xlimit_boarderstrip-penaltyarea_xlimit,ylimit_outer/2);
                    
                      else
                          if disttoball<=maxactdist || ball(1,1) >= xlimit_inner+xlimit_boarderstrip-penaltyarea_xlimit
                    
                             [players] = target(indexOfPlayers,players,ball,ball_x,ball_y);
                 
                          else

                             [players] = target(indexOfPlayers,players,ball,xlimit_inner+xlimit_boarderstrip-penaltyarea_xlimit,ylimit_outer/2);
            
                          end
                       
                      end
                    
                    elseif indexOfPlayers == 8
                        
                        %[players] = target(indexOfPlayers,players,ball,ball_x,ball_y);
                        %g code for player 8 same 
                        if ball(1,1)<180
                        [players] = target(indexOfPlayers,players,ball,ball_x,ball_y);
                        else
                        [players] = target(indexOfPlayers,players,ball,(ball_x+170)/2,(ball_y+130)/2);
                         end
                    
                    end
                end
            else
                 %gcode semi circle formation
                 if  players{3}(8)==1
                    %gcode - 
                    %[pos] = supportposition(players,indexOfPlayers);
                    [~,~,bx,by,~] = playerPosition(8,players,ball);

                    r = 50;
                    theta1 = pi/8; 
                    theta2 = pi/2; %gcode can change to 90+ and r
                    x1 = bx + r*cos(theta1);
                    y1 = by + r*sin(theta1);
                    x2 = bx + r*cos(theta2);
                    y2 = by + r*sin(theta2);

                    [players] = target(7,players,ball,x1+10,y1);
                    [players] = target(6,players,ball,x2,y2);
                 
                 elseif indexOfPlayers == 6

                    [pos] = supportposition(players,indexOfPlayers);
                    [players] = target(indexOfPlayers,players,ball,pos(1),pos(2));

                elseif indexOfPlayers == 7

                    if ball(1,1) < xlimit_outer/2

                        %go to defend position
                        [players] = target(indexOfPlayers,players,ball,xlimit_inner+xlimit_boarderstrip-penaltyarea_xlimit,ylimit_outer/2);
                    
                    else

                        if disttoball<=maxactdist || ball(1,1) >= xlimit_inner+xlimit_boarderstrip-penaltyarea_xlimit
                    
                        [players] = target(indexOfPlayers,players,ball,ball_x,ball_y);
                        
                        else
            
                            %go to defend position
                            [players] = target(indexOfPlayers,players,ball,xlimit_inner+xlimit_boarderstrip-penaltyarea_xlimit,ylimit_outer/2);
            
                        end
                    end
                end
            end
    end

else %possess the ball 
     % g code fro 4 and 8 players
        if indexOfPlayers==4 
           
            [goal_phi,goal_x,goal_y] = kickaim(players,indexOfPlayers);
            dist_to_goal = sqrt((goal_x - rx)^2 + (goal_y - ry)^2);
            prob = rand;

            if prob>=0.5

                kick_radius = d_ball;

            else

                kick_radius = 2*d_ball;

            end

            if dist_to_goal < kick_radius
                          
                [players,ball] = kick(players,ball,indexOfPlayers,goal_phi);
     
            else 
                %g kicked befor 3 points diversion
                [players] = target(indexOfPlayers,players,ball,260,134); %need tx,ty to be selected near goal 
                [ball] = dribble(players,ball,indexOfPlayers);
                %g code for teammates for 4
                [px,py,~,~,~] = playerPosition(8,players,ball);
                [players] = target(6,players,ball,(px+270)/2,(py+70)/2);
                [players] = target(7,players,ball,(px+270)/2,(py+170)/2);

            end
        elseif indexOfPlayers==8 

            [goal_phi,goal_x,goal_y] = kickaim(players,indexOfPlayers);
            dist_to_goal = sqrt((goal_x - rx)^2 + (goal_y - ry)^2);
            prob = rand;

            if prob>=0.5

                kick_radius = d_ball;

            else

                kick_radius = 2*d_ball;

            end

            if dist_to_goal < kick_radius
                          
                [players,ball] = kick(players,ball,indexOfPlayers,goal_phi);
     
            else 
                 %gcode add 3 points diversion
                [players] = target(indexOfPlayers,players,ball,73,108); %need tx,ty to be selected near goal 
                [ball] = dribble(players,ball,indexOfPlayers);

                %gcode for teammates how to respond when 8 gets the ball
                %give y will change the angle of apporch like 70 80 90
                [px,py,~,~,~] = playerPosition(8,players,ball);
                [players] = target(6,players,ball,(px+70)/2,(py+70)/2);
                [players] = target(7,players,ball,(px+70)/2,(py+170)/2);

            end
        elseif indexOfPlayers==2
            
            distance_all = radiusOfPlayer(players);
             
            [goal_phi,goal_x,goal_y] = kickaim(players,indexOfPlayers);
           
            goal_point = [rx,ry;goal_x,goal_y];
            
            goal_dist = pdist(goal_point,"euclidean");

            [num] = nearOpponentsNum(players,indexOfPlayers);
            
            if num == 3
                    
                playerIndex = 3;
                [px,py,~,~,~] = playerPosition(playerIndex,players,ball);
          
                tx = px;
                ty = py;
                t_phi = phicalculate(rx,ry,tx,ty);
                [players,ball] = kick(players,ball,indexOfPlayers,t_phi);

            end
        
            if goal_dist <= distance_all(indexOfPlayers,4) && goal_dist < d_ball/2
              
                [players,ball] = kick(players,ball,indexOfPlayers,goal_phi);
               
            else 
        
                [p4x,p4y,~,~,~] = playerPosition(4,players,ball);
              
                tx = p4x;
                ty = p4y;
                t_phi = phicalculate(rx,ry,tx,ty);
                [players,ball] = kick(players,ball,indexOfPlayers,t_phi);
            
            end
            
            

        elseif indexOfPlayers == 3

            distance_all = radiusOfPlayer(players);
           
            [p2x,p2y,~,~,~] = playerPosition(2,players,ball);
            [p4x,p4y,~,~,~] = playerPosition(4,players,ball);
           
        
            if distance_all(indexOfPlayers,2) < distance_all(indexOfPlayers,4)  %% add condition to check for opp players and select acc to angle to avoid as well
              
                tx = p2x;
                ty = p2y;
               
            else
              
                tx = p4x;
                ty = p4y;
            
            end
            
            t_phi = phicalculate(rx,ry,tx,ty);
            [players,ball] = kick(players,ball,indexOfPlayers,t_phi);
        
        elseif indexOfPlayers == 6

            distance_all = radiusOfPlayer(players);
             
            [goal_phi,goal_x,goal_y] = kickaim(players,indexOfPlayers);
           
            goal_point = [rx,ry;goal_x,goal_y];
            
            goal_dist = pdist(goal_point,"euclidean");

            [num] = nearOpponentsNum(players,indexOfPlayers);
            
            if num == 3
                    
                playerIndex = 7;
                [px,py,~,~,~] = playerPosition(playerIndex,players,ball);
          
                tx = px;
                ty = py;
                t_phi = phicalculate(rx,ry,tx,ty);
                [players,ball] = kick(players,ball,indexOfPlayers,t_phi);

            end
        
            if goal_dist <= distance_all(indexOfPlayers,8) && goal_dist < d_ball/2
              
                [players,ball] = kick(players,ball,indexOfPlayers,goal_phi);
               
            else 
        
                [p8x,p8y,~,~,~] = playerPosition(8,players,ball);
              
                tx = p8x;
                ty = p8y;
                t_phi = phicalculate(rx,ry,tx,ty);
                [players,ball] = kick(players,ball,indexOfPlayers,t_phi);
            
            end
                
        elseif indexOfPlayers == 7

            distance_all = radiusOfPlayer(players);
           
            [p6x,p6y,~,~,~] = playerPosition(6,players,ball);
            [p8x,p8y,~,~,~] = playerPosition(8,players,ball);
           
        
            if distance_all(indexOfPlayers,2) < distance_all(indexOfPlayers,6)  %% add condition to check for opp players and select acc to angle to avoid as well
              
                tx = p6x;
                ty = p6y;
               
            else
              
                tx = p8x;
                ty = p8y;
            
            end
            
            t_phi = phicalculate(rx,ry,tx,ty);
            [players,ball] = kick(players,ball,indexOfPlayers,t_phi);
        end

end
end
   
    