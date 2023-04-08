function [players,ball] = kick(players,ball,indexOfPlayers,goal_phi)
variables;
ball_speed_max=90;
frictionCoefficient=-28.2;
omega=3;
noise=0.1*rand()-0.05;

r_phi=players{2}(indexOfPlayers,2);

if abs(r_phi-goal_phi)<sample_time % if the angle right, kick

    ball(2,:)=[ball_speed_max*cos(goal_phi);ball_speed_max*sin(goal_phi)];
    ball(3,:)=[frictionCoefficient*cos(goal_phi);frictionCoefficient*sin(goal_phi)];
    players{3}(:,1)=0;

else

    if (goal_phi-r_phi) > 0
            rphi_new = r_phi+omega*sample_time+noise;
   
    else
            rphi_new = r_phi-omega*sample_time+noise;
    
    end
     players{2}(indexOfPlayers,2) = rphi_new;
     ball(1,1)=players{4}(indexOfPlayers,1);
     ball(1,2)=players{4}(indexOfPlayers,2);
end
end