%% game 1: find paths where min payoff of individuals is non-decreasing

M = min(U, [], 2);
A = zeros(S,S);
for i=1:1:S-1
    for j= i+1:1:S
        if M(j) >= M(i)
            A(i,j) = M(j) - M(i) ;
        end
        if M(j) <= M(i)
            A(j,i) = M(i) - M(j) ;
        end
    end
end

Abin = A ~= 0;
degree = sum(Abin,1).' + sum(Abin,2);

%imshow(A);
G = digraph(A);


hold on
plot(G);
axis off
hold off