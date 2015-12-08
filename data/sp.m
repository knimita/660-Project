% %Speaker and digit labels for 26 featured data
% clear all
% clc
% load('test_sp.mat');
% load('speakerwise_6600.mat');

str = []; % speaker wise training data
ste =[]; % speakerwise testing data
sval = []; % speakerwise validation set
data = train;
[a b] = size(data);
j = 1; 

for  i = 1:10:a
   str = [str ; data(i:i+6, :)];
   ste = [ste ; data((i+8 : i+9 ) , : )];
   sval = [sval; data(i+7,:)]; 
end

% %Speaker Classification
% 
% t1= str(:,1:26);
% t2 = str(:,27);
% t3 =  sval(:,1:26);
%  %t3 = ste(:,1:26);
% [aa bb] = size(t3);
% %knn
% error_sp = [];
% %n = zeros(66,1);
% 
% for     n =  [1:10 65:70]
% j=0;
% test_ = Nearest_Neighbor ( t1' , t2' , t3' ,n);
% %test_ = EM ( t1' , t2' , t3' ,n);
% %test_ = multisvm( t1' , t2' , t3');
% 
% for i = 1:aa
% if test_(i) ~= sval(i,27)
%  j=j+1;
% end
% end
% 
% e  = j/aa*100;
% error_sp = [error_sp [n;e]];
% end
% 
% 
%%% Got 16.97% error for 20, 9.24% for 10, 8.48 for 5, 7.73 for 3, 5.78
%%% for 1,  8.48 for 2, 8.79 - 4 & 6, 8.94 - 7,  7.58
% 
%Digit Classification

t1= str(:,1:26);
t2 = str(:,29);
t3_all =  [ sval ; test_sp(1:1800,:) ];
%t3 = t3_all(:,1:26);
ste = test_sp(1801:2200,:);
t3 = ste(:,1:26);

[aa bb] = size(t3);

% knn
error_dig =[];
for n= [ 1:10 ]
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

min_sp = min(error_sp(2,:))
min_dig = min(error_dig(2,:))