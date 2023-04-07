function [] = plotplayers(players,robotradius)
   hold on;
   variables;
   params=players{1};
   angle=players{2}(:,2);
  
   %viscircles([params(0:4,1) , params(0:4,2)],robotradius,'r',LineWidth=1);
   %viscircles([params(5:8,1) , params(5:8,2)],robotradius,'b',LineWidth=1);
   viscircles(params(1:4,:),robotradius,Color='r',LineWidth=1);
   viscircles(params(5:8,:),robotradius,Color='b',LineWidth=1);

   x=params(:,1)+((2*robotradius)*cos(angle));
   y=params(:,2)+((2*robotradius)*sin(angle));
   
   i=1;
   while i<=8
       if i<=4
           plot([params(i,1) x(i)],[params(i,2) y(i)],'LineWidth',2,Color='r');
       else
           plot([params(i,1) x(i)],[params(i,2) y(i)],'LineWidth',2,Color='b');
       end
       i=i+1;
   end
   hold off;
end

