function [ W,a ] = Velacc( l,t,w )
%%                     Velocity
%               lengths*theta' = 0 
% l(2)*sin(t(2))*w(2)+l(3)*sin(t(3))*w(3)-l(4)*sin(t(4))*w(4) = 0;
% l(2)*cos(t(2))*w(2)+l(3)*cos(t(3))*w(3)-l(4)*cos(t(4))*w(4) = 0;
  

%%            Main propgram
              G =[l(3)*sin(t(:,3)),-l(4)*sin(t(:,4))];
              H =[ l(3)*cos(t(:,3)),-l(4)*cos(t(:,4))]; 
              I = [l(2)*sin(t(:,2)).*w(:,2),l(2)*cos(t(:,2)).*w(:,2)];
              I = -1*I;

              for i=1:length(t)
               if(norm([G(i,:);H(i,:)])~=0)
                  W(i,:) =   (([G(i,:);H(i,:)])\[I(i,1);I(i,2)])' ;
               else
                   W(i,:)=0;
               end
               
              end
              
%%    Acelleration equation
% l3*sin(theta3)*theta3''-l4*sin(theta4)*theta4''+l2*cos(theta2)*(theta2')^2+l3*cos(theta3)*(theta3')^2-l4*cos(theta4)*(theta4')^2=0
% l3*cos(theta3)*theta3''-l4*cos(theta4)*theta4''-l2*sin(theta2)*(theta2')^2-l3*sin(theta3)*(theta3')^2+l4*sin(theta4)*(theta4')^2=0

A = [sin(t(:,3))*l(3),-sin(t(:,4))*l(4)];
B = [cos(t(:,3))*l(3),-cos(t(:,4))*l(4)];
% Q = [l(2)*cos(t(:,2))*(w(2))^2+l(3)*cos(t(:,3)).*((W(:,1)).^2) -l(4)*cos(t(:,4)).*((W(:,2)).^2) ,-l(2)*sin(t(:,2))*(w(2))^2-l(3)*sin(t(:,3)).*((W(:,1)).^2) +l(4)*sin(t(:,4)).*((W(:,2)).^2)];
% Q = -1*Q
% pause;
a = zeros(length(t),2);
for i=1:length(t)
      Q = [(l(2)*cos(t(i,2))*(w(2))^2 + l(3)*cos(t(i,3))*((W(i,1))^2)  -1* l(4)*cos(t(i,4))*((W(i,2)).^2)),(-1*l(2)*sin(t(i,2))*(w(2))^2-1*l(3)*sin(t(i,3))*((W(i,1))^2) +l(4)*sin(t(i,4))*((W(i,2))^2))];
      Q = -1*Q;
       
      if(norm([A(i,:);B(i,:)])~=0)
                  a(i,:) =   (([A(i,:);B(i,:)])\[Q(1);Q(2)])'; 
                  
               else
                  a(i,:)=0;
     end
               
end
end

