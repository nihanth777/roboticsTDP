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
    if (197<=px)
        p2x = players{1}(2,1);
        p2y = players{1}(2,2);
        t_phi = phicalculate(px,py,p2x,p2y);
        [players,ball] = kick(players,ball,2,t_phi);
        players{3}(:,:) = 0 ;
        players{3}(2) = 1;
        %ball = ballfree(ball);
        
    else
   

        [players,ball]=target(index,players,ball,tx,ty);
        [players,ball] = dribble(players,ball,index);
         
        side_length = 5;

        tx1 = bx + side_length * cos(pi/6); % 30 degrees
        ty1 = by + side_length * sin(pi/6); % 30 degrees
        tx2= bx + side_length * cos(11*pi/6); % 330 degrees
        ty2 = by + side_length * sin(11*pi/6); % 330 degrees


        [players,ball]=target(3,players,ball,tx1,ty1);
        [players,ball] = dribble(players,ball,index);

        [players,ball]=target(2,players,ball,tx2,ty2);
        [players,ball] = dribble(players,ball,index);

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        [players,ball]=target(8,players,ball,bx,by);
        [players,ball] = dribble(players,ball,index);

        [players,ball]=target(6,players,ball,bx,by);
        [players,ball] = dribble(players,ball,index);

        [players,ball]=target(7,players,ball,bx,by);
        [players,ball] = dribble(players,ball,index);
          
    end

elseif  ball_posession1 == 1 && index == 8
    tx = xlimit_outer-xlimit_boarderstrip-2*penaltymark;
    ty = ylimit_outer/2;
    [px,py,bx,by,~] = playerPosition(index,players,ball);
    [players,ball]=target(index,players,ball,tx,ty);
    [players,ball] = dribble(players,ball,index);
   

elseif ball_posession1 == 1 && index == 2
    [px,py,bx,by,~] = playerPosition(index,players,ball);
    [players,ball] = target(index,players,ball,272,100);% rand here
    [players,ball] = dribble(players,ball,index);
    
    % added after 
    if (px>190)
        p2x = players{1}(4,1);
        p2y = players{1}(4,2);
        t_phi = phicalculate(px,py,p2x,p2y);
        [players,ball] = kick(players,ball,4,t_phi);
        players{3}(:,:) = 0 ;
        players{3}(4) = 1;
        %ball = ballfree(ball);

    elseif ~(ball_posession1 == 1 && index == 8)
    side_length = 80;

    tx1 = 240 + side_length * cos(pi/6*3); % 60 degrees
    ty1 = 50 + side_length * sin(pi/6*3); % 60 degrees
    tx2= 244 + side_length * cos(pi/6); % 330 degrees
    ty2 = 53 + side_length * sin(pi/6); % 330 degrees


    [players,ball]=target(4,players,ball,tx1,ty1);
    [players,ball] = dribble(players,ball,index);

    [players,ball]=target(3,players,ball,tx2,ty2);
    [players,ball] = dribble(players,ball,index);

    %%%%%%%%%%%%
     [players,ball]=target(8,players,ball,(x4+bx)/2,(y4+by)/2);
     [players,ball] = dribble(players,ball,index);

     [players,ball]=target(6,players,ball,(x3+bx)/2,(y3+by)/2);
     [players,ball] = dribble(players,ball,index);

     [players,ball]=target(7,players,ball,(x2+bx)/2,(y2+by)/2);
     [players,ball] = dribble(players,ball,index);

    elseif ball_posession1 == 1 && index == 8
        %kick to goal

    end

end



end