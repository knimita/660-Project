   
resarr=textscan(fidres,'%2f%2f%4f%2f%2f%10.4f%10.4f%10.4f10.4f','whitespace','','delimiter','/n');
res= [datenum([resarr{:,3},resarr{:,2},resarr{:,1},resarr{:,4},resarr{:,5},zeros(size(resarr{:,1},1),1)]),resarr{:,6},resarr{:,7},resarr{:,8},resarr{:,9}];
