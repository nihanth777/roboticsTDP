variables

%initial position ball

x_ball_init = xlimit_outer/2;
y_ball_init = ylimit_outer/2;

%initial position robot

%goalkeep
x_gk_home_init = xlimit_boarderstrip;
y_gk_home_init = ylimit_outer/2;
x_gk_away_init = xlimit_inner+xlimit_boarderstrip;
y_gk_away_init = ylimit_outer/2;

%defender initial positions

x_defend1_home = xlimit_boarderstrip+(xlimit_inner/4);
y_defend1_home = ylimit_boarderstrip+(ylimit_inner/3);

x_defend2_home = xlimit_boarderstrip+(xlimit_inner/4);
y_defend2_home = ylimit_boarderstrip+2*(ylimit_inner/3);

x_defend1_away = xlimit_boarderstrip+3*(xlimit_inner/4);
y_defend1_away = ylimit_boarderstrip+(ylimit_inner/3);

x_defend2_away = xlimit_boarderstrip+3*(xlimit_inner/4);
y_defend2_away = ylimit_boarderstrip+2*(ylimit_inner/3);

if gamestate.start
   [x_attacker_home,y_attacker_home,x_attacker_away,y_attacker_away] = cointoss;
   gamestate.inplay;
end

robot_home_pos = [x_gk_home_init y_gk_home_init
             x_defend1_home y_defend1_home
             x_defend2_home y_defend2_home
             x_attacker_home y_attacker_home];

robot_away_pos = [x_gk_away_init y_gk_away_init
             x_defend1_away y_defend1_away
             x_defend2_away y_defend2_away
             x_attacker_away y_attacker_away];



 