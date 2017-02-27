%
%   Question 1 part c):
%   Produce histogram of 10000 samples of random numer r^3
%

%   Define variables
n = 10000;
mu = -0.1;
sigma = 0.2;

x = 0:1:n;
y= [];

%Iterate through interation function
for i=1:n
    y = [y normrnd(mu,sigma)^3];
end;

%Plot
subplot(2,2,1)
hist(y,50);
    title([num2str(n) ' Samples of Random Variable r^3 (Q1 c))']);
    xlabel('');
    ylabel('');

mean = mean(y)
standard_deviation = std(y)


%
%   Question 1 part e):
%   Run trial of the model up to t=250
%

%   Define variables
t = 250;
N0 = 97;
mu = -0.1;
sigma = 0.2;

x = 0:1:t;
y = [];
y = [y N0];

%Iterate through interation function
for i=1:t
    R = (1 + normrnd(mu,sigma)^3) * N0;
    N0 = R;
    y = [y R];
end;

%Plot
subplot(2,2,2)
plot(x,y);
    title(['(Q1 e)) Trial to t = ' num2str(t)]);
    xlabel('Time');
    ylabel('Population');
    
%
%   Question 1 part f):
%   Run 10000 trials at t = 50
%

%   Define variables
t = 50;
N0 = 97;
mu = -0.1;
sigma = 0.2;
trials = 10;

x = 0:1:t;
y = [];
y = [y N0];

en = [];

%Iterate through interation function
for j=1:trials
    for i=1:t
        R = (1 + normrnd(mu,sigma)^3) * N0;
        N0 = R;
        y = [y R];
    end;
    en = [en y(t)];
end;

%Plot
subplot(2,2,3)
hist(en);
    title(['(Q1 f)) 10000 Trials to t = ' num2str(t)]);
    xlabel('Population');
    ylabel('Frequency');
    
mean = mean(y)
standard_deviation = std(y)

%
%   Question 1 part g):
%   Produce histogram of 10000 samples of random numer r^3
%

%   Define variables
t = 150;
N0 = 97;
mu = -0.1;
sigma = 0.2;
trials = 10;

x = 0:1:t;
y = [];
y = [y N0];

en = [];

%Iterate through interation function
for j=1:trials
    for i=1:t
        R = (1 + normrnd(mu,sigma)^3) * N0;
        N0 = R;
        y = [y R];
    end;
    en = [en y(t)];
end;

%Plot
subplot(2,2,4)
hist(en);
    title(['(Q1 g)) 10000 Trials to t = ' num2str(t)]);
    xlabel('Population');
    ylabel('Frequency');
    
mean = mean(y)
standard_deviation = std(y)