function [posit] = supportposition(players,indexOfPlayers)
%find the aim position of the defender
variables;
l=sin(pi/4)*d_ball;
rx=players{1}(indexOfPlayers,1);
ry=players{1}(indexOfPlayers,2);
%r=[rx,ry];

%the 4 points
posA=[rx-l,ry+l];
posB=[rx+l,ry+l];
posC=[rx-l,ry-l];
posD=[rx+l,ry-l];

pos=[posA,posB,posC,posD];


if indexOfPlayers<4
    opponentteam=[players{1}(6:8,:)];
else
    opponentteam=[players{1}(2:4,:)];
end



% disA=dist(r,posA');
% disB=dist(r,posB');
% disC=dist(r,posC');
% disD=dist(r,posD');
% dis=[disA,disB,disC,disD];

diastance = pdist2(pos,opponentteam);% 4*3 martrix
distanceA=sum(diastance(1,:));%the total distance between point A and 3 opponent players
distanceB=sum(diastance(2,:));
distanceC=sum(diastance(3,:));
distanceD=sum(diastance(4,:));

dis=[distanceA,distanceB,distanceC,distanceD];


[~, posIndex]=min(dis);
if posIndex==1
    posit=posA;
elseif posIndex==2
    posit=posB;
elseif posIndex==3
    posit=posC;
elseif posIndex==4
    posit=posD;



end

