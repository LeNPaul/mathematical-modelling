
%Neuman boundary conditions
%Function to graph the the numerical solution to the partial differential 
%equation
%Takes input where 
%dN and dT = cellular diffusion constant for normal and tumor cells
%respectively
%rn and rt = growth rate for normal and tumor cells
%kn and kt = carrying capacity of normal and tumor cells
%bnt and btn = lumped competition terms
%xmin and xmax is the space domain (should be 0-1)
%tmin and tmax are the first and last time value
%mesh sp is how many intervals the xdomain is split up
%Mesh sp = 50
%mesh ti was how many intervals thetime range was split up into

%Note that t1,t2,t3 assume that each whole time step (i.e. 1-2) is split
%into 3. 
%t1 = 0
%t2 = number of whole time steps (not intervals) to graph.
%t3 = time step to start graphing from

%Copy and past this without comments for a easy template
%FullPDE_NeumannBoundaryConditions(0.0001,1.3,10,0.6,0.00015,1.5,12,1.2,0.0,1,0,200,600,50,0,200,0)
function [u,err,x,t] = HeatEquationWConst(dN,rn,kn,bnt,dT,rt,kt,btn,xmin,xmax,tmin,tmax,MeshTi,MeshSp,t1,t2,t3)
clf;

btnknkt = btn*kn/kt; %If this is greater than 1
bntktkn = bnt*kt/kn; %and this is less than 1
%then the steady state (Kn,0), Tumor free is achieved
%Reversing both inequalities is associated with tumor only steady state,
%N=0, T=Kt

bntktkn = bnt*kt/kn; %If less than 1
btnknkt = btn*kn/kt; %and this less than one
%Then steady state at coexistence points 
NPositiveSteadyNum = (kn-bnt*kt)/(1-bnt*btn); 
TPositiveSteadyNum = (kt-btn*kn)/(1-bnt*btn);

fprintf('dn is %f\nrn is %f\nkn is %f\nbnt is %f\n\ndt is %f\nrt is %f\nkt is %f\nbtn is %f',dN,rn,kn,bnt,dT,rt,kt,btn);
fprintf('\n\nbtn*kn/kt>1 is %f\nbnt*kt/kn<1 is %f\nThe associated steady state is tumor free (%f,%f)',btnknkt,bntktkn,kn,0);
fprintf('\n\nbtn*kn/kt<1 is %f\nbnt*kt/kn>1 is %f\nThe associated steady state is tumor destroys all cells (%f,%f)',btnknkt,bntktkn,kt,0);
fprintf('\n\nbnt*kt/kn<1 is %f\nbtn*kn/kt<1 is %f\nThe associated steady state is coexistence of normal and tumor cells respectively (%f,%f)',bntktkn,btnknkt,NPositiveSteadyNum,TPositiveSteadyNum);
fprintf('\n\nxmin is %f\nxmax is %f\ntmin is %f\ntmax is %f\nMeshTi is %f\nMeshSp is %f\n',xmin,xmax,tmin,tmax,MeshTi,MeshSp);


dx = (xmax-xmin)/(MeshSp-1); %'width' of each space step
dt = (tmax-tmin)/(MeshTi-1); %'width' of each time step. 

x = [xmin:dx:xmax]; %Vector of space steps
y = [tmin:dt:tmax]; %Vector of time steps


DnR = dN*dt/(dx^2); %heat constant and the r term for ncells. CLf term for pure heat equatio
DnR2 = 1-2*DnR; 

DtR = dT*dt/(dx^2); %Heat constant and the r term for tcells. CLf term for pure heat equatio
DtR2 = 1-2*DtR;

fprintf('\nDnR is %f and DtR is %f\nBoth terms should be less than 0.5 or unstable solutions will result',DnR,DtR);

%Matrix to store cells wrt space and time
ncells = zeros (MeshSp,MeshTi); 
tcells = zeros (MeshSp,MeshTi); 

%Setting initial condition for ncells and tcells. Neuman boundary condition used here. First value set such that the first derivative is 0 
%defines first column (represents the number of cells at every space point)
%Ncells set to be like an x^2 graph. Same thing with tcells but it is much
%flatter than ncells and it's only half the width
for i=1:MeshSp
    ncells(i,1) = -0.5*i*(i/MeshSp-1);
    
    if (-0.5*i*(i/MeshSp-1/2)>=0)
       tcells(i,1) = -0.1*i*(i/MeshSp-1/2);
    else
       tcells(i,1) = 0;
    end
    
   
end


%Filling up the ncells for time and space. 
%Boundary condition at initial and final points, cells are 0 are first and
%last position.
for i= 1:MeshTi %Time evolution
    %First spatial point in the next time step
    ncells(1,i+1) = DnR*ncells(3,i)+ DnR2*ncells(2,i) + DnR*ncells(1,i) + dt*rn*ncells(2,i)*(1 - ncells(2,i)/kn - bnt*tcells(2,i)/kn );
    tcells(1,i+1) = DtR*tcells(3,i)+ DtR2*tcells(2,i) + DtR*tcells(1,i) + dt*rt*tcells(2,i)*(1 - tcells(2,i)/kt - btn*ncells(2,i)/kt );
   
    for j= 2:MeshSp-1 %Space evolution
        %Fills out the future space steps for the future memory from the
        %previous memory and space steps
        ncells(j,i+1) = DnR*ncells(j+1,i) + DnR2*ncells(j,i) + DnR*ncells(j-1,i) + dt*rn*ncells(j,i)*(1 - ncells(j,i)/kn - bnt*tcells(j,i)/kn );
        tcells(j,i+1) = DtR*tcells(j+1,i) + DtR2*tcells(j,i) + DtR*tcells(j-1,i) + dt*rt*tcells(j,i)*(1 - tcells(j,i)/kt - btn*ncells(j,i)/kt );
    end
    
 %End point for the instance i time and the error. First Derivative set to 0.  
  ncells(MeshSp,i+1) = DnR*ncells(MeshSp,i) + DnR2*ncells(MeshSp-1,i) + DnR*ncells(MeshSp-2,i) + dt*rn*ncells(MeshSp-1,i)*(1 - ncells(MeshSp-1,i)/kn - bnt*tcells(MeshSp-1,i)/kn );
  tcells(MeshSp,i+1) = DtR*tcells(MeshSp,i) + DtR2*tcells(MeshSp-1,i) + DtR*tcells(MeshSp-2,i) + dt*rt*tcells(MeshSp-1,i)*(1 - tcells(MeshSp-1,i)/kt - btn*ncells(MeshSp-1,i)/kt );

end


%ncells (space,time)
%Plotting cells versus space 
hold on
for i=t1:t2    
%Plot number of cells versus space. Each line is a new time step
%graphs every third line. This is in relation that each whole time step has
%been split into 3
    plot (x,ncells(:,3*t3+3*i+1),'b');
    plot (x,tcells(:,3*t3+3*i+1),'r');
end
legend ('Normal Cells','Tumor Cells');
title('Population of Normal and Tumor Cells');
xlabel('Relative Position in Space');
ylabel('Relative Number of Cells');
hold off

fprintf('\n\nEnd of program\n');




