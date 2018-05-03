function A = OneMoveBinary(N, k)
%adjacency matrix for undirected graph, showing states s' accessible by agent i on state s taking action 
% N = number of agents
%note most significant digit. 100 = {Agent1: 1, Agent2: 0, Agent3: 0},
% actual index = 5
if k <= N && k >= 1
    A1 = eye(2^(k-1));
    A2 = ~eye(2);
    A3 = eye(2^(N-k));
    A = kron(A1, A2);
    A = kron(A, A3);
else
    A = [];
end

