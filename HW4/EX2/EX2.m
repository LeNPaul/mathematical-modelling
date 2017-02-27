%
%   Question 2 part c):
%   Run trial of the model up to t=30
%

%   Define variables
t = 30;
M0 = 90000;
mu = 10000;
sigma = 2225;

x = 0:1:t;
y = [];
y = [y M0];

%Iterate through interation function
for i=1:t
    %Determine the random variable for interest
    rnum = rand;
    if (rnum <= 1) && (rnum > 0.75)
        r = 0.0005;
    elseif (rnum <= 0.75) && (rnum > 0.5)
        r = 0.013;
    else
        r = 0.01;
    end
    M = (1 + r) * (60000 + M0) + normrnd(mu,sigma);
    M0 = M;
    y = [y M];
end;

%Plot
subplot(2,1,1);
plot(x,y);
    title(['(Q2 c)) Trial to t = ' num2str(t)]);
    xlabel('Time');
    ylabel('Money');

%
%   Question 2 part d):
%   Run 10000 trials of the model up to t=30
%

%   Define variables
trials = 20;
t = 30;
M0 = 90000;
mu = 10000;
sigma = 2225;

x = 0:1:t;
y = [];
y = [y M0];

Money = [];

%Iterate through interation function

for j=1:trials
    for i=1:t
        %Determine the random variable for interest
        rnum = rand;
        if (rnum <= 1) && (rnum > 0.75)
            r = 0.0005;
        elseif (rnum <= 0.75) && (rnum > 0.5)
            r = 0.013;
        else
            r = 0.01;
        end
        M = (1 + r) * (60000 + M0) + normrnd(mu,sigma);
        M0 = M;
        y = [y M];
    end;
    Money = [Money y(t)];
end;

%Plot
subplot(2,1,2);
hist(Money);
    title(['(Q2 d)) Trial to t = ' num2str(t)]);
    xlabel('Time');
    ylabel('Money');

mean = mean(Money)
standard_deviation = std(Money)

%
%   Question 2 part e):
%   Run trials until $1,000,000 is reached
%

%   Define variables
M0 = 90000;
mu = 10000;
sigma = 2225;
t = 0;

x = 0:1:t;
y = [];
y = [y M0];

for t=1:10000
    rnum = rand;
    if (rnum <= 1) && (rnum > 0.75)
        r = 0.0005;
    elseif (rnum <= 0.75) && (rnum > 0.5)
        r = 0.013;
    else
        r = 0.01;
    end
    M = (1 + r) * (60000 + M0) + normrnd(mu,sigma);
    M0 = M;
    if M > 1000000
        break;
    end;
end

disp(t)