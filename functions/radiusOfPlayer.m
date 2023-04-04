function [dis]=radiusOfPlayer(players)

position=players{1};
dis=pdist(position);
dis=squareform(dis);

end