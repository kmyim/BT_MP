figure
hold on
for i=1:4
    plot(U(i, :))
    
end
plot(UC, 'o');


title('Power output of light bulbs vs configuration')

hold off

figure
U_agent_order = sort(U);
hold on
for i=1:4
    
    plot(U_agent_order(i, :))
end
hold off


