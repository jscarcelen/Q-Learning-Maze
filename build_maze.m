function [maze,wall_value,base_value,start_value,end_value] = build_maze(n,start_state,ending_state)

% n is size of the square maze

% Colors for general maze
wall_value = -500;
base_value = -1;
start_value = 0;
end_value = 100;

%% Generate random maze (comment this section if "Load solvable maze" is used)

% initialize maze matrix
maze = base_value.*ones(n); 

% Build maze walls
random = randi(n,round(6*n),2);
for i = 1:length(random(:,1))
    maze(random(i,1),random(i,2)) = wall_value;
end

%% Set start and enfding positions
% Starting position
maze(start_state) = start_value;

% Ending position, goal
maze(ending_state) = end_value;