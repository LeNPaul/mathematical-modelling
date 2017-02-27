%Plots the phase portrait and the vector field of the Lotka Volterra portion
%of the Tumor PDE
%manually change the parameters for graphing

clf;

%Defines the parameters. Same as the coexistence parameters used in the
%presentation
rn = 1.3;
rt = 1.5;
bnt = 0.5;
btn = 1.1;
kn = 10;
kt = 12;
dN = 0.001;
dT = 0.0015;

%Plots the bifurcation for btn if not commented out
    for btn = 0:0.1:1.5
        
        %Solves the Lotka Volterra coupled ODE. Also finds the value for
        %the last time step
        couplode = @(x,y) [rn*y(1)*(1-y(1)/kn-bnt/kn*y(2));rt*y(2)*(1-y(2)/kt-btn/kt*y(1))];
        [x,y] = ode45(couplode, [0 200], [6;1]);
        dim = size([x,y]);
        dimt = dim (1,1);

        %Plots (ncells,tcells) in cyan. Plots the value associate with the
        %last timestep as a red dot
        hold on
        figure(1);
        plot(y(:,1), y(:,2),'c','linewidth',2);
        plot(y(dimt,1), y(dimt,2),'-r.','markersize',15);
    
     end

title('Bifurcation: Case -> b_{nt}*K_T/K_N<1');
xlabel('Relative Number of Normal Cells');
ylabel('Relative Number of Tumor Cells');
grid;
%axis tight;

%Defining the domain and range of the vector field
xminm = 0;
xmaxm = 11;
intm = 1;
yminm = 0;
ymaxm = 13;
[x,y] = meshgrid(xminm:intm:xmaxm,yminm:intm:ymaxm);

%The differential equations for the vector field. Regular lotka volterra
u = rn*x.*(1-x/kn-bnt*y/kn);
v = rt*y.*(1-y/kt-btn*x/kt);

%plots the vector field if not commented out

%{
%Vector field
q = quiver(x,y,u,v);
q.Color = 'g';
q.LineWidth= 0.7;
q.AutoScaleFactor = 5.5;
q.MaxHeadSize = 1;
%}

%Textbox comment
%Changed by hand each time
dim = [0.65 0.6 0.3 0.3];
str = {'Parameters','r_n=1.3, r_k=1.5, K_N=10',' K_T=12, b_{nt}=0.5, 0<b_{tn}<2','Cyan = (N,T)','Red = Last Time Step'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','color','r','fontweight','bold','fontsize',8);
xlim ([0,12]);
hold off

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

fprintf('dn is %f\nrn is %f\nkn is %f\nbnt is %f\n\ndt is %f\nrt is %f\nkt is %f\nbtn is %f',dN,rn,kn,bnt,dT,rt,kt,btn);
fprintf('\n\nbtn*kn/kt>1 is %f\nbnt*kt/kn<1 is %f\nThe associated steady state is tumor free (%f,%f)',btnknkt,bntktkn,kn,0);
fprintf('\n\nbtn*kn/kt<1 is %f\nbnt*kt/kn>1 is %f\nThe associated steady state is tumor destroys all cells (%f,%f)',btnknkt,bntktkn,kt,0);
fprintf('\n\nbnt*kt/kn<1 is %f\nbtn*kn/kt<1 is %f\nThe associated steady state is coexistence of normal and tumor cells respectively (%f,%f)',bntktkn,btnknkt,NPositiveSteadyNum,TPositiveSteadyNum);
