%Setting the initial conditions and variables
%Initial population condition
p0 = 1;
R = 0.3;
A = 2;
K = 7;
y = [];
y = [y p0];
n = 25;
x=0:1:n;

%Iterate through interation function
for i=1:n
    popSize = p0*(1 - R*(1 - p0/A)*(1 - p0/K));
    y = [y popSize];
    p0 = popSize;
    disp(i)
    disp(popSize)
end;

hold on

plot(x,y,'k')
    title('Cubic Growth Model')
    xlabel('Time')
    ylabel('Population Size')   
    
%Setting the initial conditions and variables
%Initial population condition
p0 = 3;
y = [];
y = [y p0];

%Iterate through interation function
for i=1:n
    popSize = p0*(1 - R*(1 - p0/A)*(1 - p0/K));
    y = [y popSize];
    p0 = popSize;
    disp(i)
    disp(popSize)
end;

plot(x,y,'b')

%Setting the initial conditions and variables
%Initial population condition
p0 = 9;
y = [];
y = [y p0];

%Iterate through interation function
for i=1:n
    popSize = p0*(1 - R*(1 - p0/A)*(1 - p0/K));
    y = [y popSize];
    p0 = popSize;
    disp(i)
    disp(popSize)
end;

plot(x,y,'r')

legend('P0 = 1','P0 = 3','P0 = 9')