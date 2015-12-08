% rowwise mean
% for train

data = train;
[a,b] = size(data);
jj=1; %speaker
mm = 1; % count

for   i = 1 : a
       data(i,17) = mean(data(i,1:13) ) ;
       data(i,18) = std(data(i,1:13) ) ;
    
%            if data(i,13) == 111111111
%                mm= mm+1;
%                
%                       if mod(mm , 10)==1 
% 
%            mm=1; jj = jj+1;
%            end
%        
%           if mod(jj,66)==0
%        jj=1;
%        end
%            end
%          data(i,19)= jj;
%        data(i,20) = mm;
end

 train = data;
 
 

 % for test
 
data = Test;
[a,b] = size(data);

for   i = 1 : a
       data(i,17) = mean(data(i,1:13) ) ;
       data(i,18) = std(data(i,1:13) ) ;

end
 Test = data;
 
 