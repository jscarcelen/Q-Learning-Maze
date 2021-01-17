function [reward,total_states] = build_reward_matrix(maze)

% Matrix so that each row corresponds to an state S and each column the
% possible states S' depending on possible actions.

% Possible actions are:
% 
% Up              :  (i-n)
% Down            :  (i+n)
% Left            :  (i-1)
% Right           :  (i+1)
% Diagonally SE   :  (i+n+1)
% Diagonally SW   :  (i+n-1)
% Diagonally NE   :  (i-n+1)
% Diagonally NW   :  (i-n-1)

% Being in state i (row), can I go to state j (column)? If so, reward is -1. If not, reward is -inf.

[n,~] = size(maze);
reward = zeros(n*n); % Initialize matrix
total_states = numel(maze); % each cell of the maze is an state

for i=1:total_states
    reward(i,:) = reshape(maze,1,total_states); 
end

%% ACTIONS:

% N: j = i - 1
% S: j = i + 1
% E: j = i + n
% W: j = i - n
% NE: j = i + n - 1
% NW: j = i - n - 1
% SE: j = i + n + 1
% SW: j = i - n + 1

%% Build reward matrix

% Other than possible actions have - inf
% If possible action, reward is such of maze matriz (-50 if wall, 1 if possible) 

for i=1:total_states
    for j=1:total_states
        if j~=i-n  && j~=i+n  && j~=i-1 && j~=i+1 && j~=i+n+1 && j~=i+n-1 && j~=i-n+1 && j~=i-n-1
            reward(i,j) = -inf;
        end    
    end
end

% Unabling going S, SE, SW for bottom border positions 
for i= n:n:total_states % n,2n,3n,4n... % current state bottom
    for j= 1:total_states % next state
        if j==i+n+1 || j==i+1 || j==i-n+1
            reward(i,j) = -Inf;
            
        end
    end
end

% Unabling going N, NE, NW for top border positions 
for i= 1:n:total_states % 1,n+1,2n+1,3n+1... % current state top
    for j= 1:total_states % next state 
        if j==i+n-1 || j==i-1 || j==i-n-1
            reward(i,j)=-Inf;
           
        end
    end
end