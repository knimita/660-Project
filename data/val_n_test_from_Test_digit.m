% val and test set for digit

% ste_T = []; % test set
% sval_T = []; %  validation set
% data = test_sp;
% [a b] = size(data);
% j = 1; 
% 
% for  i = 1:10:a
%    ste_T = [ste_T ; data((i : i+2 ) , : )];
%    sval_T = [sval_T; data(i+3:i+9,:)]; 
% end


t1= str(:,1:26);
t2 = str(:,29);
%t3_all =  [ sval ; sval_T ];
%t3 = t3_all(:,1:26);
ste = ste_T;
t3 = ste(:,1:26);

[aa bb] = size(t3);

% knn
error_dig =[];
for n= [ 1:20 30 40 50 60 70 75 80 ]
j=0;
test_ = Nearest_Neighbor ( t1' , t2' , t3' ,n);
%test_ = EM ( t1' , t2' , t3' ,n);
%test_ = multisvm( t1' , t2' , t3');

for i = 1:aa
if test_(i) ~= ste(i,29)
 j=j+1;
end
end

e = j/aa*100;
error_dig = [error_dig [n;e]];
end

min_dig = min(error_dig(2,:))