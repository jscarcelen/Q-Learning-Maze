function [q] = Q_learning_algorithm(gamma,alpha,maxIter,start_state,end_state,wall_value,reward,epsilon)

% Initialize q_matrix
q = randn(size(reward)); % Same matrix structure as reward matrix
q(:,end_state) = zeros(size(q(:,end_state))); % Terminal states show q = 0

%% 
% cs: current state
% ns: next state
% nps: next possible states

Iteration = 1; % Initialize counter

for i = 1:maxIter % Loop on agent's different attempt to solve the problem
    
    % Starting from start position    
    cs = start_state;
    
    % Repeat until total_states state is reached
    
    while(1) % Loop for ever until it reads order "break"
       
        % possible actions for the chosen state
        nps = find(reward(cs,:) > wall_value); % returns columns of reward matrix cells' with feasable action, thus, the set of new possible state nps

        % choose an action at random and set it as the next state
        ns = choose_action_epsilon_greedy(nps,cs,q,epsilon,Iteration,maxIter); % choose from nps set

        % find all the possible actions for the selected state
        nps_2 = find(reward(ns,:) > wall_value);

        % find the maximum q-value i.e, next state with best action
        max_q = 0;
        for j=1:length(nps_2)
            max_q = max(max_q,q(ns,nps_2(j)));
        end

        % Update q-values as per Bellman's equation
        % q(cs,ns)=reward(cs,ns)+gamma*max_q;
        q(cs,ns) = q(cs,ns) + alpha*(reward(cs,ns) + gamma*max_q - q(cs,ns));

        % Check whether the episode has completed i.e total_states has been reached
        if(cs == end_state)
            break;
        end

        % Set current state as next state
        cs=ns;
    end
    Iteration = Iteration + 1;
end