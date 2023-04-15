function [num] = nearOpponentsNum(players,indexOfPlayers)

variables;
dis = radiusOfPlayer(players);
R=0.5*scaling; % shortest passing distance

if indexOfPlayers<=4
    %disToTeamMates=dis(indexOfPlayers,1:4);
    disToOpponents=dis(indexOfPlayers,5:8);

else
    %disToTeamMates=dis(indexOfPlayers,5:8);
    disToOpponents=dis(indexOfPlayers,1:4);
end

num = sum(disToOpponents > R);

end

