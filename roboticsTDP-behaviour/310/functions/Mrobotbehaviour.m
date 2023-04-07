function [players, ball] = Mrobotbehaviour(players,ball,index)
%variables;
ball_posession1 = players{3}(index);

%team A
[x1,y1,bx,by,~] = playerPosition(1,players,ball);
[x2,y2,bx,by,~] = playerPosition(2,players,ball);
[x3,y3,bx,by,~] = playerPosition(3,players,ball);
[x4,y4,bx,by,~] = playerPosition(4,players,ball);
%team B
[x5,y5,bx,by,~] = playerPosition(5,players,ball);
[x6,y6,bx,by,~] = playerPosition(6,players,ball);
[x7,y7,bx,by,~] = playerPosition(7,players,ball);
[x8,y8,bx,by,~] = playerPosition(8,players,ball);        
 

px = [x1; x2; x3; x4; x5; x6; x7; x8];
py = [y1; y2; y3; y4; y5; y6; y7; y8];
ball_pos = [bx; by];


% Initialize game parameters
max_steps = 1000;   % maximum number of game steps
gamma = 0.9;        % discount factor
alpha = 0.5;        % learning rate
epsilon = 0.1;      % exploration probability
num_actions = 9;    % number of possible actions
num_states = 18;    % number of possible states

% Initialize Q table
Q = zeros(num_states, num_actions);

% Initialize state variables
player_pos = [px; py];   % player positions
ball_pos = [bx; by];     % ball position

% Define function to compute state index from player and ball positions
compute_state = @(player_pos, ball_pos) sub2ind([size(field), 2], player_pos(1,:), player_pos(2,:), (ball_pos(1)~=player_pos(1,:) | ball_pos(2)~=player_pos(2,:))+1);
% Define goal state
goal_pos = [0;0];
state = compute_state(player_pos, ball_pos);



% Run game loop
for step = 1:max_steps
    % Choose action based on epsilon-greedy policy
    if rand < epsilon
        % Choose random action
        action = randi(num_actions);
    else
        % Choose action with highest Q-value
        [~, action] = max(Q(state, :));
    end
    
    % Update state based on action
    switch action
        case 1  % move player 1 up
            player_pos(1, 1) = max(player_pos(1, 1)-1, 1);
        case 2  % move player 1 down
            player_pos(1, 1) = min(player_pos(1, 1)+1, size(field, 1));
        case 3  % move player 1 left
            player_pos(2, 1) = max(player_pos(2, 1)-1, 1);
        case 4  % move player 1 right
            player_pos(2, 1) = min(player_pos(2, 1)+1, size(field, 2));
        case 5  % move player 2 up
            player_pos(1, 2) = max(player_pos(1, 2)-1, 1);
        case 6  % move player 2 down
            player_pos(1, 2) = min(player_pos(1, 2)+1, size(field, 1));
        case 7  % move player 2 left
            player_pos(2, 2) = max(player_pos(2, 2)-1, 1);
        case 8  % move player 2 right
            player_pos(2, 2) = min(player_pos(2, 2)+1, size(field, 2));
        case 9  % kick ball
            % Compute distance to goal
            dist_to_goal = norm(ball_pos - goal_pos);
            
            % Move ball towards goal
            ball_pos = move_ball(ball_pos, goal_pos);
            
            % Compute new distance to goal
            new_dist_to_goal = norm(ball_pos - goal_pos);
            
            % Reward function: +1 for scoring goal, -1 for losing ball
            if new_dist_to_goal < dist_to_goal
                % Scored goal!
                reward = 1;
                done = true;
            else
                % Lost ball
                reward = -1;
                done = false;
            end
    end
    
    % Update Q-value based on new state and reward
    new_state = compute_state(player_pos, ball_pos);
    Q(state, action) = Q(state, action) + alpha * (reward + gamma * max(Q(new_state, :)) - Q(state, action));
    
    % Update state variable
    state = new_state;
    
    % Check if game is over
    if done
        break
    end
end


end