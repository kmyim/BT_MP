function [holder] = coalition_neighbourhood(N)
%% Collection of Coalition Moves
% Given N agents with two options, compute neighbourhood of 2^N-1 possible coalition of
% agents in state space 2^N

%matlab dies for N=10 or above

s = ones(2,2);
e = eye(2,2);
S = 2^N; %2^N coalitions, 2^N states
holder = zeros(S,S,S);

if N == 1
    holder(:,:,1) = e;
    holder(:,:,2) = s;
    
elseif N > 1
    for i = 1:S/2
        C = coalition_neighbourhood(N-1);
        holder(:,:,i) = kron(e, C(:,:,i)); 
        holder(:,:,S/2+i)= kron(s, C(:,:,i));
    end
end

end

