function [S] = g_gauss_ER(q, z, r)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
S = 0;
for k =0:1:50
    prefactor = pdf('Poisson',k,z)*k/z;
    s = 0;
    for m=0:1:k-1
        s = s+ pdf('Binomial',m,k-1, q)* normcdf(m/k,r,0.2);
    end
    S = S + s*prefactor;
end

end

