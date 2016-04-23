 %% ****************KDOM Project********************* 
 %  Sylvester-Kempe straight line mechanism
 %  For detailed report please read pdf copy attached.
 %  Dynamic simulation
 
 %  Note: By default the 4bars present in the mechanism is a crank rocker because of the input criterion.
 %  Hence many functions used in this may seem unnecessary.These functions
 %  are helpful only when the source code is tinkered to find data for non
 %  grashoff mechanism ,(ie) Worst case scenario.
 
%  Hence kempepro,Kempepostpro can be ignored.
%  hence a1 = A1
%        b1 = B1
 %%  Getting data from user
 clc;
 close all;
 clearvars;
 figH = figure;
 set(figH,'Name','Start Window','NumberTitle','off');
 
 H = imread('Sylvester kempe_0000.jpg');
 image(H);
 set(gca,'xtick',[],'ytick',[]);
 title('Sylvester kempe -Straight line mechanism');
 
 fprintf('\n \n \nPROJECT - Sylvester_Kempe straight line mechanism\n');
 fprintf('This matlab program is a simulation of the mechanism given the initial link lengths.\n');
 fprintf('Go through the pdf file for more information.\n');
 fprintf('Press enter to start\n');
 pause;
 close all;
 Z = imread('Capture.jpg');
 image(Z);
 fprintf('Look at the displayed picture!!!!\n');
 fprintf('Note : The link lengths specified are the default lengths of the program!!!!\n');
 fprintf('Now specify link lenghts accordingly \n');
 x = input('Link 1:');
 y = input('Link 2:');
 z = input('Link 3,4,5:');
 fprintf('Press Enter for finding data');
 pause;
 close all;
  %% Variable initialization.
 
  l1 = [z;y;x;z];  % Base 4 bar
  l2 = [z;x;y;z];  % Top  4 bar
%    l1 = [81;100;48;81]; % Main data 
%    l2 = [81;48;100;81]; % Main data
%    l1 = [8;10;5;8];     % Test data
%    l2 = [8;5;10;8];     % Test data
%    l1 = [4;10;3;4];     % Test data
%    l2 = [4;3;10;4];     % Test data

%%   Getting 4 bar data Using function Accu.m % Refer API for more details
     
    [B1,~] =  Accu(l1); % Function returns Angles of a FourBar Mechanism in degrees. 
    
%%  Conversion of angles from deg to rad

  B1 =B1*pi/180;

%% Data compiler2 :Refer API for more details

[ Data1,A1 ] = Datacompiler2(B1); %Function retuns angles of the sylvester kempe mechanism
                                        %Returns angles in degrees.
%%  Check ,Further analysis  -To obtain a straight line mechanism
  
    y1 =(- l2(2)*sin(A1(:,2)+pi/2)+l1(2)*sin(B1(:,2)+pi/2));   % Height of the straightline from the base
  
  
%% Processing - Obtains straightline mechanism ,segregates them into branches
%  * This section Just ensures the the data obtained is indeed a Sylvester kempe straight line mechanism
%  Hence this section can be ignored.
%  Result of this section is a1 =A1, b1=B1.
     
     [~,~,I1  ]= kempepro( A1,y1 );  % returns valid indices of a straight line mecahnism
      
      i=1;
      K(1) = 1;    % Variable holds various branches indices
      k1=1;
      k2=length(I1);
      while(1)
      i=i+1; 
     [k1,k2,flag]    =  Kempepostpro( I1(K(i-1):end) );
     
      K(i) = K(i-1)+length(k1);
      
       if(flag==1)
       break;
      end
      end
 
      
 % Final Data display 
     
     if(I1(1)~=0)
     f=1;  
     clc;
     if((length(K)-1)~=1)
     fprintf('There are %d branches !!!!:',length(K)-1);
     fprintf('\n Enter Choice of branch from %d to %d:',1,length(K)-1);
     inp = input('Choice:');
     for i=1:(length(K)-1)
     
         if(i==inp)
            b1= B1(I1(K(i)):I1(K(i+1)-1),1:4);
            a1= A1(I1(K(i)):I1(K(i+1)-1),1:4); 
             
         end
         
     
     end
     else
     fprintf('There are %d branches !!!!:',length(K)-1);
     b1= B1(I1(K(1)):I1(K(1+1)-1),1:4);
     a1= A1(I1(K(1)):I1(K(1+1)-1),1:4); 
     inp = 1;        
     end
     else
       f=0; 
     clc;
       fprintf('Solution for Sylvester kempe mecahnism doesnt exist for these Link lengths');
     end
    
     
%%   function for an infinite loop Animation ,(ie) Function Anim can be used for a never ending animation.
%    dummy = Anim( l1,l2,b1,a1,.01 ); Copy paste this function in the
%    command line to get an infinite loop animation

%% Creating a Playback

if (f~=0)
    clc;
fprintf('\n\n\nA play back is being created!!!!!!!!!!!!!!!!!!!\n');
 [M] = PlayBack( l1,l2,b1,a1 );
 
numtimes=3;
fps=25;
close all;
fprintf('\n Play back created!!!!!!!!!!!!!!!!!!!\n');
fprintf('\nMovie being played!!!!!!!!!!!!!!!!!!!\n');
figH = figure;
set(figH,'Name','Movie','NumberTitle','off');
% movie(M,numtimes,fps);
M = [M,M,M,M];
end
%%  Finding Range of motion
   if(f~=0)
   q = find(b1(:,2) == max(b1(:,2)));
   maxx = (- l2(2)*cos(a1(q,2)+pi/2)+l1(2)*cos(b1(q,2)+pi/2));
   q = find(b1(:,2) == min(b1(:,2)));
   minx = (- l2(2)*cos(a1(q,2)+pi/2)+l1(2)*cos(b1(q,2)+pi/2));
   end
  
   
   %% Generating an .avi file, log file, xls file for general purpose viewing


if (f~=0)
    close all;
     fprintf('Generating Video file, Log file ,Xl datasheet');
    v = VideoWriter('Sylvester_Kempe.avi','Uncompressed AVI');
  open(v);
  writeVideo(v,M);
  close(v);
  

fileID = fopen('log.txt','w');
fprintf(fileID,'\n%6s %6s %6s\n','link1','link2','link3');
fprintf(fileID,'%6.2f %6.2f %6.2f\n',x,y,z);
fprintf(fileID,'\n%6s\n','Branch:');
fprintf(fileID,'%6.2f',inp);
fprintf(fileID,'\n%20s %20s \n','Max X coordinate','Min X coordinate');
fprintf(fileID,'\n     %6.2f             %6.2f \n',maxx,minx);
fprintf(fileID,'\n%20s %20s \n','Max Theta2','Min Theta2');
fprintf(fileID,'\n     %6.2f             %6.2f \n',max(b1(:,2))*180/pi,min(b1(:,2))*180/pi);
fclose(fileID);
Head ={'Theta1','Theta2','Theta3','Theta4','Theta5','Theta6','Theta7','Theta8'};
xlswrite('Data',Head,'sectionI');
xlswrite('Data',[b1,a1]*180/pi,'sectionI','A1');
close all;
clc;
fprintf(' \nAn avi video file Sylvester_Kempe.avi has been generated for general purpose viewing,\n check the folder that contains the zip extract.\n'); 
fprintf(' \nA log file has been generated ,check the folder that contains the zip extract.\n\n');
fprintf(' \n A XL sheet has been generated regarding the angle configuration ,All angles in degrees\n');
end
 %%  Position Graphs
      if(f~=0)
     close all;
      b11 = mod(b1*180/pi,360);
      a11 = mod(a1*180/pi,360);
    plot(b11(:,2),b11(:,3),b11(:,2),b11(:,4),...
         b11(:,2),a11(:,2),b11(:,2),a11(:,3));
    title('Position graph');
    xlabel('Theta2 base 4 bar in degrees' );
    ylabel(' Angles of other links in degrees');
    legend('Theta3 - base 4 bar','Theta4 - base 4 bar','Theta2 - top 4 bar','Theta3 - top 4 bar');
fprintf(' \nGraph of angles of all links:\n');
    pause;
      end
%% Angular velocity
% W1 = bottom four bar angular velocities
% W2 = top four bar angular velocities
if(f~=0)
close all;
fprintf(' \nEnter angular velocity:\n');
w = input('');
w = [0,w,0,0];
[ W1 ,~ ] = Velacc( l1,b1,w );

W1(:,3:4) = W1;
W1(:,1) = zeros(length(W1(:,1)),1);
W1(:,2) = w(:,2)+zeros(length(W1(:,1)),1);
W2(:,1) = zeros(length(W1(:,1)),1);
W2(:,3) = zeros(length(W1(:,1)),1);
W2(:,4) = zeros(length(W1(:,1)),1);
W2(:,2) = W1(:,2)*l1(2)/l2(2).*sin(b1(:,2))./sin(a1(:,2));
[ W2(:,3:4) ,~ ] = Velacc( l1,b1,W2 );
fprintf('Angular velocity graph:');
close all;
plot(b11(:,2),W1(:,3),b11(:,2),W1(:,4),...
         b11(:,2),W2(:,2),b11(:,2),W2(:,3));

title(' Angular Velocity graph');
    xlabel('Theta2 base 4 bar in degrees' );
    ylabel(' Velocity of other links in rad/s');
    legend('link3 - base 4 bar','link4 - base 4 bar','link2 - top 4 bar','link3 - top 4 bar');
end