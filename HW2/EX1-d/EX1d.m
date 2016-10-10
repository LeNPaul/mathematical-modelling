%Setting the initial conditions and variables
J0 = 12;
A0 = 220;
SJ = 1/12;
SA = 1/6;
f = 1/4;
T = [ 0 , f ; SJ SA];
x0 = [J0 ; A0];

%Calculation for part d)
T7 = (T^7)*x0;

%Setting the initial conditions and variables
J = [];
A = [];
J = [J J0];
A = [A A0];
t = 6;
x=0:1:t;

%Iterate through interation function
for i=1:t
    population = T^i*x0;
    J = [J population(1)];
    A = [A population(2)];
    disp(population(1));
    disp(population(2));
end;

%Plotting the population of adults and juveniles as functons of time for
%part f)

figure
hold on
plot(x,A,'k')
plot(x,J,'r')
    title('Juvenile and Adult Population vs. Time')
    xlabel('Time')
    ylabel('Population')
    
legend('Adults','Juveniles')

hold off

%Plotting the populations of adults and juveniles for part g)
figure
plot(J,A, 'b')
    title('Juvenile vs. Adult Population')
    xlabel('Juveniles')
    ylabel('Adults')