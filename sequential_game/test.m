%% seqential, symmetric game
N = 6; %number of agents
T = 6; %sequence length
Size = zeros(N,T);
for i=1:N
    for j=1:T
        Size(i,j) = treesize(i,j);
    end
end

