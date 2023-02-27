function nextPosition(x,y,phi,l)
%NEXTPOSITION is a function used to plot the moving direction wrt
%distance and heading angle.
%   Detailed explanation goes here
X=x+l*cos(phi);
Y=y+l*sin(phi);
plot([x X],[y Y],"Color","black","LineStyle","-")
end

