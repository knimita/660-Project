a=[];
[c b]= size(Test);

for i = 1: c
if Test(i,1) == 111111111
    a=[a i];
end
end
% delete those
for i = 1:2199
Test(a(i),:) =[];
a=a-1;
end


% averaging out to 4 rows each sample

j = 1;
Q  = [];
[a b]= size(Test);

num=nm;
data= Test;

for i=  1 : 1210
       
    A = data (j : j-1+num(i), 1:13);
    [a b] = size(A);
    
    for d = 1:4 
        
    if  mod(a,4) == 0
      Q = [Q; mean( A((1 : a/4 ),:)); mean( A(((1+a/4):a/2),:)) ; mean( A(((1+a/2): 3*a/4),:)) ; mean( A(((1+a*3/4):a),:)) ];
        break 
    else
        A(a,:) =[];  
            [a b] = size(A);

        
    end

    end
                        j = j+num(i);

end
    
j = 4845;


for i=  1212 : 1219
       
    A = data (j : j-1+num(i), 1:13);
    [a b] = size(A);
    
    for d = 1:4 
        
    if  mod(a,4) == 0
      Q = [Q; mean( A((1 : a/4 ),:)); mean( A(((1+a/4):a/2),:)) ; mean( A(((1+a/2): 3*a/4),:)) ; mean( A(((1+a*3/4):a),:)) ];
        break 
    else
        A(a,:) =[];  
            [a b] = size(A);

        
    end

    end
                        j = j+num(i);

end

j = 4881;


for i=  1221 : 2200
       
    A = data (j : j-1+num(i), 1:13);
    [a b] = size(A);
    
    for d = 1:4 
        
    if  mod(a,4) == 0
      Q = [Q; mean( A((1 : a/4 ),:)); mean( A(((1+a/4):a/2),:)) ; mean( A(((1+a/2): 3*a/4),:)) ; mean( A(((1+a*3/4):a),:)) ];
        break 
    else
        A(a,:) =[];  
            [a b] = size(A);

        
    end

    end
                        j = j+num(i);

end

% 1 sample 1 row
qq = Q;
 j=1;Te =[];
for i = 1: 2200
    k = j+1; n=j+2; m=j+3;
Te  = [ Te ; qq(j,:) qq(k,:) qq(n,:) qq(m,:)] ;
j = j+4;
    
end


% PPT and SVM , 2 digits

tr_pa = [T(1+6*660 : 8*660,:)  ]' ;
tr_la = [zeros(660,1); ones(660,1)]';
test1 = [m_te(220*6+1:220*8,:)]';

test_svm= SVM( tr_pa , tr_la , test1, '[''RBF'', 2, ''Lagrangian'', 2]'); 

test_ppt= Perceptron( tr_pa , tr_la , test1, 50000); 

