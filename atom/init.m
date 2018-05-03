%% 2D Helium
% 4 electrons orbiting two nuclei
% grid 
GridDict = zeros(20,2);
GridDict(:,1)= [-1.5:1:1.5, -2.5:1:2.5, -2.5:1:2.5, -1.5:1:1.5].';
GridDict(:,2) = [1.5* ones(1,4), 0.5*ones(1,6), -0.5*ones(1,6) , -1.5*ones(1,4)];

A = 15*17*19;
U = zeros(A, 5);
PermDict = zeros(A,4);
counter = 1;
for i = 1:17
    for j = i+1:18
        for k = j+1:19
            for l = k+1:20
                U(counter, :) = stability(GridDict([i, j, k, l], :));
                PermDict(counter, :) = [i,j,k,l];
                counter = counter+1;
            end
        end
    end
end
    