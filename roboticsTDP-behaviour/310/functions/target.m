function [players,ball] = target(index,players,ball,tx,ty)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [posx,posy,ballx,bally,dist] = playerPosition(index,players,ball);
    phi = players{2}(index,2);
    goalphi = phicalculate(posx,posy,tx,ty);
    v = players{2}(index,1);
    [x,y,phi_new,v] = movement1(posx,posy,tx,ty,phi,goalphi,v);
    players{1}(index,1) = x;
    players{1}(index,2) = y;
    players{2}(index,2) = phi_new;
    players{2}(index,1) = v;
end

