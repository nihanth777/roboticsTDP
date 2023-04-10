function [players, ball] = Copy_of_Mrobotbehaviour(players,ball,index)
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


function state_idx = get_state_index(px, py, ball_pos)
    % Define the state space discretization parameters
    n_bins = 10;
    bin_size = 2/n_bins;

    % Convert the continuous state space into a discrete state space
    px_bins = discretize(px, linspace(-1, 1, n_bins+1));
    py_bins = discretize(py, linspace(-1, 1, n_bins+1));
    ball_x_bin = discretize(ball_pos(1), linspace(-1, 1, n_bins+1));
    ball_y_bin = discretize(ball_pos(2), linspace(-1, 1, n_bins+1));

    % Calculate the state index based on the discretized state space
    state_idx = px_bins + (py_bins-1)*n_bins + ...
                (ball_x_bin-1)*n_bins^2 + (ball_y_bin-1)*n_bins^3;
end

function [new_px, new_py, new_bx, new_by] = update_positions(px, py, ball_pos, action, movements);

    % Define the maximum x and y positions of the players and the ball
    max_x = 1;
    max_y = 1;
    max_y = 0.6;

    % Update the positions of the players based on the selected action and movements
    %new_px = px + action * movements';
    %new_py = py + action * movements';

    % Make sure that the new positions of the players are within the boundaries
    new_px(new_px < 0) = 0;
    new_px(new_px > max_x) = max_x;
    new_py(new_py < 0) = 0;
    new_py(new_py > max_x) = max_x;

    % Update the position of the ball
    new_bx = ball_pos(1) + action;
    new_by = ball_pos(2);

    % Check if any player has collided with the ball and update the ball position accordingly
    for i = 1:numel(new_px)
        if abs(new_px(i) - new_bx) <= 0.05 && abs(new_py(i) - new_by) <= 0.05
            new_bx = ball_pos(1) + action * movements(i);
            new_by = ball_pos(2) + 0.1;
            break;
        end
    end

    % Make sure that the new position of the ball is within the boundaries
    new_bx(new_bx < 0) = 0;
    new_bx(new_bx > max_x) = max_x;
    new_by(new_by < 0) = 0;
    new_by(new_by > max_y) = max_y;
end


function movements = get_movements(state_idx, Q)
    % Get the Q-values for the current state
    state_Q = Q(state_idx, :);

    % Find the maximum Q-value and its indices
    [max_Q, max_indices] = max(state_Q);

    % Set all other Q-values to -Inf to exclude them from selection
    state_Q(state_Q ~= max_Q) = -Inf;

    % Get the indices of the selected Q-values
    selected_indices = find(state_Q == max_Q);

    % Convert the indices to actual movements
    movements = selected_indices - 5;
end


% Define the number of players and actions
n_players = 8;
n_actions = 4;

% Initialize the Q-value table with random values
Q = rand(n_actions^n_players, 1);

% Define the learning parameters
alpha = 0.1; % learning rate
gamma = 0.9; % discount factor
epsilon = 0.1; % exploration rate

% Define the reward function
function [reward, done] = get_reward(ball_pos)
    % Calculate the distance between the ball and the goal
    goal_pos = [0; 0];
    distance = norm(ball_pos - goal_pos);
    goal_size = 10

    % If the ball is in the goal, the episode is done and the reward is 1
    if distance < goal_size
        reward = 1;
        done = true;
    else
        reward = 0;
        done = false;
    end
end

% Define the plot function
function plot_positions(px, py, ball_pos)
    % Plot the positions of the players and the ball
    scatter(px, py, 'filled');
    hold on;
    scatter(ball_pos(1), ball_pos(2), 'filled', 'red');
    xlim([-1, 1]);
    ylim([-1, 1]);
    hold off;
end

% Run the Q-learning algorithm for a specified number of episodes
n_episodes = 100;
for episode = 1:n_episodes
    % Initialize the positions of the players and the ball
    px = rand(n_players, 1);
    py = rand(n_players, 1);
    ball_pos = rand(2, 1);

    % Convert the state into an index for the Q-value table
    state_idx = get_state_index(px, py, ball_pos);

    % Initialize the episode variables
    total_reward = 0;
    done = false;

    % Plot the positions of the players and the ball
    plot_positions(px, py, ball_pos);

    % Run the episode until the ball is scored or a maximum number of steps is reached
    max_steps = 100;
    step = 0;
    while ~done && step < max_steps
        % Choose an action based on the Q-value table and the exploration rate
        if rand < epsilon
            action = randi(n_actions^n_players);
        else
            [~, action] = max(Q(state_idx, :));
        end

        % Convert the action index into a set of player movements
        movements = get_movements(state_idx, Q);

        % Update the positions of the players and the ball based on the movements
     %   [px, py, ball_pos] = update_positions(px, py, ball_pos, movements);

        % Get the reward for the new state
        [reward, done] = get_reward(ball_pos);

        % Convert the new state into an index for the Q-value table
        new_state_idx = get_state_index(px, py, ball_pos);

        % Update the Q-value table using the Q-learning update rule
        Q(state_idx, action) = Q(state_idx, action) + alpha * (reward + gamma * max(Q(new_state_idx, :)) - Q(state_idx, action));

        % Update the episode variables
        total_reward = total_reward + reward;
        state_idx = new_state_idx;
        step = step + 1;

        % Plot the positions of the players and the ball
        plot_positions

    end
end



end