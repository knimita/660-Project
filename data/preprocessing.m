
% max and min number of frames in the data set
% train

data = train;
[a,b] = size(data);
nm=[];

for i = 1:a
    if data(i,1)==111111111
     nm = [nm data((i-1),16)];   
    end
end

% test 

data = Test;
[a,b] = size(data);
nm=[];

for i = 1:a
    if data(i,1)==111111111
     nm = [nm data((i-1),16)];   
    end
end



%  Processing inequal # frames : Divinding each sample frames into 4,
%  averaging out over each

clear all 
clc
 load tr_num ;
 
j = 1;
Q  = [];

for i= 1 : 3696
       
    A = train (j : j-1+num(i), 1:13);
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
                        j = j+num(i)+ 1;

    end

Q  = [Q; train(147479 : 147482,1:13)];  % only 4 frames, so added seprately

j = 147484; %  continuing

num(6600) = 32;

for i= 3698 : 6600 
       
    A = train (j : j-1+num(i), 1:13);
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
                        j = j+num(i)+ 1;

end

% 1 sample 1 row
 j=1;T =[];
for i = 1: 6600
    k = j+1; n=j+2; m=j+3;
T  = [ T ; qq(j,:) qq(k,:) qq(n,:) qq(m,:)] ;
j = j+4;
    
end

%  add labels to this matrix

j=1; k =0; 
for i = 1 : 10
    
    Q(j : i*660*4, 14) = k;
    k=k+1;    
    j = 660*4*i+1;
end


j=1; k =1; 
for i = 1 : 6600
    
    Q(j : i*4, 15) = k;
    
    if mod(k,660)==0
        k =1;
    else
            k=k+1;    

    end
    
    j = 4*i+1;
end


% prepro for testing
 %1
j = 1;
Q  = [];
[a b]= size(Test);
num=nm;
data= Test;

for i= 1 : 2200
       
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
                        j = j+num(i)+ 1;

    end

% first two digits 650 samples each for train

k=0; j =0;
for i = 1:9

    x = i*660;
    y = i*220;
tr_pa = [T ( (1+k):(x+660),: ) ]' ;

k= 660+x; 

tr_la = [zeros(660,1); ones(660,1)]';

test1 = [m_te( (1+j):(y+220),: ) ]';
j=220+y;


test_svm (i,:) = SVM( tr_pa , tr_la , test1, '[''RBF'', 2, ''Lagrangian'', 2]'); 
test_ppt (i,:) = Perceptron( tr_pa , tr_la , test1, 50000); 

end

test_em = EM( tr_pa , tr_la , test1, [1 3]); 
test_BM = Bayesian_Model_Comparison( tr_pa , tr_la , test1, [9 9]);


% first three digits

test_svm= SVM( tr_pa , tr_la , test1, '[''RBF'', 1, ''Lagrangian'', 1]'); % correctly classifioed
test_ppt= Perceptron( tr_pa , tr_la , test1, 100); % correctly classified





