function [n,wall_value,base_value,start_value,end_value] = load_solvable_maze(maze)
%% Dimension
[n,~] = size(maze);
%% Colors for general maze
wall_value = -50;
base_value = 1;
start_value = 0;
end_value = 10;