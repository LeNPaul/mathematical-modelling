%PLOTTING
%Matlab has very advanced plotting features. 
%The full extent of these features is impossible to capture here, but is 
%well documented at http://www.mathworks.com/help/matlab/, or by typing
%help plot into the command prompt.
%The basic steps of plotting are:
    %1. Define the range of x values to be plotted
    %2. Define the function y=f(x)
    %3. Call the plot command, plot(x,y)
    %4. Add a legend, colors, title, labels, line style, etc.

help plot

%ex1: Plot f(x)=sin(x) on [0,2*pi], with a dotted red line, and label axes 
%appropriately

x=0:0.25:2*pi; %create the x vector
%The increment must be small enough so that the plot is smooth.
%x=linspace(0,2*pi) is another way to achieve this
y=sin(x); 
%creates the y vector by applying sin to each component of the x vector

plot(x,y,'r :','LineWidth', 4)
    xlabel('x')
    ylabel('sin(x)')
    title('Sinusiodal Plot')
    
%here we have plotted y=sin(x), set the color to 'r'=red, set line 
%width to 4, and then added labels.  

%details on the different plotting options can be found by typing
%help plot into the command line at any time