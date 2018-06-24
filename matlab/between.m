function [ia,ib] = between(x,k,npts)
% 1 <= k <= length(x)
% 1 <= npts <= length(x)
% ia <= k <= ib && npts == ib - ia + 1
len = ceil(npts/2);
if k <= len
    ia = 1;
    ib = npts;
    ik = k;
elseif length(x) - k + 1 <= npts - len 
    ib = length(x);
    ia = ib - npts + 1;
else
    % len == k - ia +1
    ia = k - len + 1;
    ib = npts + ia -1;
end
end