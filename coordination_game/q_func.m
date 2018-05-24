function [q, S] = q_func(g,N, s, sparams)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
x = 0:1:N;
S =(g.^x)*s(x, sparams).';
q = (g-S)./(1-S);
end

