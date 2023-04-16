function [players] = gkTarget(index,players,ball,tx,ty)

    [posx,posy,~,~,~] = playerPosition(index,players,ball);
    phi = players{2}(index,2);
    v = players{2}(index,1);
    [x,y,phi_new,V] = gkMovement(posx,posy,tx,ty,phi,v);
    players{1}(index,1) = x;
    players{1}(index,2) = y;
    players{2}(index,2) = phi_new;
    players{2}(index,1) = V;

end