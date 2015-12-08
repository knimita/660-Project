% Multi output classification

% data division same as speaker classification


t1= tr(:,1:26);
t2_dig = tr(:,29);
t2_sp = tr(:,27);

%t =  val;
t = te;
t3 = t(:,1:26);
[aa bb] = size(t3);

error_sp_dig = [];
j=0;
% g = ones(66,1);
%  g= 1:66

for     n =  [1:10 79 81 82 90 100 500 560]
 test_dig = Nearest_Neighbor ( t1' , t2_dig' , t3' ,n);
  test_sp = Nearest_Neighbor ( t1' , t2_sp' , t3' ,n);
 
%test_ = EM ( t1' , t2' , t3' ,n);
%test_ = multisvm( t1' , t2' , t3');

test_ =[test_dig test_sp];

for i = 1:aa
if test_dig(i) == t(i,29)
    if test_sp (i)~= t(i,27)        
     j=j+1;
    end
    
    else
        j=j+1;
end
end

e  = j/aa*100;
error_sp_dig = [error_sp_dig [n(1);e]];
j=0;

end