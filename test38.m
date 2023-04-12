flag_gamestart = gamestate.start;
 
variables;
%initial players
initialparams;
plotSoccerField;

% initial plyaers
nPlayers=8;
Rpossession=zeros(8,1);
players = {zeros(nPlayers,2),zeros(nPlayers,2),Rpossession};
%positions
players{1}(1:nPlayers/2,:)=robot_home_pos(:,1:2);
players{1}(nPlayers/2+1:nPlayers,:)=robot_away_pos(:,1:2);
%speed and angle
players{2}(:,1)=0;
players{2}(1:nPlayers/2,2)=0;
players{2}(nPlayers/2+1:nPlayers,2)=pi;

initialplayers=players;
%ballposition(x_ball_init,y_ball_init,ball_radius);

plotplayers(players,robot_radius)

if flag_ballposession == ballposession.player4 
        goal_x = x_gk_away_init;
        goal_y = goal_point1 + (goal_point2-goal_point1)*randi(1,1);
        rx = robot_home_pos(4,1);
        ry = robot_home_pos(4,2);
        col = 'r';
       
elseif flag_ballposession == ballposession.player8

        goal_x = x_gk_home_init;
        goal_y = goal_point1 + (goal_point2-goal_point1)*randi(1,1);
        rx = robot_away_pos(4,1);
        ry = robot_away_pos(4,2);
        col = 'b';
        
end


rv=0;
phi=pi/4;


ball_flag=0; %initial the ball is free
%intial ball position
ball_x=x_ball_init-15;
ball_y=y_ball_init-15;
%skye
VelBall = [0;0];
AccBall = [0;0];
PositionBall = [ball_x;ball_y];
ball = InitializeBall(PositionBall, VelBall, AccBall);

% Timesteps of the simulation in seconds
timeSteps = 4500;
% Time between drawing of each plot
timeSync = 0.1;

% Whit these settings one simulation will take 54 seconds
time=0;
%pause(15)

ballposition(ball_x,ball_y,ball_radius);

plotSoccerField;



while time < timeSteps
    [players,ball]=Update1(players,ball);
    %plotSoccerField;
    if time~=0
        delete(p1);
        delete(p2);
        delete(p3);
        delete(p4);
    end 

    [p1,p2,p3]=plotplayers(players,robot_radius);%plot players

    p4=ballposition(ball(1,1),ball(1,2),ball_radius);%plot ball

    % controller. check boundary and mark score
    % check the boundary
    
    check_bound = checkOutOfBounds(ball);
    if check_bound == true
        ball = InitializeBall(PositionBall, VelBall, AccBall);
        %[players,~,~] = initialparams(players);
        players=initialplayers;

    end


    time=time+1;
    pause(timeSync);
end
flag_gamestart = gamestate.outofplay;
plotSoccerField;

