function [M] = PlayBack( l1,l2,B,A)
%% Function for Playback of  a sylvester kempe mechanism. 
%**************API******************
% input arguments :
% l1 = length of base four bar members
% l2 = length of top four bar members
% B = theta of base in rad
% A = theta of top in rad
% t = speed of animation    % Any value less than .014 wont give reasonable
%                             results (ie) 71 fps.

% output :
%  Creates a play back 
% ***********************************

%% Functions used 
% Plot( lengths,theta)

%% Variable initialization
% d = choice of branch
i = 1; % Iter number 

s = 1; %  frame step 
c = 0; %  no of cycles count ,function stops after a cycle.  
f = 0; %  Frame number
[m,~] = size(B);

%% Main Program
 while(1)
        if(m~=1)   
       f=f+1;     
    
            if((i==m))
             
             if ((abs(B(i,2)-359)<=.1) && (abs(B(1,2)-1)<=.1))
             i=1;s=1;
             
             else
             s=-1;
             end
             
            end
             if(i ==1)
             c = c+1;
             s=1;
             end 
             
             e  =  Plot( l1,l2,B(i,:),A(i,:));

    M(f) = getframe;  % Getting a single frame
    hold off;
  if(c==2)
      break;
  end
  i = i + s;
         
        else
            e  =  Pl( l1,l2,B(1,:),A(1,:));
        M(1) = getframe;
        break;
        end
 end
 end




