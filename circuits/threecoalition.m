%% three-coalitions

c = 4;% four choose three = 4 coalitions
s = 16; %16 states
%for each coalition, filter U to select relevant actions
%get payoff for each agent by multiplying kron([0,1], etc.)

O = ones(s,s);
N = ones(s,s,c); %neighbourhood of agent states
E = ones(c, s,s,4); %payoff for each agent, when move from state i to j, restricted by coalition
C = zeros(s, s, c); %coalition operators

% find neighbourhood of coalition states, subtracting off states that are
% not in the coalition

for i = 1:4
    N(:,:,i) = O - OneMoveBinary(4,i);
end
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
