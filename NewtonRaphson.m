function [ theta , f] = NewtonRaphson( lengths ,theta )
%% This function solves the non linear equation using JF function
%   Caution : This function solves only one configuration

%% Variable initialization  
m = length(lengths);
deltheta = zeros(m,1); %delta addition to theta
i = 0;                 % Iteration number 
E = 1;                 % Random norm greater than e 
e = 10^-6;             %Control value parameter
f = 0;                 %flag
%% Program 

while(E > e)
   i=i+1;
   [deltheta, E] = JF (lengths,theta);
   theta(3:end) = theta(3:end) + deltheta ;
    
   if(i>100)
       fprintf('Some problem  ,the Error is %d \n',E);
           f = 1;
           break;
   end
 f=0;  
end
%  theta*180/pi %Used to report bug
fprintf('iteration number %d\n',i);
%   pause;  % Used to debug error
end

