function [ B1,C1 ] = Accu( l1 )
%% Accu -'Accurate'
%  Used for finding the limits of a 4 bar mechanism with accuray better than Datacompiler function. 
%  Input  : Link lengths
%  Output : Various configurations of theta,

%  This function uses the crank rocker configuration to get the accurate
%  output if such a configuration exists.
%%  Unfortunately Data compiler doesnt yield complete results due to obvious limitations.
% Hence another program to accurately find the limits of the mechanism.
%% Variable initialization
    t = 0;  % We dont want any visual feedback.
   [d,L] = Grashoff( l1 ) ;
   
   [B1,C1] = Datacompiler( L,t ) ;
   
    B1 = Branch(L,B1); 
%% Program
if(d==1)
if(find(l1==min(l1))==3)
D1 = B1 -[B1(:,4),B1(:,4),B1(:,4),B1(:,4)];
D1(:,1) = 180+D1(:,1);
D1(:,3) = D1(:,3)+180;
K1 = [D1(:,4),D1(:,1:3)];
K1 = mod(K1,360);
if(K1(3,2) >180.0)
K1 = mod(-K1,360);
B1 = K1;
else
K1 = mod(K1,360);
B1 = K1;
end
end
elseif(find(l1==min(l1))==2)
 
 K1 = mod(B1,360);
 if(K1(3,2) >180.0)
 K1 = mod(-K1,360);
 B1 = K1;
 else
 K1 = mod(K1,360);
 B1 = K1;
 end
 
 elseif(find(l1==min(l1))==4)
  K1(:,3) = -B1(:,3);
  K1(:,4) = 180-B1(:,4);
  K1(:,2) = 180-B1(:,2);
  K1(:,1) = B1(:,1);
  B1=K1;
end


end
