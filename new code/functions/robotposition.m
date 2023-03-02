function [x,y] = robotposition(params,col,radius)
   hold on;
   variables;
   viscircles([params(:,1) , params(:,2)],radius,Color=col,LineWidth=1);
   x=params(:,1)+((2*radius)*cos(params(:,3)));
   y=params(:,2)+((2*radius)*sin(params(:,3)));

   plot([params(1,1) x(1)],[params(1,2) y(1)],'LineWidth',2,Color=col);
   plot([params(2,1) x(2)],[params(2,2) y(2)],'LineWidth',2,Color=col);
   plot([params(3,1) x(3)],[params(3,2) y(3)],'LineWidth',2,Color=col);
   plot([params(4,1) x(4)],[params(4,2) y(4)],'LineWidth',2,Color=col);
   % plot(x_robot,y_robot,Color=col,Marker="o")
   hold off;
end