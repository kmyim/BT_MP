clear 
clc
hold off
%% Maxmimise power output problem
N = 4; %4 agents
n = 2; % 2 states available to agents
s = n^N;

%% Here code only works for N=4, need fix!
%Rmap = [1.2, 1.6; 1.3, 1.7; 1.1, 1.5; 1.3, 1.5].';
%Rmap = [1.21, 1.59; 1.31, 1.69; 1.19, 1.61; 1.29, 1.71].';
%Rmap = [1.2, 1.6; 1.2, 1.6; 1.2, 1.6; 1.2, 1.6].';
Rmap = sqrt(2)*ones(2,4) + 0.1*randn(2,4);
%Rmap = 1*ones(2,4) + 0.1*randn(2,4);


U = zeros(s,N);
A = zeros(s,N);
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
[UC,I] = sort(UC); %rank according to Co-Op value
U = U(:,I);
Unorm = (U - min(min(U)))/(max(max(U))- min(min(U)));

payoffplot