% Initialization script for Soccer Simulation example
% Copyright 2019 The MathWorks, Inc.

%% Load bus data types
clear
load soccerBusTypes;
variables;


%% Soccer field parameters
% X and Y limits for the field

fieldLimitsX = [0 xlimit_outer];
fieldLimitsY = [0 ylimit_outer];

% Define the field as an Occupancy Map
map = robotics.OccupancyGrid(zeros(fieldLimitsY(2),fieldLimitsX(2)));

% Goal Post Parameters (X, Y, Object Index)
goalPosts = [ 1 2.5 2; 
              1 5.5 2; 
              10 2.5 3; 
              10 5.5 3];


fieldCenter = [mean(fieldLimitsX) mean(fieldLimitsY)];
homeGoalPosition = [fieldLimitsX(1) mean(fieldLimitsY)];
awayGoalPosition = [fieldLimitsX(2) mean(fieldLimitsY)];

%% Simulation Parameters
sampleTime = 0.1;

% Robot definitions and dimensions
numRobots = 6;
robotRadius = 0.2;
wheelRadius = 0.1;
robotColors = [1 0 0;0 0 1;1 0 0;0 0 1;1 0 0;0 0 1];

% Initial Robot poses (X, Y, Theta)
initialPoses = [1.1 3.5 0;
                8.9 3.5 pi;
                3 2 0;
                7 2 pi; 
                4 2 0;
                5 2 pi];

% Initial Ball Position
initBallPos = fieldCenter;

% Initial Game State
initGameState = struct('possession',0, ...
                       'state',GameState.InPlay, ...
                       'score',[0;0]);
                   
% Ball kicking noise (multiplying factor for 'randn' function)
ballVelNoise = 0.1;
ballAngleNoise = pi/24;

ballThresh = robotRadius + 0.1; % Distance to grab the ball
ballCarryFactor = 0.2;          % Speed penalty when carrying the ball
outOfBoundsDist = 1;            % Distance to place ball back in bounds

% Randomize initial conditions
randomizeStartingPositions;

%% Object Detector and Robot Detector sensor parameters
objDetectorOffset = [0 0];
objDetectorAngle = 0;
objDetectorFOV = pi/3;
objDetectorRange = 2;
objColors = [0 0.75 0; 1 0 0; 0 0 1];
objMarkers = 'o^^';
objDetectorMaxHits = 5;

robotDetectorOffset = [0 0];
robotDetectorAngle = 0;
robotDetectorFOV = pi;
robotDetectorRange = 2;
robotDetectorMaxHits = 5;

%% Behavior Logic Parameters
% General parameters
distThresh = 1;         % Threshold distance to track points [m]
angThresh = pi/16;      % Threshold angle to track rotation [rad]
goalThresh = 3;        % Threshold distance from the goal to kick ball [m]

% Attacker parameters
attackerKickSpeed = 1;              % Kick speed for attacking
attackerMinGoalDist = 2;            % Distance before taking the ball away from goal and try kick again
attackerMaxGoalDist = 6;           % Distance away from goal to travel before kicking again
dribbleTime = 25;                   % Max time before kicking the ball while dribbling
dribbleKickSpeed = 0.5;               % Kick speed for dribbling

% Defender parameters
defenderHomePoses = [xlimit_outer/4 ylimit_outer/4 0;
                     3*xlimit_outer/4 3*ylimit_outer/4 0]';   % Defender poses for home team
defenderAwayPoses = [72 28.5 pi;
                     72 18.5 pi]';  % Defender poses for away team
defenderKickSpeed = 1;              % Kick speed for defending

% Goalkeeper parameters
goalkeeperPoses = [ 2 23.5 0;
                   90 23.5 pi]';    % Goalkeeper poses for home and away teams
goalkeeperKickSpeed = 10;           % Kick speed for goalkeeping
