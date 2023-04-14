function [players,ball,last_possession] = goalKeep(players,ball,indexOfPlayers,last_possession)

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
   
    keep_x=x_gk_home_init;
    keep_y=ylimit_outer/2 + (rand-0.5)*scaling;
    phi=0;

else
    
    keep_x = x_gk_away_init;
    keep_y = ylimit_outer/2+ (rand-0.5)*scaling;
    phi=pi;

end

ball_x=ball(1,1);
ball_y=ball(1,2);

disttoball=sqrt((ball_x - rx)^2 + (ball_y - ry)^2);

if players{3}(indexOfPlayers) == 1 %player has the ball

    %pass ball test
        playerIndex=shortPass(players,indexOfPlayers);
        goal_x=players{1}(playerIndex,1);
        goal_y=players{1}(playerIndex,2);
        goal_phi = phicalculate(rx,ry,goal_x,goal_y);
        [players,ball]=kick(players,ball,indexOfPlayers,goal_phi);

else %player does not have the ball
    if flag == 0 %team does not have ball
        if abs(rx-ball_x)<=4.8 && abs(ry-ball_y)<=4.8 
            
            [players,ball,last_possession] = possession(indexOfPlayers,players, ball);
           
        else 
          if disttoball < maxactdist && indexOfPlayers == 1 && ball_x < xlimit_boarderstrip+goalarea_xlimit && (ball_y > 2.5*scaling || ball_y < 5.5*scaling)
               
              [players] = target(indexOfPlayers,players,ball,ball_x,ball_y);

          elseif disttoball < maxactdist && indexOfPlayers == 5 && ball_x > xlimit_boarderstrip+xlimit_inner-goalarea_xlimit &&(ball_y > 2.5*scaling || ball_y < 5.5*scaling)
              
              [players] = target(indexOfPlayers,players,ball,ball_x,ball_y);

          elseif indexOfPlayers == 1 && ball_x < xlimit_boarderstrip+penaltyarea_xlimit && (ball_y > 1.5*scaling || ball_y < 6.5)

              %move to the nearest point on goal line towards the ball

          elseif indexOfPlayers == 5 && ball_x > xlimit_boarderstrip+xlimit_inner-penaltyarea_xlimit && (ball_y > 1.5*scaling || ball_y < 6.5)

              %move to the nearest point on goal line towards the ball
          
          else
              [players] = target(indexOfPlayers,players,ball,keep_x,keep_y);
          end
        end
    else
        [players] = target(indexOfPlayers,players,ball,keep_x,keep_y);

        if abs(players{1}(indexOfPlayers,1)-keep_x)<=4.8 && abs(players{1}(indexOfPlayers,2)-keep_y)<=4.8
        %turn to the right angle
            if abs(r_phi-phi)>sample_time % if the angle right
                 if (phi-r_phi) > 0
                        
                     rphi_new = r_phi+omega*sample_time+noise;
                 
                 else
                        
                     rphi_new = r_phi-omega*sample_time+noise;
                 
                 end
            
                 players{2}(indexOfPlayers,2)=rphi_new;
            
            end       
        end
    end
end

% if disttoball<maxactdist % act or not 
%     
%     if players{3}(indexOfPlayers)==0 && flag==0  % player and its teammates not possess the ball
%         if abs(rx-ball_x)<=4.8 && abs(ry-ball_y)<=4.8 
%             
%             [players,ball,last_possession] = possession(indexOfPlayers,players, ball);
%            
%         else %if the player does not possess the ball ,move to ball
%             
%             [players] = target(indexOfPlayers,players,ball,ball_x,ball_y);
%         
%         end   
%     
%     elseif players{3}(indexOfPlayers)==1%possess the ball 
%         
%         %pass ball test
%         playerIndex=shortPass(players,indexOfPlayers);
%         goal_x=players{1}(playerIndex,1);
%         goal_y=players{1}(playerIndex,2);
%         goal_phi = phicalculate(rx,ry,goal_x,goal_y);
%         [players,ball]=kick(players,ball,indexOfPlayers,goal_phi);
% 
%     else
%         % do not move
% 
%     end
% else
%     
%     [players] = target(indexOfPlayers,players,ball,keep_x,keep_y);
%     
%     if abs(players{1}(indexOfPlayers,1)-keep_x)<=4.8 && abs(players{1}(indexOfPlayers,2)-keep_y)<=4.8
%         %turn to the right angle
%         if abs(r_phi-phi)>sample_time % if the angle right
%              if (phi-r_phi) > 0
%                     
%                  rphi_new = r_phi+omega*sample_time+noise;
%              
%              else
%                     
%                  rphi_new = r_phi-omega*sample_time+noise;
%              
%              end
%         
%              players{2}(indexOfPlayers,2)=rphi_new;
%         
%         end       
%     end
% 
% end

end





