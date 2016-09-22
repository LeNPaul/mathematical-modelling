%NOTE: Use hold on to to plot multiple plots with different p0, maybe write a general function that takes in p0 and outputs the data instead of copying the code multiple times

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

%Plot data with colourful plot points
sz = 25;
c = linspace(1,10,length(x));

scatter(x,y,sz,c,'filled')
    title('Water Level vs. Time')
    xlabel('Time (Years)')
    ylabel('Water Level (Million Cubic Meters)')
