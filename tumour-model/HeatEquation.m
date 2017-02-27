fprintf('hellfsfsdfsdfo\n');

%Start of own coding for the heat equation form PDE

clf;
xmin = 0; xmax = 10; %Range on spatial distribution
tmin = 0; tmax = 10; %Number of time steps 

MeshSp = 50; %Number of spatial distributions. Mesh in space
MeshTi  = 50; %Number of time steps. Mesh in time

dx = (xmax-xmin)/(MeshSp-1); %'width' of each space step
dt = (tmax-tmin)/(MeshTi-1); %'width' of each time step. 

x = [xmin:dx:xmax]; %Vector of space steps
y = [tmin:dt:tmax]; %Vector of time steps

alpha = 0.0005; %The Heat equation constant
r = alpha*dt/(dx^2); %r
r2 = 1-2*r;

%Matrix to store cells wrt space and time
ncells = zeros (MeshSp,MeshTi); 
tcells = zeros (MeshSp,MeshTi); 

%Setting initial condition for ncells and tcells. 
%defines first column (represents the number of cells at every space point
%for t=0
%Set to trig functions for now
for i=1:MeshSp
    ncells(i,1) = sin(i);
    tcells(i,1) = cos(i); 
end

%Filling up the ncells for time and space. 
for i= 1:MeshTi %Time evolution
    %First spatial point in the next time step
    ncells(1,i+1) = r*ncells(2,i)+ r2*ncells(1,i) + r*ncells(MeshSp-1,i);
    tcells(1,i+1) = r*tcells(2,i)+ r2*tcells(1,i) + r*tcells(MeshSp-1,i);
    for j= 2:MeshSp-1 %Space evolution
        %Fills out the future space steps for the future memory from the
        %previous memory and space steps
        ncells(j,i+1) = r*ncells(j+1,i) + r2*ncells(j,i) + r*ncells(j-1,i);
        tcells(j,i+1) = r*tcells(j+1,i) + r2*tcells(j,i) + r*tcells(j-1,i);
    end
    
 %End point for the instance i time and the error 
 ncells(MeshSp,j+1) = ncells(MeshSp,j) + r*(ncells(2,j)-2*ncells(MeshSp,j)+ncells(MeshSp-1,j));
 tcells(MeshSp,j+1) = tcells(MeshSp,j) + r*(tcells(2,j)-2*tcells(MeshSp,j)+tcells(MeshSp-1,j));
 % err(:,j+1) = u(:,j+1) - exp(t_0-t(j+1))*cos(x);. Error here wasn't
 % written for this function. 
end

%ncells (space,time)
%Plotting cells versus space 
hold on
for i=1:MeshTi
plot (x,ncells(:,i));
end
hold off

fprintf('hell111o\n');




