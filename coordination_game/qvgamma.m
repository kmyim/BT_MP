N = 100;
x = 0:1:N;
g = 0:0.001:1;
q = zeros(length(g), 1);
%S = zeros(length(g), 1);

s0= 0.3;
colours = ['r', 'b', 'c', 'm', 'k'];
j=1;
for beta = -2:-0.5:-4

sparams = [N, beta, s0];

for i = 1:1:length(g)
    [q(i), ~] = q_func(g(i),N, @powerlaw, sparams);
end

%p = powerlaw(x,sparams);
%qcrit = 1-1/(p*x.');
plot(q, g, colours(j), 'DisplayName',num2str(beta));
hold on

j= j+1;
end

ylabel('gamma');
xlabel('q');
title('gamma vs q');
legend('show')

%plot(qcrit*ones(101,1), 0:0.01:1, 'r-');

hold off