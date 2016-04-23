function [ deltheta,e ] = JF( l,t )
%% Four Bar mechanism equations   


%% 
%   
%  Loop Equations:
% 
% $$-l_{1}\cos{\theta_{1}}+l_{2}\cos{\theta_{2}}+l_{3}\cos{\theta_{3}}-l_{4}\cos{\theta_{4}}  = 0$$
% 
% $$-l_{1}\sin{\theta_{1}}+l_{2}\sin{\theta_{2}}+l_{3}\sin{\theta_{3}}-l_{4}\sin{\theta_{4}}  = 0$$
%       
%% 
%                 Newton Raphson Method
% 
%                   $$ J*deltheta = -F$
% 
%   Here J is the jacobian matrix , Deltheta is the incremental theta , 
%   F is the function matrix       
% 
%% Program 
e=0;
F1 = 0;
F2 = 0;
Fdash1 = [0,0];
Fdash2 = [0,0];
F1 = -l(1)*cos(0)+l(2)*cos(t(2))+l(3)*cos(t(3))-l(4)*cos(t(4)); 
F2 = -l(1)*sin(0)+l(2)*sin(t(2))+l(3)*sin(t(3))-l(4)*sin(t(4)) ;
F = -1*[F1;F2];

Fdash1 = [-l(3)*sin(t(3)),l(4)*sin(t(4))];
Fdash2 = [l(3)*cos(t(3)),-l(4)*cos(t(4))];
J = [Fdash1;Fdash2];

if(norm(J)~=0)
deltheta = J\F;
e = norm(deltheta);
else
fprintf('Jacobian modulus 0!!!!!');
end



end

