%Setting the initial conditions and variables

%Initial population condition
p0 = 3;
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
    popDiff = popSize - p0;
    y = [y popDiff];
    p0 = popSize;
    disp(i)
    disp(popSize)
end;

%Plot data with colourful plot points
sz = 25;
c = linspace(1,10,length(x));

scatter(x,y,sz,c,'filled')
    title('Cubic Growth Model')
    xlabel('Time')
    ylabel('Population Size')
