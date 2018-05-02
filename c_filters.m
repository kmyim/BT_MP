%% coalition filtration
% given adjacency matrix, find paths to global minimum per coalition
% assume n_a = 2 (2 actions available to agents) 
% default is N = 3;


%% Single agent
Agents1 = zeros(S, S, N);
for i = 1:N
    Agents1(:,:,i) = OneMoveBinary(N, i);
end

%% Two agents
perm = uint8(N*(N-1)/2);
Agents2 = zeros(S,S, perm);
counter = 1;
for i = 1:N-1
    for j= i+1:N
        Agents2(:,:,counter) = OneMoveBinary(N,i)*OneMoveBinary(N,j) + OneMoveBinary(N,i) + OneMoveBinary(N,j);
        counter = counter+1;
    end
end
