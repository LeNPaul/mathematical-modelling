%ex2: Plot f(x)=3x^4+2x^3+7x^2+2x+9 and g(x)=5x^3+9x+2 from x=-10 to x=10
%on the same graph

x=-10:0.2:10;
f=3*x.^4+2*x.^3+7*x.^2+2*x+9;
g=5*x.^3+9*x+2;
hold on; %starts the hold until all plots are created
plot(x,f,'b','LineWidth',3)
plot (x,g,'g --', 'LineWidth',3)
    legend('f(x)','g(x)')
    title('Polynomial graph')
    grid on %add squares
hold off; %takes the hold off.  Now both plots will be in the same figure
