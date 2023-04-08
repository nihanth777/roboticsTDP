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
timeSteps = 450;
% Time between drawing of each plot
timeSync = 0.1;

% Whit these settings one simulation will take 54 seconds
time=0;
%pause(15)

ballposition(ball_x,ball_y,ball_radius);
[~,~,~,~,~,players] = plotplayers(players,robot_radius);


while time < timeSteps
    [players,ball]=Update1(players,ball);
    %plot
    plotSoccerField;
    [~,~,~,~,~,players] = plotplayers(players,robot_radius);%plot players
    ballposition(ball(1,1),ball(1,2),ball_radius);%plot ball
    time=time+1;
    pause(timeSync);
end
plotSoccerField;
