%Setting the initial conditions and variables
%Initial population condition
p0 = 1;
R = 0.3;
A = 2;
K = 7;
y = [];
n = 25;
x=0:1:n;

%Iterate through interation function
for i=0:n
    popSize = p0*(1 - R*(1 - p0/A)*(1 - p0/K));
    popDiff = popSize - p0;
    y = [y popDiff];
    p0 = popSize;
    disp(i)
    disp(popSize)
end;

hold on

plot(x,y,'b')
    title('Change in Population')
    xlabel('Population Growth')
    ylabel('Population Difference')

%Setting the initial conditions and variables
%Initial population condition
p0 = 3;
y = [];

%Iterate through interation function
for i=0:n
    popSize = p0*(1 - R*(1 - p0/A)*(1 - p0/K));
    popDiff = popSize - p0;
    y = [y popDiff];
    p0 = popSize;
    disp(i)
    disp(popSize)
end;

plot(x,y,'k')
    
%Setting the initial conditions and variables
%Initial population condition
p0 = 9;
y = [];

%Iterate through interation function
for i=0:n
    popSize = p0*(1 - R*(1 - p0/A)*(1 - p0/K));
    popDiff = popSize - p0;
    y = [y popDiff];
    p0 = popSize;
    disp(i)
    disp(popSize)
end;

plot(x,y,'r')

legend('P0 = 1','P0 = 3','P0 = 9')