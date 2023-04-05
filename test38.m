flag_gamestart = gamestate.start;
 
variables;
%initial players
%initialparams;
plotSoccerField;

% initial plyaers
nPlayers=8;
%teamofplayers = [zeros(nPlayers/2,1); ones(nPlayers/2,1)];
%players = {zeros(nPlayers,2),zeros(nPlayers,2),teamofplayers};
Rpossession=zeros(8,1);
players = {zeros(nPlayers,2),zeros(nPlayers,2),Rpossession};

%speed and angle
players{2}(:,1)=0;
players{2}(1:nPlayers/2,2)=0;
players{2}(nPlayers/2+1:nPlayers,2)=pi;

%initial position ball

x_ball_init = xlimit_outer/2;
y_ball_init = ylimit_outer/2;

%ball simulation
% if ball is free, ball_flag=0
% if ball is hold, ball_flag=1
ball_flag=0; %initial the ball is free
%intial ball position
ball_x=x_ball_init-5;
ball_y=y_ball_init-5;
%skye
VelBall = [0;0];
AccBall = [0;0];
PositionBall = [ball_x;ball_y];
ball = InitializeBall(PositionBall, VelBall, AccBall);

initialparams;
%ballposition(x_ball_init,y_ball_init,ball_radius);

%positions
players{1}(1:nPlayers/2,:)=robot_home_pos(:,1:2);
players{1}(nPlayers/2+1:nPlayers,:)=robot_away_pos(:,1:2);

% robotposition(robot_home_pos,'r',robot_radius);
% robotposition(robot_away_pos,'b',robot_radius);
plotplayers(players,robot_radius)

if flag_ballposession == ballposession.attacker_home 
        goal_x = x_gk_away_init;
        goal_y = goal_point1 + (goal_point2-goal_point1)*randi(1,1);
        rx = robot_home_pos(4,1);
        ry = robot_home_pos(4,2);
        col = 'r';
        [players,~] = possession(4,players, ball);
       
elseif flag_ballposession == ballposession.attacker_away

        goal_x = x_gk_home_init;
        goal_y = goal_point1 + (goal_point2-goal_point1)*randi(1,1);
        rx = robot_away_pos(4,1);
        ry = robot_away_pos(4,2);
        col = 'b';
        [players,~] = possession(8,players, ball);
        
end


rv=0;
phi=pi/4;




% Timesteps of the simulation in seconds
timeSteps = 450;
% Time between drawing of each plot
timeSync = 0.1;

% Whit these settings one simulation will take 54 seconds
time=0;
%pause(15)

ballposition(ball_x,ball_y,ball_radius);

while time < timeSteps
    [players,ball]=Update1(players,ball);
    %[players,ball] = robotbehaviour(players,ball);
    %plot
    plotSoccerField;
    

    plotplayers(players,robot_radius);%plot players
    ballposition(ball(1,1),ball(1,2),ball_radius);%plot ball
    time=time+1;
    pause(timeSync);
    
end
plotSoccerField;
