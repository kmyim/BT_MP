[~,I] = sort(UC); %rank according to Co-Op value
hold on
for i=1:4
    plot(U(i, I))
    
end
plot(UC(I), 'o');
hold off

title('Power output of light bulbs vs configuration')

