while (~feof(fid_t))
                temp1 = fgetl(fid_t);
                if isempty(temp1) 
                    break; 
                end
                   inputtext=textscan(temp1, formatstring,...
                'delimiter',',')
                   temp_out=[inputtext{:}];
                  Data(end+1,:)=temp_out;
end
           



help isnan
 isnan  True for Not-a-Number.
    isnan(X) returns an array that contains 1's where
    the elements of X are NaN's and 0's where they are not.
    For example, isnan([pi NaN Inf -Inf]) is [0 1 0 0].
 
    See also isfinite, isinf.

    Overloaded methods:
       codistributed/isnan
       gpuArray/isnan
       sym/isnan

    Reference page in Help browser
       doc isnan

