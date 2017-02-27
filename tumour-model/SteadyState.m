% Solving Second Order Coupled ODEs 
%This models the number of cells over the growing space. 

%{
clf;

rn=0.2 ; %rT and rN are the maximum growth rates of tumorous and native cells
rt=0.8;

dn=0.0005;  %DT and DN are the cellular diffusion constant for tumorous and native cells.
dt=0.0005;

kn=3;  %KT and KN are the maximal cell densities of tumorous and native cells
kt=5;

bnt=0.6;  %bNT and bTN are competition constants between the tumorous and native cells,
btn=0.8;
%}

function [a,b] = SteadyState(rn,rt,dn,dt,kn,kt,bnt,btn)
dN = dn;
dT = dt;
btnknkt = btn*kn/kt; %If this is greater than 1
bntktkn = bnt*kt/kn; %and this is less than 1
%then the steady state (Kn,0), Tumor free is achieved
%Reversing both inequalities is associated with tumor only steady state,
%N=0, T=Kt
bntktkn = bnt*kt/kn; %If less than 1
btnknkt = btn*kn/kt; %and this less than one

%Then steady state at points
NPositiveSteadyNum = (kn-bnt*kt)/(1-bnt*btn); 
TPositiveSteadyNum = (kt-btn*kn)/(1-bnt*btn);

fprintf('dn is %f\nrn is%f\nkn is %f\nbnt is %f\n\ndt is %f\nrt is %f\nkt is %f\nbtn is %f',dN,rn,kn,bnt,dT,rt,kt,btn);
fprintf('\n\nbtn*kn/kt>1 is %f\nbnt*kt/kn<1 is %f\nThe associated steady state is tumor free (%f,%f)',btnknkt,bntktkn,kn,0);
fprintf('\n\nbtn*kn/kt<1 is %f\nbnt*kt/kn>1 is %f\nThe associated steady state is tumor destroys all cells (%f,%f)',btnknkt,bntktkn,kt,0);
fprintf('\n\nbnt*kt/kn<1 is %f\nbtn*kn/kt<1 is %f\nThe associated steady state is coexistence of normal and tumor cells respectively (%f,%f)\n',bntktkn,btnknkt,NPositiveSteadyNum,TPositiveSteadyNum);


%Breaks down the two second order ODE into four first order
couplode = @(x,y) [y(2); (rn/dn)*y(1)*((bnt/kn)*y(3) + (y(1)/kn) - 1); y(4); (rt/dt)*y(3)*((btn/kt)*y(1) + (y(3)/kt) - 1)];

%Solves the 1st order differential equation
[x,y] = ode45(couplode, [0 1], [0.01;0;4.99;0]);

%Prevents the entries from being negative
for i=1:length(y)
    for j=1:4
        if y(i,j)<0;
            y(i,j)=0;
        end;
    end;
end;

%Makes 0 an absorbing boundary condition

for i=2:length(y)
    for j=1:4
        if y(i-1,j) == 0;
            y(i,j) = 0;
        end;
    end;
end;

%Plots
hold on
plot(x, y(:,1), 'g');
plot(x, y(:,3), 'r');
legend('N*','T*');
grid;
hold off

end
%1 and 3 are the same, 2 and 4 are the same 
% bTN KN /K T> 1 then normal cells is the steady state 