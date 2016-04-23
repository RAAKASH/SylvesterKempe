function [ d ,L] = Grashoff( l )
%% Finds whether a mechanism is a grashoff mechanism or not 
%  If Grash off returns Crank Rocker INVERSION ,d=1
%  Else returns the Same Configuration ,d=0


%   Input: 4bar lengths : l
%  Output: 
%  1) d - flag for grash off
%  2) L - crank rocker configuration.
%% Variable initialization 
  d = 0; % Flag for whether the mecanism is grashoff or not
 
%%  Program 
 if ( 2*(max(l)+min(l)) < sum(sum(l)))  %% Condition for GrashOff;
 
     d =1;  
     i = find(l==min(l));
     j = i-2;
     k = [1,2,3,4] -j; 
     g = find(k<=0);
     k(g) = (k(g))+4;
        
     for i=1:4
     L(k(i)) = l(i);
     end
     
 else
     d = 0;
     L=l;
 end




end

