function [players, ball] = robotbehaviour(players,ball,index)
variables;
ball_posession1 = players{3}(index);
%ball_possesion2 = players{3}(8);
if  ball_posession1 == 1 && index == 4
    [px,py,bx,by,~] = playerPosition(index,players,ball);
    tx = xlimit_outer-xlimit_boarderstrip-2*penaltymark;
    ty = ylimit_outer/2;
    if (tx<=px)
        p2x = players{1}(2,1);
        p2y = players{1}(2,2);
        t_phi = phicalculate(px,py,p2x,p2y);
        [players,ball] = kick(players,ball,2,t_phi);
        %ball = ballfree(ball);
        
    else
        [players,ball]=target(index,players,ball,tx,ty);
        [players,ball] = dribble(players,ball,index);
    end
elseif  ball_posession1 == 1 && index == 8
    [px,py,bx,by,~] = playerPosition(index,players,ball);
    [players,ball] = dribble(players,ball,index);
    [players,ball]=target(index,players,ball,bx,by);
elseif ball_posession1 == 0 && (index == 2)
    [px,py,bx,by,~] = playerPosition(index,players,ball);
    [players,ball]=target(index,players,ball,xlimit_outer/2,ylimit_outer/4);
 
end


%{
    [posx1,posy1,ballx,bally,dist] = playerPosition(2,players,ball);
    phi = players{2}(2,2);
    goalphi = phicalculate(posx1,posy1,ballx+50,bally);
    v = players{2}(2,1);
    movement1(posx1,posy1,ballx+50,bally,phi,goalphi,v);

    [posx2,posy2,ballx,bally,dist] = playerPosition(3,players,ball);
    phi = players{2}(3,2);
    goalphi = phicalculate(posx2,posy2,ballx-50,bally);
    v = players{2}(3,1);
    movement1(posx2,posy2,ballx-50,bally,phi,goalphi,v);
elseif ball_possesion2 == 1
    [posx,posy,ballx,bally,dist] = playerPosition(8,players,ball);
    phi = players{2}(8,2);
    goalphi = phicalculate(posx,posy,ballx,bally);
     v = players{2}(8,1);
    movement1(posx,posy,ballx,bally,phi,goalphi,v);
    [posx1,posy1,ballx,bally,dist] = playerPosition(6,players,ball);
    phi = players{2}(6,2);
    goalphi = phicalculate(posx1,posy1,ballx+50,bally);
     v = players{2}(6,1);
    movement1(posx1,posy1,ballx+50,bally,phi,goalphi,v);
    [posx2,posy2,ballx,bally,dist] = playerPosition(7,players,ball);
    phi = players{2}(7,2);
    goalphi = phicalculate(posx2,posy2,ballx-50,bally);
     v = players{2}(7,1);
    movement1(posx2,posy2,ballx-50,bally,phi,goalphi,v);
%}
end