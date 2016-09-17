%Setting the initial conditions and variables
v0 = 1;
y = [];
y = [y v0];
x=0:1:25;

%Iterate through state functions
for i=1:25
    waterLevel = 14 * v0 / 25 + 16 / 25
    y = [y waterLevel];
    v0 = waterLevel;
end;

%Plot data with colourful plot points
sz = 25;
c = linspace(1,10,length(x));

scatter(x,y,sz,c,'filled')
    title('Water Level vs. Time')
    xlabel('Time (Years)')
    ylabel('Water Level (Million Cubic Meters)')