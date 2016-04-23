function [ b ,theta] = Branch( l,B )
% Function used for finding other branches
% The function takes in the 4bar Angles ,Returns convex quadrilateral.
% Note :   Here input argument B ,output is in degrees 

%%
B = B*pi/180;
tantheta = -l(2)*sin(B(:,2))./(l(1)-l(2)*cos(B(:,2)));

theta    = atan(tantheta);
theta    = theta*180/pi;
theta    = mod(theta,360);
B = B*180/pi;
if(B(1,3)<theta(1))
b = B;
b(:,4) = b(:,4) -2*(B(:,4)-theta);
b(:,3) = b(:,3)+2*(- b(:,3)+theta);

else
b=B;

end

