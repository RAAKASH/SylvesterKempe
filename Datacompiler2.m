function [ Data,C ] = Datacompiler2(B)
%% Gives solution of the second 4bar
% This function takes in angles of the base 4 bar,returns the 2nd 4bar angles
% Note: This function assumes that inertia is enough for the link to assume
% the respective positions ,therefore generates solutions accordingly.

% Hence the mechanism doesnt break in any part of the animation

%  Refer PDF 
Theta4 = B(:,4);
Theta2 = Theta4 - B(:,3) ;
Theta3 = Theta4/2 -(B(:,2) - Theta4/2);
Theta1 = B(:,1);
C = [Theta1,Theta2,Theta3,Theta4];
Data = [B,C];
end

