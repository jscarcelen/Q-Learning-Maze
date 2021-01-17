 function [path,pmat,path_value] = solve_maze(maze,q,start_state,end_state)

% Initialize varibales

%% Iterating until total_states is reached
% Initialize variables
next_state = 0;
path = zeros(size(q(1,:)));
path(1) = start_state;
current_state = start_state;
i = 2;

% Find optimal path
while(next_state ~= end_state)
    % Determine state after next_state (maximum q)
    [~,next_state] = max(q(current_state,:));

    % Deleting chances of getting stuck in small loops  (up to order of 4)  
    if ismember(next_state,path(1:i)) % if data in next_state is found in path (meaning it has already gone through that cell)
        [~,x] = sort(q(current_state,:),'descend'); % x is an index vector after sorting the vector in descend order
        next_state = x(2); % Choose action with 2nd largest q (q(x(1)) = max(q), so we choose the 2nd maximum value

        if ismember(next_state,path(1:i))
            [~,x] = sort(q(current_state,:),'descend');
            next_state = x(3); % Choose action with 3rd largest q

            if ismember(next_state,path(1:i))
                [~,x] = sort(q(current_state,:),'descend');
                next_state = x(4); % Choose action with 4th largest q

                if ismember(next_state,path(1:i))
                    [~,x] = sort(q(current_state,:),'descend');
                    next_state = x(5); % Choose action with 5th largest q
                end
            end
        end
    end

    % Adding next action/next_state to the path
    path(i) = next_state; 

    % Updating current_state
    current_state = next_state; 
    i = i + 1;
end
path = nonzeros(path); 
    
%% Solution of maze
sz = size(maze);
n = length(maze(1,:));
path_value = 50;

% reproducing path to matrix path (linear index to subindex)
pmat = zeros(n,n);
for i = 1:length(path)
    [row,col] = ind2sub(sz,path(i)); % watch out beacuse in this code all works transpose :(
    pmat(row,col) = path_value; % a given value
end

