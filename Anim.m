function [e] = Anim( l1,l2,B,A,t )
%% Function for animation of a sylvester kempe mechanism. 
%**************API******************
% input arguments :
% l1 = length of base four bar members
% l2 = length of top four bar members
% B = Base four bar Angles
% A = top four bar Angles
% t = speed of animation    % Any value less than .014 wont give reasonable
%                             results (ie) 71 fps.

% output :
% Animates the motion
% ***********************************

%% Functions used 
% Plot( lengths,theta)
%% Main Program

% d = choice of branch
i = 1; % Iter number 

s = 1; % step
    
 while(1)
             if((i==size(B,1)))
        
             if ((abs(B(i,2)-359/180*pi)<=.9) && (abs(B(1,2)-1/180*pi)<=.9))
             i=1;s=1;
             
             else
             s=-1;
             end
             
            end
         if(i ==1)
             
             s=1;
         end
         
  
         e  =  Plot( l1,l2,B(i,:),A(i,:));

    hold off;
     i = i + s;
     if(t~=0)
      pause(t);
     end

 end
e=0;         
end



