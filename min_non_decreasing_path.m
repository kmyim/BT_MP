clc
clear
%% game 1: find paths where min payoff of individuals is non-decreasing
% simulate 3 agents, each with 2 actions
N = 3;
n_a = 2; %number of actions available to each agent
S = n_a^N; % total number of actions/states in the system
C = 100; % range of payoff; small C, more likely for agents to have the same payoff values
rng(0);
U = uint8(ceil(rand(S, N)*C)); %check correlation! 
% first index: i \in I set of agents
% subsequent indices: (a_1, a_2, a_3);


M = min(U, [], 2);
A = zeros(S,S);
for i=1:1:S-1
    for j= i+1:1:S
        if M(j) >= M(i)
            A(i,j) = M(j) - M(i) + 1;
        end
        if M(j) <= M(i)
            A(j,i) = M(i) - M(j) + 1;
        end
    end
end

%imshow(A);
G = digraph(A);

hold on
plot(G);
axis off
hold off

Abin = A ~= 0;
indegree = sum(Abin, 1);
outdegree = sum(Abin, 2);