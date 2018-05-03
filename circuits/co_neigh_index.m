function [v] = co_neigh_index(N,k)
%index of k-coalition neighbourhood matrices  of N agents

v = sum(2.^combnk(0:N-1, k), 2) + 1;
v = sort(v);
end

