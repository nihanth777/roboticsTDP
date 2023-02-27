variables
initialparams
plotSoccerField
ballposition(x_ball_init,y_ball_init,ball_radius)
robot_home_pos = [x_gk_home_init y_gk_home_init
             x_defend1_home y_defend1_home
             x_defend2_home y_defend2_home
             x_attacker_home y_attacker_home];
robotposition(robot_home_pos,'r',robot_radius);

robot_home_pos = [x_gk_away_init y_gk_away_init
             x_defend1_away y_defend1_away
             x_defend2_away y_defend2_away
             x_attacker_away y_attacker_away];
robotposition(robot_home_pos,'b',robot_radius);
