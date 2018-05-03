N = 4; %4 agents
n = 2; % 2 states available to agents
s = n^N;
combinations = zeros(N,1);
for k=1:N
    combinations(k) = nchoosek(N,k);
end
nc =  sum(combinations);
C = zeros(s, s,nc);

neighs =  coalition_neighbourhood(N);

counter = 1;
for k=1:N %loop over coalition size
    E = ones(combinations(k), s,s, N);%payoff for each agent, when move from state i to j, restricted by coalition
    NEIGH = neighs(:,:,co_neigh_index(N,k)); %neighbourhoods of k-coalitions

    for j = 1:combinations(k) %loop over all coalitions of size k
        
        %find payoffs of coalition moves for each agent
        for i = 1:N %loop over agents
            E(j, :,:, i) = NEIGH(:,:,j).*(ones(s,1)*U(i,:));
        end
        
        C(:,:, counter)= min(E(j, :, :, :), [], 4); 
        C(:,:, counter) = (C(:,:,counter)) == max(C(:,:,counter), [], 2);
        counter = counter +1;
    end
end