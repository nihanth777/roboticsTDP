function [ball] = ballfree(ball)
variables;
ball_x=ball(1,1);
ball_y=ball(1,2);
ball_vx=ball(2,1);
ball_vy=ball(2,2);
ball_ax=ball(3,1);
ball_ay=ball(3,2);
if abs(ball_vx) > 0.5 || abs(ball_vy)>0.5
    ball(2,1) = ball_vx+ball_ax*sample_time+0.1*rand()-0.05;
    ball(2,2) = ball_vy+ball_ay*sample_time+0.1*rand()-0.05;
    ball_vx=ball(2,1);
    ball_vy=ball(2,2);
    ball(1,1) = ball_x+sample_time*ball_vx+0.5*ball_ax*sample_time^2;
    ball(1,2) = ball_y+sample_time*ball_vy+0.5*ball_ay*sample_time^2;
else
    ball(2:3,:)=0;
end

end  



