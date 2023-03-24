function [x_attacker_home,y_attacker_home,x_attacker_away,y_attacker_away,flag,players,ball] = cointoss(players,ball)
    
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
            [players,ball] = possession(4,players, ball);

        elseif kickoff >0.5
            x_attacker_home = (xlimit_outer/2)-centrecircle_dia;
            y_attacker_home = ylimit_outer/2;

            x_attacker_away = (xlimit_outer/2)+ball_radius+ball_threshold+2*robot_radius;
            y_attacker_away = ylimit_outer/2;

            flag = ballposession.attacker_away;
            [players,ball] = possession(8,players, ball);
        end
       

    elseif coin > 0.5
        if kickoff <=0.5
            x_attacker_home = (xlimit_outer/2)-centrecircle_dia;
            y_attacker_home = ylimit_outer/2;

            x_attacker_away = (xlimit_outer/2)+ball_radius+ball_threshold+2*robot_radius;
            y_attacker_away = ylimit_outer/2;

            flag = ballposession.attacker_away;
            [players,ball] = possession(8,players, ball);

        elseif kickoff >0.5
            x_attacker_home =  (xlimit_outer/2)-ball_radius-ball_threshold-2*robot_radius;
            y_attacker_home = ylimit_outer/2;

            x_attacker_away = (xlimit_outer/2)+centrecircle_dia;
            y_attacker_away = ylimit_outer/2;

            flag = ballposession.attacker_home;
            [players,ball] = possession(4,players, ball);
        end
        
    end