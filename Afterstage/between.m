function [ia,ib] = between(x,k,npts)
% Donne une intervalle <[ia,ib]> de longueur <npts> tel que ia <= k <= b
% On cherche a avoir autant de point a gauche et a droite de <k> quand cela est possible
% 1 <= k <= length(x)
% 1 <= npts <= length(x)
% ia <= k <= ib && npts == ib - ia + 1
len = ceil(npts/2);
if k <= len
    ia = 1;
    ib = npts;
elseif length(x) - k + 1 <= npts - len 
    ib = length(x);
    ia = ib - npts + 1;
else
    % len == k - ia +1
    ia = k - len + 1;
    ib = npts + ia -1;
end
end
