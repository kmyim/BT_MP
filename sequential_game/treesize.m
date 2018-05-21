function [N] = treesize(M, T)
%Given M symmetric agents, how big is the unique tree of a sequential game
%of length T?
%   Detailed explanation goes here
if T == 1
    N = M;
elseif M == 1
    N = 1;
else
    N = treesize(M, T-1) + treesize(M-1, T);
end
end

