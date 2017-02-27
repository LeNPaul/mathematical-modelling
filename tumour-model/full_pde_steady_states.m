
%(dN,rn,kn,bnt,dT,rt,kt,btn,xmin,xmax,tmin,tmax,MeshTi,MeshSp,a,b)

% N*=0, T*=0 plot
FullPDE(0.0001,1.3,10,2,0.0002,1.5,11,0.2,0.0,1,0,125,500,50,1,20)

%The associated steady state is tumor free below
%btn*kn/kt>1 is 2.400000
%bnt*kt/kn<1 is 1.000000
%The associated steady state is tumor free (10.000000,0.000000)

FullPDE(0.0001,1.3,10,2,0.0001,1.5,5,1.2,0,1,0,20,500,50,1,500)

%The associated steady state is tumor destroys all cells 
%btn*kn/kt<1 is 0.181818
%bnt*kt/kn>1 is 2.200000
%The associated steady state is tumor destroys all cells (0.000000,11.000000)

FullPDE(0.0001,1.3,10,2,0.0002,1.5,11,0.2,0.0,1,0,50,125,50,1,25) 
FullPDE(0.0001,1.3,10,2,0.0002,1.5,11,0.2,0.0,1,0,50,125,50,25,50)
FullPDE(0.0001,1.3,10,2,0.0002,1.5,11,0.2,0.0,1,0,50,125,50,50,75)
FullPDE(0.0001,1.3,10,2,0.0002,1.5,11,0.2,0.0,1,0,50,125,50,75,100)
FullPDE(0.0001,1.3,10,2,0.0002,1.5,11,0.2,0.0,1,0,50,125,50,100,125)

%The associated steady state is coexistence of normal and tumor cells 
%bnt*kt/kn<1 is 0.450000
%btn*kn/kt<1 is 0.066667
%The associated steady state is coexistence of normal and tumor cells respectively (5.670103,14.432990)

FullPDE(0.0001,1.3,10,0.3,0.0001,1.5,15,0.1,0.0,1,0,200,500,50,1,200) 