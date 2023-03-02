function [x_attacker_home,y_attacker_home,x_attacker_away,y_attacker_away,flag] = cointoss()
    
    variables;
    coin = rand;
    kickoff = rand;

    if coin <= 0.5
        if kickoff <=0.5
            x_attacker_home =  (xlimit_outer/2)-ball_radius-ball_threshold-2*robot_radius;
            y_attacker_home = ylimit_outer/2;

            x_attacker_away = (xlimit_outer/2)+centrecircle_dia;
            y_attacker_away = ylimit_outer/2;

            flag = ballposession.attacker_home;

        elseif kickoff >0.5
            x_attacker_home = (xlimit_outer/2)-centrecircle_dia;
            y_attacker_home = ylimit_outer/2;

            x_attacker_away = (xlimit_outer/2)+ball_radius+ball_threshold+2*robot_radius;
            y_attacker_away = ylimit_outer/2;

            flag = ballposession.attacker_away;
        end
       

    elseif coin > 0.5
        if kickoff <=0.5
            x_attacker_home = (xlimit_outer/2)-centrecircle_dia;
            y_attacker_home = ylimit_outer/2;

            x_attacker_away = (xlimit_outer/2)+ball_radius+ball_threshold+2*robot_radius;
            y_attacker_away = ylimit_outer/2;

            flag = ballposession.attacker_away;

        elseif kickoff >0.5
            x_attacker_home =  (xlimit_outer/2)-ball_radius-ball_threshold-2*robot_radius;
            y_attacker_home = ylimit_outer/2;

            x_attacker_away = (xlimit_outer/2)+centrecircle_dia;
            y_attacker_away = ylimit_outer/2;

            flag = ballposession.attacker_home;
        end
        
    end