%% Maxmimise power output problem

%Rmap = [1.2, 1.6; 1.3, 1.7; 1.1, 1.5; 1.3, 1.5].';
%Rmap = [1.2, 1.6; 1.3, 1.7; 1.2, 1.6; 1.3, 1.7].';
%Rmap = [1.2, 1.6; 1.2, 1.6; 1.2, 1.6; 1.2, 1.6].';
Rmap = sqrt(2)*ones(2,4) + 0.2*randn(2,4);


U = zeros(16,4);
A = zeros(16,4);
counter = 1;
for i=1:2
    for j= 1:2
        for k=1:2
            for l=1:2
                A(counter, :) = [i,j,k,l];
                U(counter, :) = [Rmap(i,1),Rmap(j,2),Rmap(k,3),Rmap(l,4)];
                U(counter, :) = U(counter,:)/(sum(U(counter,:))^2);
                counter = counter +1;   
            end
        end
    end
end
    
U = U.'*100;

%row agents; columns states


%collective utility
UC = min(U, [], 1);
%maxmin solution: for every state, min over agents, then
[~, state_maxmin]= max(UC);

Unorm = (U - min(min(U)))/(max(max(U))- min(min(U)));