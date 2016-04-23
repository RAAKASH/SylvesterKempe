function [ d ] = Plot( l1,l2,B,A)
%% Used in Animation function
%  Plots a single frame
%% Program
b = l1(1)*.2; %Offset
%% Base 4 0ar coordinates
X =  (- l2(2)*cos(A(2)+pi/2)+l1(2)*cos(B(2)+pi/2)); %2nd bar coordinates
Y = (- l2(2)*sin(A(2)+pi/2)+l1(2)*sin(B(2)+pi/2));

x = [l1(2)*cos(B(2)+pi/2),0,l1(2)*cos(B(2))]; %BigL
y = [l1(2)*sin(B(2)+pi/2),0,l1(2)*sin(B(2))]; %BigL
x1 =[X+l2(2)*cos(A(2)),X+l2(2)*cos(A(2))+l2(3)*cos(A(3)),X+l2(2)*cos(A(2))+l2(3)*cos(A(3))+l2(3)*cos(A(3)-pi/2)];
y1 =[Y+l2(2)*sin(A(2)),Y+l2(4)*sin(A(4)),Y+l2(4)*sin(B(4))+0+l2(3)*sin(A(3)-pi/2)];%BigL
x2 = [l1(2)*cos(B(2)),l1(2)*cos(B(2))+l1(3)*cos(B(3)),l1(1)+l1(4)*cos(B(4))+l1(3)*cos(B(3)- pi/2)];% Small L
y2 = [l1(2)*sin(B(2)),l1(4)*sin(B(4)), l1(4)*sin(B(4))+l1(3)*sin(B(3)-pi/2)];% Small L
x3 = [l1(2)*cos(B(2)+pi/2),X,X+l2(2)*cos(A(2))];% Small L
y3 = [l1(2)*sin(B(2)+pi/2),Y+0,Y+l2(2)*sin(A(2))];% Small L
x4 = [l1(2)*cos(B(2))+l1(3)*cos(B(3)),l1(1)]; %Binary link
y4 = [l1(4)*sin(B(4)),0]; %Binary link
x5 = [X+l2(1),X+l2(2)*cos(A(2))+l2(3)*cos(A(3))];%Binary link
y5 = [Y,Y+l2(4)*sin(A(4))]; %Binary link
x6 = [X,X,X+l2(1),X+l2(1)];    % Pi beam
y6 = [Y,Y+l2(2)*2,Y+l2(2)*2,Y];% Pi beam
x7 = [0-b,l1(1)+b];%base
y7 = [0,0];%base

%% Plotting
 
h1 = plot(x1,y1,'b-o',x3,y3,'g-o',x5,y5,'k-o',x6,y6,'y',x,y,'b-o',x2,y2,'g-o',x7,y7,'r',x4,y4,'k-o');

title('Sylvester Kempe  mechanism Animation');
set(gca,'xtick',[],'ytick',[]);
set(h1,'LineWidth',3)
axis equal;
g = max(l1+l2);
axis([-1.5*g 1.7*g  -g/1.1 g*1.2]);

d=0;

end

