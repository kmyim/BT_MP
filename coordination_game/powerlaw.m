function [p] = powerlaw(x,params)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

N = params(1); beta = params(2); p0 = params(3);
z = 1:1:N;

Norm = (1-p0)/sum(z.^beta);
p = zeros(1,length(x));
p(x==0) = p0;
p(x~=0) = Norm* x(x~=0).^beta;
       
end

