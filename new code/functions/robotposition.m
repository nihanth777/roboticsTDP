function [x,y] = robotposition(centre,col,radius,phi)
   hold on
   variables;
   viscircles(centre,radius,Color=col,LineWidth=1);
   x=centre(1,1)+((2*robot_radius)*cos(phi));
   y=centre(1,2)+((2*robot_radius)*sin(phi));
   plot([centre(1,1) x],[centre(1,2) y],'LineWidth',2,Color=col);
   % plot(x_robot,y_robot,Color=col,Marker="o")
   hold off
end