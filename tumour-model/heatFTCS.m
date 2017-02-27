function [errout,xo,to,Uo] = heatFTCS(nt,nx,alpha,L,tmax,errPlots)
% Solves the 1d heat eqtion with FTCS Scheme
%
%Where my inputs:
%   nt = number of steps
%   nx = number of mesh points in x direction
%   alpha = diffusivity
%   L = Length of the domain
%   tmax = maximum time for the simulation
%   errPlots = flag (1 or 0) to control whether plots of the solution
%               and error ar the last time time are created 
%
%  Output: err = L2 Norm of error at spatial nodes on last time step
%          x = location of finite difference nodes
%          t = values of time at which solutions is obtained (time nodes) 
%          U = matrix solutuins: U(:,j) is U(x) at t = t(j)

% if nargin<1, nt = 10;     end
% if nargin<1, nx = 20;     end
% if nargin<1, alpha = 0.1; end
% if nargin<1, L = 1;       end     
% if nargin<1, tmax = 0.5;  end    
% if nargin<1, errPlots=1;  end

% --- Compute mesh spacing and time step
dx = L/(nx-1);
dt = tmax/(nt-1);
r = alpha*dt/dx^2; 
r2 = 1-2*r;

% -- Creates arrays to save datat for export
x = linspace(0,L,nx);
t = linspace(0,tmax,nt);
Y = zeros(nx,nt);

% --- Set IC and BC
U(:,1) = sin(pi*x/L);  % implies u0 =0; uL = 0;
u0 = 0; uL = 0;         % need to apply BC inside time step loop

% --- Loop over time steps 
for m=2:nt
    for i=2:nx-1
        U(i,m) = r*U(i-1,m-1) + r2*U(i,m-1) + r*U(i+1,m-1);
    end
end

% --- Compare with exact soltuion at end of simulation
ue = sin(pi*x/L)*exp(-t(nt)*alpha*(pi/L)^2)
err = norm(U(:,nt)-ue)

figure()
plot(t,U)
    
    
