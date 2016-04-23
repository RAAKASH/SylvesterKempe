function [ C,D,f,B,j ] = Processing( A )
%% Finds the different branches of solutions and segregates them.
%  Input A should be in radians ,Output is in degrees.  
%   
[m,n] = size(A);
B = zeros(1,n); % Compiled Branch solution
C = B;          % Branch 1 solution
D = C;          % Branch 2 solution
f = 2;          % Flag for number of branches
j=1;            % Iter variable
%% Processing of rubbish data got after Newton Raphson
%  Converts huge numbers to simple numbers greater than 0 less than 360 degrees 
%  This happens only when solution for the previous guess doesnt exist.
A = A*180/pi;
A = mod(A,360);
%% Main Program
for i=1:m
    if(norm(A(i,:))~=0)
        B(j,:) = A(i,:);
      j =j+1;
    end
    
end


[m,~] = size(B);
j=0;
i=2;
while(i<=m)
j=i-1;
if(B(i,2)-B(i-1,2)>2.1000)  
    break;
end

i=i+1;

end

if(j~=(m-1))
C = B(1:j,:);

D = B(j+1:end,:);
else
    C = B;
    f=1;
end

if((C(1,2)==1)&&((abs(D(end,2)-359))<.001))
fprintf('Only a Single branch exists !!!!!\n');
C = [D;C];
f=1;
end


end


