clc, clear, home

%% INPUT PARAMETERS | BUILD SQUARE MAZE MATRIX 
% Square maze dimension
n = 25; % Variable

% Start position
start_state = [1,1]; % Variable 
start_state = sub2ind([n,n],start_state(1),start_state(2));

% End position
end_state = [n,n]; % Variable
end_state = sub2ind([n,n],end_state(1),end_state(2));

% Build maze matrix (comment if "Load_solvable_maze" is chosen)
[maze,wall_value,base_value,start_value,end_value] = build_maze(n,start_state,end_state);

%% Load solvable maze (comment if random maze generation is chosen) 
% load('maze_solvable_matrix_n_12.mat') % set n = 12 on Maze_mainScript.m
% [n,wall_value,base_value,start_value,end_value] = load_solvable_maze(maze);
% % Starting position
% maze(start_state) = start_value;
% % Ending position, goal
% maze(end_state) = end_value;

%% Build Reward Matrix according to possible actions
[reward,total_states] = build_reward_matrix(maze);

%% Q-Learning algorithm
    % Parameters
gamma = 0.9; % Importance of future rewards
alpha = 0.2; % Chosen from experience
maxIter = 200; % Maximum iterations
epsilon = 0.5; % Balance exploration and exploitation
    % Algorithm
[q] = Q_learning_algorithm(gamma,alpha,maxIter,start_state,end_state,wall_value,reward,epsilon);

%% Solving the maze
[path,pmat,path_value] = solve_maze(maze,q,start_state,end_state);

%% Plot results
plot_maze_comparison(maze,pmat,start_state,end_state,wall_value,base_value,start_value,end_value,path_value);
