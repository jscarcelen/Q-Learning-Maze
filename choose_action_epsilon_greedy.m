function ns = choose_action_epsilon_greedy(nps,cs,q,epsilon,Iteration,maxIter)

x = rand; % uniform distribution [0,1] 
if x < 1 - epsilon/2 && x > epsilon/2 && Iteration > round(maxIter/3) % exploit                          
    nps_linear_index_q_matrix = zeros(1,length(nps)); % nps linear index array initialization
    for j=1:length(nps)
        nps_linear_index_q_matrix(j) = sub2ind(size(q),cs,nps(j)); % Choose action with max_q
    end
    [~,ns_local_index] = max(q(nps_linear_index_q_matrix));
    ns = nps(ns_local_index);
else % explore
    ns = nps(randi([1 length(nps)],1,1));              
end