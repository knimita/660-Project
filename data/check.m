%  
% % % dividing traindata in 1000 validation and 5000 training and 600 testing
% % %Speaker classification
% 
% data = train;
% [a b] = size(data);
% n1=1000; % # to separate out validationset from data
% n2 = 600; % same for test
% n=n1+n2; 
% r = randsample(a,n); 
% r1 = r(1:n1);
% r2 = r(n1+1:n);
% 
% r1 = sort(r1);
% r2 = sort(r2);
% 
% k=1;
% j=1;
%  val = [];
%  tr =[];
%  te =[];
%  
% for i = 1:a
%     
%     if  i ~= r1(k)
%         
%         if i ~= r2(j)
%                 tr = [tr; data(i,:)];
%         else
%             te = [te; data(i,:)];
%             j=j+1;
%             if j==(n2+1)
%                 j=1;
%             end
%         end
%         
%     else
%         val = [val; data(i,:) ];
%         k=k+1;
%         
%         if k == (n1+1)
%             k=1;
%         end
%         
%                 
%     end
%     
%     
% end


% %KNN and EM


t1= tr(:,1:26);
t2 = tr(:,27);
t =  val;
% t = te;
t3 = t(:,1:26);
[aa bb] = size(t3);

error_sp = [];
j=0;
g = ones(66,1);

% n=5 ; x=(1:2)'; % example
% g=repmat(x,1,n)';
% g=g(:);
 
for     n =  [ g+1 g]
% test_ = Nearest_Neighbor ( t1' , t2' , t3' ,n);
test_ = EM ( t1' , t2' , t3' ,n);
%test_ = multisvm( t1' , t2' , t3');

for i = 1:aa
if test_(i) ~= t(i,27)
 j=j+1;
end
end

e  = j/aa*100;
error_sp = [error_sp [n(1);e]];
j=0;

end