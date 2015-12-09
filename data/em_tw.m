% 
% 
t1= tr(:,1:26);
t2 = tr(:,29);
%t =  val;
 t = te;
t3 = t(:,1:26);
[aa bb] = size(t3);

error_sp = [];
j=0;
%g = ones(66,1);
 
for     n =  [1 ]
 test_d = Nearest_Neighbor ( t1' , t2' , t3' ,n);
%test_sp = EM ( t1' , t2' , t3' ,n);
%test_ = multisvm( t1' , t2' , t3');


end

aa = 0;

for tw = 1 : size(t) ;
t3 = t(tw,1:26);
aa = aa+1;
% get speaker of tw'th sample in validation as predicted above by EM

dig = test_d(tw);

% get samples in the tr data corresponding to speaker sp

tr_spkr = [];

for i = 1:size(tr)
    
    if tr(i,29) == dig
        tr_spkr = [tr_spkr; tr(i,:)];
    end
end

t1 = tr_spkr(:,1:26);
t2 = tr_spkr(:,27);

% train EM on samples corresponding to this speaker and try to get digit
% corresponding to tw

% g = ones(10,1)

test_spkr = Nearest_Neighbor (t1',t2',t3',n);

test_speaker(tw) = test_spkr;
end

  


j=0;
  error_sp_dig = [];

 for i = 1:aa
       if test_speaker(i) == t(i,27)
          if test_d (i)~= t(i,29)        
            j=j+1;
          end
     2;
      else
         j=j+1;
       end
    
   
      end
            
   e  = j/aa*100






