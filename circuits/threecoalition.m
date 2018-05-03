%% three-coalitions

c = 4;% four choose three = 4 coalitions
s = 16; %16 states
%for each coalition, filter U to select relevant actions
%get payoff for each agent by multiplying kron([0,1], etc.)

O = ones(s,s);
E = ones(c, s,s,4); %payoff for each agent, when move from state i to j, restricted by coalition
C = zeros(s, s, c); %coalition operators

% neighbourhood sets

neighs =  coalition_neighbourhood(4);
N = neighs(:,:,co_neigh_index(4,3));
%(though symmetric, starting state in rows, end state in columns)

%find payoffs of coalition moves for each agent
for k = 1:4 %loop over coalition
    for i = 1:4 %loop over agents
        E(k, :,:, i) = N(:,:,k).*(ones(s,1)*U(i,:));
    end
end

for k=1:4
    %for each coalition, the payoff of moving from state i to j taken to be
    %minimum payoff of coalitions of agents
    C(:,:,k) = min(E(k, :, :, :), [], 4); 
    % path is maximum over end states
    C(:,:,k) = C(:,:,k) == max(C(:,:,k), [], 2);
end
