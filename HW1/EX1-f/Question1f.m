%Setting the initial conditions and variables
v0 = 1;
y = [];
y = [y v0];
n = 25;
x=0:1:n;

%Iterate through interation function
for i=1:n
    waterLevel = 14 * v0 / 25 + 16 / 25;
    y = [y waterLevel];
    v0 = waterLevel;
    disp(i)
    disp(waterLevel)
end;

plot(x,y)
    title('Water Level vs. Time')
    xlabel('Time (Years)')
    ylabel('Water Level (Million Cubic Meters)')
