%field dimentions
sample_time = 0.1;
scaling = 32;
ball_radius = 0.07*scaling;
ball_threshold =0.07*scaling;


xlimit_outer = 11*scaling ;
ylimit_outer = 8*scaling;

xlimit_inner = 9*scaling;
ylimit_inner = 6*scaling;

xlimit_boarderstrip = 1*scaling;
ylimit_boarderstrip = 1*scaling;

goalpost_xlimit = 0.6*scaling;
goalpost_ylimit = 2.6*scaling;

goalarea_xlimit = 1*scaling;
goalarea_ylimit = 3*scaling;

penaltyarea_xlimit = 2*scaling;
penaltyarea_ylimit = 5*scaling;

centrecircle_dia = 1.5*scaling;

penaltymark = 1.5*scaling;

robot_radius = 0.15*scaling;

goal_point1 = 1.7*scaling;
goal_point2 = 4.3*scaling;

% V = 33.6;
V=0.35*scaling;%max robot speed
a=0.3*scaling;
V_ball=0.52*scaling;%mean ball speed
d_ball=1.062*scaling;%max ball distance
t_ball=d_ball/V_ball;%time for ball to stop
a_ball=-V_ball*2/t_ball;
omega= 1;
ball_speed_max=V_ball*2;


x_ball_init = xlimit_outer/2;
y_ball_init = ylimit_outer/2;

nPlayers = 8;


