function [players] = collision(players)
% collision
collisiondist=4.8*2; %2D
dist=radiusOfPlayer(players);
for i=1:8
    dist(i,i)=NaN;
end

%distance(distance<collisiondist)=-1;
%dist=distance(1:4,:);


for x=1:8
    for y=x:8
        if dist(x,y)<collisiondist
            repulsion=(collisiondist-dist(x,y))/2;
            c=(players{2}(x,1) + players{2}(y,1))*0.01;      % collision coeffient about speed
            %ph=phicalculate(players{1}(x,1),players{1}(x,2),players{1}(y,1),players{1}(y,2));
            ph1=(players{1}(x,1)-players{1}(y,1))/dist(x,y);
            ph2=(players{1}(x,2)-players{1}(y,2))/dist(x,y);
            players{1}(x,1) = players{1}(x,1)+ph1*c*repulsion;
            players{1}(x,2) = players{1}(x,2)+ph2*c*repulsion;
            players{1}(y,1) = players{1}(y,1)-ph1*c*repulsion;
            players{1}(y,2) = players{1}(y,2)-ph2*c*repulsion;
        end
    end
end

% [row,col]=find(dist<collisiondist); %find the index 



end
























