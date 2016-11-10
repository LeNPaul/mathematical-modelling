t = 6;
r = 1.6;
a = 2;
tau = 0.01;

x=0:tau:t;
xt = [];
X1t = [];
X2t = [];

d01 = a;
d02 = a;

for i=0:tau:t
    exact = exp(r*i) + a;
    xt = [xt exact];
    discrete1 = d01/(1 - r*tau);
    discrete2 = d02/(1 - r*tau*0.1);
    X1t = [X1t discrete1];
    X2t = [X2t discrete2];
    d01 = discrete1;
    d02 = discrete2;
end;

hold on;

plot(x, xt, 'r');
plot(x, X1t, 'b');
plot(x, X2t, 'm');

xlabel('Time');

legend('Exact (0.01)','Discretized (0.01)','Discretized (0.001)')