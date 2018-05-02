%% 2-Coalition paths
Aco2 = zeros(S, S, perm);
p = 1;
holder = zeros(S, S, 2);

for i=1:perm-1
    holder(:,:,1) = (Agents2(:,:,p) + eye(S)).* kron(ones(S,1), U(:,i).');
    for j=i+1:perm 
        holder(:,:,2) = (Agents2(:,:,p) + eye(S)).* kron(ones(S,1), U(:,j).'); 
        Aco2(:,:,p)  = min(holder, [], 3);
        Aco2(:,:,p) = Aco2(:,:,p) == max(Aco2(:,:,p),[],2);
        p = p+1;
    end
end