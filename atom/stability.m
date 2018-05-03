function [H] = stability(x)
%computes stability (negative energy) of individual electrons and total config
%  x = atoms * (x,y) coordinates array
s = size(x);
epsilon = 0.001;
a = [-1,0]; b = [1,0];

%electron-electron repulsion
interaction = zeros(s(1), s(1)); 

for i = 1:(s(1)-1)
    for j = i+1:s(1)
        interaction(i,j) = -1/(norm(x(i,:) - x(j,:)) + epsilon);
    end
end

H_tot = sum(sum(interaction));

%electron-nuclei attraction
for i=1:s(1)
    interaction(i,i) = (1/norm(x(i,:) - a) + 1/norm(x(i,:) - b));
end
interaction = interaction + interaction.';

Hx = sum(interaction);
H_tot = H_tot + sum(diag(interaction));
H = [Hx, H_tot];
end

