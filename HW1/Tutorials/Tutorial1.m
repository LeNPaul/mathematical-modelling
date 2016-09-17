%Preliminaries:
%Math 3MB3 Tutorials
%BSB 244, Thursdays 10:30-11:20
%Tedra Bolger, bolgert@math.mcmaster.ca
%unofficial office hours: Thursday 2:30-4:30
                          %Math Help Centre, Hamilton Hall 104
   
    
%open matlab by double clicking the icon or searching for the application
%there are several windows: command window, editor, workspace (keeps track
%of variables), etc.
%only use the command prompt (>>) for small tasks and calculations, since
%the things you do there are noteasily saved or edited.  You will want to
%do most of your work in a SCRIPT
%start a new script using FILE>NEW SCRIPT, and save it as yourFileNamename.m
%you can now write your commands directly into the .m file using the editor
%window, and when you are finished and your work is saved, either click
%"RUN" from the toolbar, or type yourFileNamename into the command prompt.  
%Any results will be displayed in the command prompt

% 1. EXPRESSIONS, SYNTAX AND VARIABLES
% The "%" symbol is used to denote comments.  Anything written on the same
% line after a "%" will not be executed.  Also note the green text color
% variables are assigned by simply writing VAR_NAME=EXPRESSION. Variables 
% can be used to store values, vectors, matrices, etc. The name of the
% variable (the "place" the information will be stored) must always be
% written on the left of the =, and the information you wish to store 
% there is always on the right.
% The ";" is used for either displaying or suppressing the output,
% for example:

a=3+7 % will storethe result 10 under variable name a and display a=10 in
        %the command prompt window when executed, but
        
b=2+5;  %will store the result of 7 under the variable name b,
        %and no output is shown.
%Suppressing output is useful when dealing with 
%long scripts or lots of data

% Variables that have already been assigned can be used by writing their 
% name, for ex:

a+b %displays ans=17 

%Note that variables can be overwritten by using the same name.  

a=a+2; %takes the current a (value 10) and adds 2 to it. The resulting 12 
%is stored under the name a.  The old value of a is lost.

a+b %will now display ans=19

%also note that matlab needs a * to perform multiplication.  Writing just
%ab or 2a as opposed to a*b and 2*a will give an error

%DISPLAY AND OUTPUTS
%Anything that does not have a ; at the end will be displayed as output
%in the command window.  Alternatively, the disp() command can be used

disp('The value of a is ')
disp(a)

%Strings (aka words/sentences) must be surrounded with single quotation
%marks.  Values are displayed by writing the variable name without the
%quotations.  There are also several other ways to display output,
%(printf,fprintf,etc. for those who are familiar with C)

%VECTORS
%Variables can store vectors in either row or column form.  
%Square brackets are used to denote a vector, with spaces seperating the
%entries of a row vector, and ;  seperating the entries of a column vector.
%Vector operations are performed component wise, and can only be done on
%vectors of the same size and orientation.

A=[1 2 3 4]
B=[7 4]
C=[5 6 7 8]

%A,B and C are all row vectors. A+B would give an error, but A+C is valid

A+C %displays ans=[6 8 10 12]
D=[9;10;11;12] %D is a 4x1 column vector

%specific entries of a vector can be accessed by using the variable 
%name directly followed by the index number in parentheses.  
%(IMPORTANT NOTE THAT MATLAB INDEXING BRGINS WITH 1, NOT 0)

C(2) %displays ans=6
D(3) %displays ans=11

%Sub-vectors can be created using ":"

C(2:4) %gives the vector created from the 2nd through 4th elements of 
       %C, [6 7 8]
       
%The colon ":" operator can also be used to generate sequences of evenly
%spaced numbers

v1=10:2:20 %generates the row vector starting at 10 and with each entry 
           %increasing by 2 until the final entry of 20 v1=[10 12 14 16 18 20]
           
v2=6:-1:2 %The step size can also be negative

%MATRICES
%Create matrices by combining row and column vector notation. 
%Spaces separate entries on the same row, and ; denote the end of a row.
%Operations can be performed on matrices of compatible sizes.

M1=[1 2 3 ; 4 5 6 ; 7 8 9] %this is a 3x3 matrix
M2=[2 4; 6 8; 10 12] %this is a 3x2 matrix
M=M1*M2 %is 3x2 but M2*M1 is invalid, as is M1+M2

%some special matrices:
%zeros(m,n) creates an mxn matrix of all zeros
%ones(m,n) creates an mxn matrix of all ones
%eye(m,n) creates an mxn identity matrix
%rand(m,n) creates an mxn matrix with random entries valued between 0 and 1

%Matrices can be combined:
N=[M1 M2] %N has dimension 3x5

%Submatrices can be extracted
R=N(1:3,2:4) %Matrix R is made up of rows 1-3 and columns 2-4 of matrix N

%Transpose and inverse
%The transpose of a matrix can be obtained in two ways.  The first is 
%the transpose command, the second is using '

disp('The transpose of M is ')
disp(transpose(M)) %alternatively could have said M' here

%To get the inverse of a matrix, the inverse command can be used. 
%However, this command is computationally complex, quite slow and can
%lack precision due to floating point arithmetic.
Q=rand(3,3);
inv(Q); %This is equivalent to Q^(-1)

%LINEAR EQUATION SOLVING
%For solving systems of linear equations A*x=b,  the inverse command is
%not recommended.  Instead, a front slash "\" is preferred.  This can be
%demonstrated by timing each solution using the "tic" and "toc" commands.
%create a 5x5 matrix and 5x1 solution vector
A=[1 0 2 3 -1; -1 5 0 -2 0; 0 3 -9 1 8; 7 -2 5 -4 -1; 1 0 6 -3 5]; 
b=[1; 2; 3;-1; 0]; 
tic; %start timing
x=inv(A)*b;
t1=toc; %stop timing
disp('the time to solve using inv() is ') 
disp(t1)
%Note the time taken and compare now with the "\"
tic;
x=A\b;
t2=toc;
disp('the time to solve using "\" is ')
disp(t2)
%The "\" is 2-3 times faster and is more precise than than inv(), so 
%it is highly preferred.

%VECTOR/MATRIX VS SCALAR OPERATIONS
%Matlab perfermes all calculations as matrix operations unless otherwise
%specified.  If you need to perform scalar operations, the "." must be
%placed in front of the operator.  
%ex: square each element of a matrix

M=[2 0 -1; 4 -6 1; 5 0 2];
disp('M^2 is M*M=')
disp(M^2)
disp('but M.^2 squares each element of M to give')
disp(M.^2)

%This is a very important distinction to make.  Extra or forgotten "." can
%be fatal to a matlab program. 


%CONDITIONALS & LOOPS
%The logical operators are "&" (and), "|" (or) and "~" (not)
%Relational operators are <,>,==,~=,<=,>=
%Combine these operators to make conditional statements. Boolean
%expressions are represented by 0 (false) and 1 (true)

e=20; q=10; w=10;
e>q; %result is 1
e==q; %result is 0
(e>0)|(q<0); %result is 1 since one of those is true
(e>0)&(q<e); %is 1 since both statements are  true
~(e==q); %is 1 since e and q are not equal

%Conditions are generally used inside of IF STATEMENTS. These are used when
%you want a certain command to be executed only under certain conditions.
%if statements must be ended with an end command
%ex:Create two random numbers x and y between 0 and 1. Write an
%if-statement that displays x if x is smaller than y. 

x=rand(1,1); y=rand(1,1);
if(x<y)
    disp(x)
end;

%Now, write an if-else statement to display the minimum of x and y.
if(x<y)
    disp(x)
elseif(y<x)
    disp(y)
else disp('x and y are equal!')
end;

%Create a third random number z.Write an if-statement that displays the 
%value of z if z is larger than x or y.
z=rand(1,1);
if((z>x)||(z>y))
    disp(z)
end;

%FOR LOOPS are used when many iterations are needed, for exsmple, doing
%something for each element of a large vector.
%ex: Suppose we want to find the maximum element of a vector x with 200
%elements that are random numbers between 0 and 1

v=rand(200);
maxvalue=v(1);
for i=1:200
    if (v(i)>maxvalue)
        maxvalue=v(i);
    end;
end;
disp('The maximum value is')
disp(maxvalue)

%here, i is used as the "loop variable".  It will increase by 1 for each
%pass through the for loop, and the loop will be exited once the 200th
%iteration is complete.
%It is also quite common to have for loops nested inside each other 
%(useful for matrices)

%HELP AND FURTHER DOCUMENTATION
%http://www.mathworks.com/help/matlab/

