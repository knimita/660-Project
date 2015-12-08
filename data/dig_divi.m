% 
% 
% % dividing traindata in 1000 validation and 5600 training
% 
% data = train;
% [a b] = size(data);
% n=1000; % # to separate out from data
% 
%  %% %%% %%%r = randsample(a,n); 
%  r = sort(r);
%  k=1;
%  val_dig = [];
%  tr_dig =[];
%  
% for i = 1:a
%     
%     if  i == r(k)
%         val_dig = [val_dig; data(i,:) ];
%         k=k+1;
%         if k == n+1
%             k=1;
%         end
%         
%     else
%     tr_dig = [tr_dig; data(i,:)];
%     end
% end


% %KNN
% 
% 
% t1= tr_dig(:,1:26);
% t2 = tr_dig(:,29);
% %t= val_dig;
% t= test_sp;
% t3 =  t(:,1:26);
% [aa bb] = size(t3);
% 
% error_dig = [];
% j=0;
% 
% for     n =  [1: 10 560 ]
%  test_ = Nearest_Neighbor ( t1' , t2' , t3' ,n);
% % test_ = EM ( t1' , t2' , t3' ,n);
% %test_ = multisvm( t1' , t2' , t3');
% 
% for i = 1:aa
% if test_(i) ~= t(i,29)
%  j=j+1;
% end
% end
% 
% e  = j/aa*100;
% error_dig = [error_dig [n;e]];
% j=0;
% 
% end


% same datasets as speaker classification

t1= tr(:,1:26);
t2 = tr(:,29);
%t =  val;
 t = te;
t3 = t(:,1:26);
[aa bb] = size(t3);

error_B_dig = [];
j=0;
% g = ones(66,1);
%  g= 1:66
for     n =  [1:10 79 81 82 90 100 500 560]
 test_ = Nearest_Neighbor ( t1' , t2' , t3' ,n);
%test_ = EM ( t1' , t2' , t3' ,n);
%test_ = multisvm( t1' , t2' , t3');

for i = 1:aa
if test_(i) ~= t(i,29)
 j=j+1;
end
end

e  = j/aa*100;
error_B_dig = [error_B_dig [n(1);e]];
j=0;

end