% % EM
% 
% 
% %Digit Classification
% 
t1= str(:,1:26);
t2 = str(:,29);
t3 =  sval(:,1:26);
%t3 = ste(:,1:26);
% 
% % EM
% error_dig =[];
% n=zeros(10,1);
% for i= 1:5
%     n=n+i;
% j=0;
% %test_ = Nearest_Neighbor ( t1' , t2' , t3' ,n);
% test_ = EM ( t1' , t2' , t3' ,n);
% 
% for i = 1:660
% if test_(i) ~= sval(i,29)
%  j=j+1;
% end
% end
% 
% e = j/660*100;
% error_dig = [error_dig e];
% end
% 
test_ = multisvm( t1 , t2 , t3);
