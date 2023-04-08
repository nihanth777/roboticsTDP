function [ball] = ballfree(ball)
variables;
ball_x=ball(1,1);
ball_y=ball(1,2);
ball_vx=ball(2,1);
ball_vy=ball(2,2);
ball_ax=ball(3,1);
ball_ay=ball(3,2);

new_vx = ball_vx+ball_ax*sample_time+0.1*rand()-0.05;
new_vy = ball_vy+ball_ay*sample_time+0.1*rand()-0.05;

if ball_vx*new_vx<0 
    ball(2:3,1)=0;
elseif ball_vy*new_vy<0 
    ball(2:3,2)=0;
else
    ball(2,1)=new_vx;
    ball(2,2)=new_vy;
end

ball_vx=ball(2,1);
ball_vy=ball(2,2);
ball(1,1) = ball_x+sample_time*ball_vx+0.5*ball_ax*sample_time^2;
ball(1,2) = ball_y+sample_time*ball_vy+0.5*ball_ay*sample_time^2;



end  



