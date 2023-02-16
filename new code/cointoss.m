function coin = cointoss()
    coin = rand;

    if gamestate.start && coin <= 0.5
         x_attacker_home =  (xlimit_outer/2)-ball_radius-ball_threshold;
         y_attacker_home = ylimit_outer/2;

         x_attacker_away = (xlimit_outer/2)+centrecircle_dia;
         y_attacker_away = ylimit_outer/2;

    

    elseif gamestate.start && coin > 0.5
         x_attacker_home = (xlimit_outer/2)-ball_radius-ball_threshold;
         y_attacker_home = ylimit_outer/2;

         x_attacker_away = (xlimit_outer/2)+centrecircle_dia;
         y_attacker_away = ylimit_outer/2;
    end