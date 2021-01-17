function plot_maze_comparison(maze,pmat,start_state,end_state,wall_value,base_value,start_value,end_value,path_value)

[n,~] = size(maze);

%% Main colors
% 'black'   [0,0,0]
% 'white'   [1,1,1]
% 'magenta' [1,0,1]
% 'cyan'    [0,1,1]
% 'red'     [1,0,0]
% 'blue'    [0,0,1]

%% Convert linear index to match text function on imagesc
[y_start_state,x_start_state] = ind2sub([n,n],start_state);
[y_end_state,x_end_state] = ind2sub([n,n],end_state);

%% Reassign 1,2,3... values to maze and pmat
% Required step for plotting the maze with our desired color-scale
for i = 1:n
    for j = 1:n        
        if maze(i,j) == wall_value % Black
            maze(i,j) = 1;            
        elseif maze(i,j) == base_value % White
            maze(i,j) = 2;            
        elseif maze(i,j) == start_value % Red
            maze(i,j) = 3;
        elseif maze(i,j) == end_value % Red
            maze(i,j) = 3;
        end        
        if pmat(i,j) == path_value % Magenta
            pmat(i,j) = 4;
        end
    end
end
% Colormaps for each maze plot
cmap_initial = [[0,0,0];[1,1,1];[1,0,0]];
cmap_solved = [[0,0,0];[1,1,1];[1,0,0];[1,0,1]];

%% Initial maze
figure(1)
clf
p1 = subplot(1,2,1);
imagesc(maze);

% Colormap
colormap(p1,cmap_initial)

% Start and End text 
text(x_start_state,y_start_state,'START','HorizontalAlignment','center','Color','b')
text(x_end_state,y_end_state,'END','HorizontalAlignment','center','Color','b')

% Design of wall cells (Add white X symbol)
for i=1:n
    for j=1:n
        if maze(i,j) == 1 % wall_value
            text(j,i,'X','HorizontalAlignment','center','Color','w') % text(x = columns = j, y = row = i,...)
        end
    end
end

% Subplot title and other requirements
title('Maze')
axis off


%% Solved maze
% Build solved maze matrix for plotting overwriting optimal path cells pmat(i,j) onto the basic maze matrix
maze_solved = maze;
for i=1:n
    for j=1:n
        if pmat(i,j) ~= 0 % 0 is empty cell pmat_matrix
            maze_solved(i,j) = pmat(i,j);
        end
        
    end
end

% Recover color of start and end cells
maze_solved(start_state) = maze(start_state);
maze_solved(end_state) = maze(end_state);

% Plotting solved maze
p2 = subplot(1,2,2);
imagesc(maze_solved)

% Colormap
colormap(p2,cmap_solved) 

% Start and End text 
text(x_start_state,y_start_state,'START','HorizontalAlignment','center','Color','b')
text(x_end_state,y_end_state,'END','HorizontalAlignment','center','Color','b')

% Design of wall and solved path cells (Add white X and * symbols)
for i=1:n
    for j=1:n
        if maze_solved(i,j) == 1 % wall_value
            text(j,i,'X','HorizontalAlignment','center','Color','w')
        elseif maze_solved(i,j) == 4 % path color
            text(j,i,'*','HorizontalAlignment','center','Color','w')
        end
    end
end

% Subplot title and other requirements
title('Solved Maze')
axis off


