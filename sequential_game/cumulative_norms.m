x = 0:0.01:5;
test1000 = normpdf(x).*(normcdf(x).^999)*1000;

test10000 = normpdf(x).*(normcdf(x).^9999)*10000;

hold on
plot(x, test1000);
plot(x,test10000);
hold off

