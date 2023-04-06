function [playerIndex]=shortPass(players,indexOfPlayers)
    %[players,ball] = possession(indexOfPlayers,players, ball);
    %if players{3}(indexOfPlayers)==2 % for goalkeeper

    dis = radiusOfPlayer(players);
    Minpassdis=10; % shortest passing distance
    %distance=dis(indexOfPlayers,:);


    if indexOfPlayers<=4
        disToTeamMates=dis(indexOfPlayers,1:4);
        disToOpponents=dis(indexOfPlayers,5:8);

        % [~,playerIndex] = find(distance==min(distance(distance>0)));
    else
        disToTeamMates=dis(indexOfPlayers,5:8);
        disToOpponents=dis(indexOfPlayers,1:4);
        % [~,playerIndex] = find(distance==min(distance(distance>0)));
        % playerIndex=playerIndex+4;
    end

    % avoid passing to the goalkeeper
    disToTeamMates(1)=NaN;
    disToTeamMates(5)=NaN;

    disToTeamMates(disToTeamMates<Minpassdis)=NaN;
    
    [~, playerIndex]=min(disToTeamMates);



%      if indexOfPlayers<=4
% %          dist=distance(1:4);
% %          dist=dist(dist ~= 0);
% %          [~, min_idx] = min(dist);
% %          idx = find(distance(1:4) == dist(min_idx));
% %          %playerIndex=idx+1;
%           playerIndex=2;
% 
%      else
% %          dist=distance(5:8);
% %          dist=dist(dist ~= 0);
% %          [~, min_idx] = min(dist);
% %          idx = find(distance(5:8) == dist(min_idx));
% %          %playerIndex=idx+5;
%           playerIndex=6;
%      end


        
    %end
end