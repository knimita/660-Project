% 
% 
% t1= tr(:,1:26);
% t2 = tr(:,27);
% t =  val;
% % t = te;
% t3 = t(:,1:26);
% [aa bb] = size(t3);
% 
% error_sp = [];
% j=0;
% g = ones(66,1);
%  
% for     n =  [g ]
% % test_ = Nearest_Neighbor ( t1' , t2' , t3' ,n);
% test_sp = EM ( t1' , t2' , t3' ,n);
% %test_ = multisvm( t1' , t2' , t3');
% 
% for i = 1:aa
% if test_sp(i) ~= t(i,27)
%  j=j+1;
% end
% end
% 
% e  = j/aa*100;
% error_sp = [error_sp [n(1);e]];
% j=0;
% 
% end


for tw = 1 : size(val) ;
t3 = val(tw,1:26);
[aa bb] = size(t3);
% get speaker of tw'th sample in validation as predicted above by EM

sp = test_sp(tw);

% get samples in the tr data corresponding to speaker sp

tr_digit = [];

for i = 1:size(tr)
    
    if tr(i,27) == sp
        tr_digit = [tr_digit; tr(i,:)];
    end
end

t1 = tr_digit(:,1:26);
t2 = tr_digit(:,29)

% train EM on samples corresponding to this speaker and try to get digit
% corresponding to tw

g = ones(10,1)
error_sp_dig = [];

n= [g+1]
test_dgt = EM (t1',t2',t3',n);

test_digit(tw) = test_dgt;
end

  


% 
%   
%  for i = 1:aa
%        if test_digit(i) == t(i,29)
%           if test_sp (i)~= t(i,27)        
%             j=j+1;
%           end
%      
%       else
%          j=j+1;
%        end
%     
%    
%       end
%             
%    e  = j/aa*100;
%    error_sp_dig = [error_sp_dig [n(1);e]];
%  j=0;
% 
% 
% 
% 
% 
