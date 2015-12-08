% label assignment

j=0; % label corresponding digit
k=1; % label block # corresponding to a digit
m=1; % label line # in the block
  
for i = 1: 269855

train(i,14)= j;
train(i,15) = k;
train(i,16)= m; 

if train(i,1) == 111111111
  m=1;  
k = k+1;
if mod(k,660)==1
    j=j+1;
    k=1;
end
else
    m=m+1;
    
end
end


% Speakerwise classification after columnwise mean and std-dev

data = train;
[a b] = size(data);
j = 1; % speaker index
m= 1; % frequency of speaker
k= (-1); % digiti index

for i = 1 : a
    if mod(i,660)== 1
       k=k+1;
    end 
        data(i,29) = k;

end
c = [1:10]';% frequency of speaker

for i = 1:10:6591    
 data(i:i+9,28) = c;    
 end

 c = [1:660]';% frequency of digit

for i = 1:660:5941    
 data(i:i+659,30) = c;    
end

     d= zeros(10,1);
     for i = 1:10:6591
 if mod(i,660)== 1
          d= ones(10,1);
 end
 data (i:i+9,27) = d;
  d= d+1;
     end

% for test

j=0; % label corresponding digit
k=1; % label block #
m=1; % label line # in the block


  
for i = 1: 89262

Test(i,14)= j;
Test(i,15) = k;
Test(i,16)= m; 

if Test(i,1) == 111111111
  m=1;  
k = k+1;
if mod(k,220)==1
    j=j+1;
    k=1;
end
else
    m=m+1;
end
end


% mean and standard deviation calculation
k=1; j=1; b=[];n=1;

for i = 1:269855
    
if train(i,1) == 111111111
   
   a = train(n:i-1, 1:13);
   m(j,:) = mean(a);
   s(j,:)=std(a);
   clear a
   n=i+1;
   j=j+1;

end
end
s(6600,:)=std(train(269824:269855,1:13));
m(6600,:)=mean(train(269824:269855,1:13));

% For testing data
% mean and standard deviation calculation
k=1; j=1; b=[];n=1;

for i = 1:89262
    
if Test(i,1) == 111111111
   
   a = Test(n:i-1, 1:13);
   m_te(j,:) = mean(a);
   s_te(j,:)=std(a);
   clear a
   n=i+1;
   j=j+1;

end
end
s_te(2200,:)=std(Test(89229:89262,1:13));
m_te(2200,:)=mean(Test(89229:89262,1:13));



% delet empty rows - corresponding to 111111111
%detect empty rows
a=[];
for i = 1: 269855
if train(i,1) == 111111111
    a=[a i];
end
end
% delete those
for i = 1:6599
train(a(i),:) =[];
a=a-1;
end

% Try 1 - first 2 digits

d1 = m(1:9,1:13);
d2 = m(661:669, 1:13);
tr_pa = [d1;d2];
t0 = zeros(9,1);
t1 = ones(9,1);
te_pa = [t0;t1];
test1 = [m(10,1:13); m(670,1:13)];
tr_pa =tr_pa';
te_pa = te_pa';
test1 = test1';

test = Bayesian_Model_Comparison( tr_pa , te_pa , test1, [9 9]);
test = EM( tr_pa , te_pa , test1, [1 3]); % second one not correct  

test_svm= SVM( tr_pa , te_pa , test1, '[''RBF'', 1, ''Lagrangian'', 1]'); % correctly classifioed

test_ppt= Perceptron( tr_pa , te_pa , test1, 100); % correctly classified


% first 3 digits

d1 = [m(1:659,:); ;m(661:1319,:) ; m(1321:1979,:)];
tr_pa = d1';
t0 = zeros(659,1);
t1= t0+1;
t2= t0+2;
te_pa = [t0;t1;t2];
te_pa = te_pa';
test1 = [ m(600,:) ; m(1320,:) ; m(1980,:)];
test1 = test1';

test_svm= SVM( tr_pa , te_pa , test1, '[''RBF'', 1, ''Lagrangian'', 1]'); % correctly classifioed
test_ppt= Perceptron( tr_pa , te_pa , test1, 100); % correctly classified

% TEST data, label assignment


j=0; % label corresponding digit
k=1; % label block #
m=1; % label line # in the block
  [a,b] = size(Test);
  
for i = 1: a

Test(i,14)= j;
Test(i,15) = k;
Test(i,16)= m; 

if Test(i,1) == 111111111
  m=1;  
k = k+1;
if mod(k,220)==1
    j=j+1;
end
else
    m=m+1;
end
end

% PPT and SVM

tr_pa = T' ;
tr_la = [zeros(660,1); ones(660,1);(1 + ones(660,1));(2+ ones(660,1));(3 + ones(660,1));(4+ ones(660,1));(5+ ones(660,1));(6+ ones(660,1));(7+ ones(660,1));(8+ ones(660,1))]';
test1 = Te';

test_svm= SVM( tr_pa , tr_la , test1, '[''RBF'', 1, ''Lagrangian'', 1]'); 

test_ppt= Perceptron( tr_pa , tr_la , test1, 50000); 

test_knn = Nearest_Neighbor ( tr_pa , tr_la , test1,20);