flag_gamestart = gamestate.start;

variables;
%initial players

plotSoccerField;

Rpossession=zeros(8,1);
players = {zeros(nPlayers,2),zeros(nPlayers,2),Rpossession,zeros(8,2)};

%speed and angle
players{2}(:,1)=0;
players{2}(1:nPlayers/2,2)=0;
players{2}(nPlayers/2+1:nPlayers,2)=pi;

score_home = 0; 
score_away = 0;


rv=0;
phi=pi/4;



%initial position ball

x_ball_init = xlimit_outer/2;
y_ball_init = ylimit_outer/2;


%ball simulation
% if ball is free, ball_flag=0
% if ball is hold, ball_flag=1
ball_flag=0; %initial the ball is free
%intial ball position
ball_x=x_ball_init;
ball_y=y_ball_init;
%skye
VelBall = [0;0];
AccBall = [0;0];
PositionBall = [ball_x;ball_y];
ball = InitializeBall(PositionBall, VelBall, AccBall);

[players,gamestate_flag,ball_posess_flag] = initialparams(players);

[players,~] = possession(ball_posess_flag,players,ball);

players{3}(4)
players{3}(8)

% Timesteps of the simulation in seconds
timeSteps = 4500;
% Time between drawing of each plot
timeSync = 0.1;

% Whit these settings one simulation will take 54 seconds
time=0;

initialplayers=players;

while time < timeSteps
    [players,ball]=Update1(players,ball);
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
        players=initialplayers;

    end
    % mark score
    [score_home, score_away] = goalscore(ball, score_home, score_away);

    time=time+1;
    pause(timeSync);
end

plotSoccerField;
