%
%   Question 1 part c):
%   Produce histogram of 10000 samples of random numer r^3
%

%   Define variables
n = 10000;
mu = 0.1;
sigma = 0.2;

x = 0:1:n;
y= [];

%Iterate through interation function
for i=1:n
    y = [y normrnd(mu,sigma)^3];
end;

hist(y,50);
    title([num2str(n) ' Samples of Random Variable r^3']);
    xlabel('');
    ylabel('');

meam = mean(y)
standard_deviation = std(y)

%
%   Question 1 part e):
%   Produce histogram of 10000 samples of random numer r^3
%

%   Define variables
t = 250;
N0 = 97;
mu = 0.1;
sigma = 0.2;

x = 0:1:t;
y = [];
y = [y N0];

%Iterate through interation function
for i=1:t
    R = normrnd(mu,sigma) * N0;
    N0 = R;
    y = [y R];
end;

plot(x,y);
    title(['Trial to t = ' num2str(t)]);
    xlabel('Time');
    ylabel('Population');
    
%
%   Question 1 part f):
%   Produce histogram of 10000 samples of random numer r^3
%

%   Define variables
t = 50;
N0 = 97;
mu = 0.1;
sigma = 0.2;

x = 0:1:t;
y = [];
y = [y N0];

%Iterate through interation function
for i=1:t
    R = normrnd(mu,sigma) * N0;
    N0 = R;
    y = [y R];
end;

hist(y);
    title(['Trial to t = ' num2str(t)]);
    xlabel('Population');
    ylabel('Number');
    
meam = mean(y)
standard_deviation = std(y)

%
%   Question 1 part g):
%   Produce histogram of 10000 samples of random numer r^3
%

%   Define variables
t = 150;
N0 = 97;
mu = 0.1;
sigma = 0.2;

x = 0:1:t;
y = [];
y = [y N0];

%Iterate through interation function
for i=1:t
    R = normrnd(mu,sigma) * N0;
    N0 = R;
    y = [y R];
end;

hist(y);
    title(['Trial to t = ' num2str(t)]);
    xlabel('Population');
    ylabel('Number');
    
meam = mean(y)
standard_deviation = std(y)