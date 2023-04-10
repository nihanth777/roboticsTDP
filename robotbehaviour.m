function [players, ball] = robotbehaviour(players,ball,index)
variables;
ball_posession1 = players{3}(index);

[x1,y1,bx,by,~] = playerPosition(1,players,ball);
[x2,y2,bx,by,~] = playerPosition(2,players,ball);
[x3,y3,bx,by,~] = playerPosition(3,players,ball);
[x4,y4,bx,by,~] = playerPosition(4,players,ball);
[x5,y5,bx,by,~] = playerPosition(5,players,ball);
[x6,y6,bx,by,~] = playerPosition(6,players,ball);
[x7,y7,bx,by,~] = playerPosition(7,players,ball);
[x8,y8,bx,by,~] = playerPosition(8,players,ball);


%ball_possesion2 = players{3}(8);
if  ball_posession1 == 1 && index == 4
    [px,py,bx,by,~] = playerPosition(index,players,ball);
    tx = xlimit_outer-xlimit_boarderstrip-2*penaltymark;
    ty = ylimit_outer/2;
    %condition for pass
    if (197<=px)
        p2x = players{1}(2,1);
        p2y = players{1}(2,2);
        t_phi = phicalculate(px,py,p2x,p2y);
        [players,ball] = kick(players,ball,2,t_phi);
        players{3}(:,:) = 0 ;
        players{3}(2) = 1;
        %ball = ballfree(ball);
        
    else
        %team mates roles
        [players,ball]=target(index,players,ball,tx,ty);
        [players,ball] = dribble(players,ball,index);
         
        side_length = 50;

        tx1 = bx + side_length * cos(pi/6); % 30 degrees
        ty1 = by + side_length * sin(pi/6); % 30 degrees
        tx2= bx + side_length * cos(11*pi/6); % 330 degrees
        ty2 = by + side_length * sin(11*pi/6); % 330 degrees


        [players,ball]=target(3,players,ball,tx1,ty1);
        [players,ball] = dribble(players,ball,index);

        [players,ball]=target(2,players,ball,tx2,ty2);
        [players,ball] = dribble(players,ball,index);

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %opp team players role

        [players,ball]=target(8,players,ball,bx,by);
        [players,ball] = dribble(players,ball,index);

        [players,ball]=target(6,players,ball,bx,by);
        [players,ball] = dribble(players,ball,index);

        [players,ball]=target(7,players,ball,bx,by);
        [players,ball] = dribble(players,ball,index);
          
    end


elseif ball_posession1 == 1 && index == 2
    [px,py,bx,by,~] = playerPosition(index,players,ball);
    [players,ball] = target(index,players,ball,272,100);% rand here
    [players,ball] = dribble(players,ball,index);
    
    % condition for pass
    if (px>190)
        p2x = players{1}(4,1);
        p2y = players{1}(4,2);
        t_phi = phicalculate(px,py,p2x,p2y);
        [players,ball] = kick(players,ball,4,t_phi);
        %possesion
        players{3}(:,:) = 0 ;
        players{3}(4) = 1;
        %ball = ballfree(ball);

    %team mates roles
    elseif ~(ball_posession1 == 1 && index == 4)
    side_length = 80;

    tx1 = 240 + side_length * cos(pi/6*3); % 60 degrees
    ty1 = 50 + side_length * sin(pi/6*3); % 60 degrees
    tx2= 244 + side_length * cos(pi/6); % 330 degrees
    ty2 = 53 + side_length * sin(pi/6); % 330 degrees


    [players,ball]=target(4,players,ball,270,160);
    [players,ball] = dribble(players,ball,index);

    [players,ball]=target(3,players,ball,tx2,ty2);
    [players,ball] = dribble(players,ball,index);

    %%%%%%%%%%%%
    %opp players
     [players,ball]=target(8,players,ball,(x4+bx)/2,(y4+by)/2);
     [players,ball] = dribble(players,ball,index);

     [players,ball]=target(6,players,ball,(x3+bx)/2,(y3+by)/2);
     [players,ball] = dribble(players,ball,index);

     [players,ball]=target(7,players,ball,(x2+bx)/2,(y2+by)/2);
     [players,ball] = dribble(players,ball,index);

    elseif ball_posession1 == 1 && index == 4
        [px,py,bx,by,~] = playerPosition(4,players,ball);
        [players,ball] = target(index,players,ball,326,106);% %GOAL POST almost neart penalty and then kick POSITION HERE
        [players,ball] = kick(players,ball,index);
    

    end

end

%% if ball starts with opp player
%ball_possesion2 = players{3}(8);
if  ball_posession1 == 1 && index == 8
    [px,py,bx,by,~] = playerPosition(index,players,ball);   %c
    tx = 129; %C
    ty = 129; 

     %condition for pass
    if (px<140)
        p2x = players{1}(7,1);                          %7 to kick
        p2y = players{1}(7,2);
        t_phi = phicalculate(px,py,p2x,p2y);
        [players,ball] = kick(players,ball,7,t_phi);
        players{3}(:,:) = 0 ;
        players{3}(7) = 1;
        %ball = ballfree(ball);
        
    else
   
        %team mates roles
        [players,ball]=target(index,players,ball,tx,ty);
        [players,ball] = dribble(players,ball,index);
         
        side_length = 70;

        tx1 = bx + side_length * cos(pi/4); % 30 degrees
        ty1 = by + side_length * sin(pi/4); % 30 degrees
        tx2= bx + side_length * cos(11*pi/6); % 330 degrees
        ty2 = by + side_length * sin(11*pi/6); % 330 degrees


        [players,ball]=target(6,players,ball,tx1,ty1);
        [players,ball] = dribble(players,ball,index);

        [players,ball]=target(7,players,ball,tx2,ty2);
        [players,ball] = dribble(players,ball,index);

        %opp mates roles
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        [players,ball]=target(2,players,ball,bx,by);
        [players,ball] = dribble(players,ball,index);

        [players,ball]=target(3,players,ball,bx,by);
        [players,ball] = dribble(players,ball,index);

        [players,ball]=target(4,players,ball,bx,by);
        [players,ball] = dribble(players,ball,index);
          
    end


elseif ball_posession1 == 1 && index == 7
    [px,py,bx,by,~] = playerPosition(index,players,ball);
    [players,ball] = target(index,players,ball,124,78);% rand here        %%%C
    [players,ball] = dribble(players,ball,index);
    
    % condition for kick
    if (px<140)                                                           %%C
        p2x = players{1}(8,1);
        p2y = players{1}(8,2);
        t_phi = phicalculate(px,py,p2x,p2y);
        [players,ball] = kick(players,ball,8,t_phi);
        players{3}(:,:) = 0 ;
        players{3}(8) = 1;
        %ball = ballfree(ball);

    elseif ~(ball_posession1 == 1 && index == 8)
    side_length = 80;

    tx1 = 240 + side_length * cos(pi/6*3); % 60 degrees
    ty1 = 50 + side_length * sin(pi/6*3); % 60 degrees
    tx2= 244 + side_length * cos(pi/6); % 330 degrees
    ty2 = 53 + side_length * sin(pi/6); % 330 degrees

    %team mates roles
    [players,ball]=target(6,players,ball,tx1,ty1);
    [players,ball] = dribble(players,ball,index);

    [players,ball]=target(7,players,ball,tx2,ty2);
    [players,ball] = dribble(players,ball,index);

    %
    %opp mates roles
     [players,ball]=target(4,players,ball,(x4+bx)/2,(y4+by)/2);
     [players,ball] = dribble(players,ball,index);

     [players,ball]=target(3,players,ball,(x3+bx)/2,(y3+by)/2);
     [players,ball] = dribble(players,ball,index);

     [players,ball]=target(2,players,ball,(x2+bx)/2,(y2+by)/2);
     [players,ball] = dribble(players,ball,index);

    elseif ball_posession1== 1 && index == 8
        [px,py,bx,by,~] = playerPosition(4,players,ball);
        [players,ball] = target(index,players,ball,161,22);% %GOAL POST almost neart penalty and then kick POSITION HERE
        [players,ball] = kick(players,ball,index);
    

    end

end



%% GOAL KEEPER roles
%ball_possesion2 = players{3}(8);
if  ball_posession1 == 0 && index == 1
    [px,py,bx,by,~] = playerPosition(index,players,ball);   %c
    tx = bx; %C
    ty = by; 

     %condition for holding ball
    if (bx<90)
        p2x = players{1}(7,1);                           % get to the ball
        p2y = players{1}(7,2);
        t_phi = phicalculate(px,py,p2x,p2y);
        [players,ball] = kick(players,ball,7,t_phi);
        players{3}(:,:) = 0 ;
        players{3}(7) = 1;
        %ball = ballfree(ball);

       %passing ball
    else if (bx<87)
        p2x = players{1}(7,1);                          %7 to kick
        p2y = players{1}(7,2);
        t_phi = phicalculate(px,py,p2x,p2y);
        [players,ball] = kick(players,ball,7,t_phi);
        players{3}(:,:) = 0 ;
        players{3}(7) = 1;
        %ball = ballfree(ball);
    
    end

    end
  
end

if  ball_posession1 == 1 && index == 1
    [px,py,bx,by,~] = playerPosition(index,players,ball);
    [px3,py3,bx,by,~] = playerPosition(3,players,ball); %c
    tx = px3; %C
    ty = py3; 
    
    %passing ball
    if (bx<87)
        p2x = players{1}(7,1);                          %7 to kick
        p2y = players{1}(7,2);
        t_phi = phicalculate(px,py,p2x,p2y);
        [players,ball] = kick(players,ball,7,t_phi);
        players{3}(:,:) = 0 ;
        players{3}(7) = 1;
        %ball = ballfree(ball);
    
    end

%% GOAL KEEPER roles
%ball_possesion2 = players{3}(8);
if  ball_posession1 == 0 && index == 5
    [px,py,bx,by,~] = playerPosition(index,players,ball);   %c
    tx = bx; %C
    ty = by; 

     %condition for holding ball
    if (bx<259)
        p2x = players{1}(7,1);                          % get to the ball
        p2y = players{1}(7,2);
        t_phi = phicalculate(px,py,p2x,p2y);
        [players,ball] = kick(players,ball,7,t_phi);
        players{3}(:,:) = 0 ;
        players{3}(7) = 1;
        %ball = ballfree(ball);

       %passing ball
    else if (bx<87)
        p2x = players{1}(7,1);                          %7 to kick
        p2y = players{1}(7,2);
        t_phi = phicalculate(px,py,p2x,p2y);
        [players,ball] = kick(players,ball,7,t_phi);
        players{3}(:,:) = 0 ;
        players{3}(7) = 1;
        %ball = ballfree(ball);
    
    end

    end
  
end




end