% % Speakerwise classification after columnwise mean and std-dev
% % for test data
% 
% data = te_ms_sp;
% [a b] = size(data);
% j = 1; % speaker index
% m= 1; % frequency of speaker
% k= (-1); % digit index
% 
% % assign digit label
% for i = 1 : a
%     if mod(i,220)== 1
%        k=k+1;
%     end 
%         data(i,29) = k;
% 
% end
% c = [1:10]';% frequency of speaker
% 
% for i = 1:10:2191    
%  data(i:i+9,28) = c;    
%  end
% 
%  c = [1:220]';% frequency of digit
% 
% for i = 1:220:1981    
%  data(i:i+219,30) = c;    
% end
% 
% % Speaker label
%      d= zeros(10,1);
%      for i = 1:10:2191
%  if mod(i,220)== 1
%           d= ones(10,1);
%  end
%  data (i:i+9,27) = d;
%   d= d+1;
%      end
%      
%     test_sp = data ;
     
    %testing digit classification using knn
     
     
%Digit Classification

t1= str(:,1:26);
t2 = str(:,29);
t3 =  sval(:,1:26);
%ste = test_sp;
%t3 = ste(:,1:26);

% knn
error_dig =[];
for n= 50
j=0;
test_ = Nearest_Neighbor ( t1' , t2' , t3' ,n);
%test_ = EM ( t1' , t2' , t3' ,n);
%test_ = multisvm( t1' , t2' , t3');

for i = 1:660
if test_(i) ~= sval(i,29)
 j=j+1;
end
end

e = j/660*100;
error_dig = [error_dig [n;e]];
end

