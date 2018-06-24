function [u,v] = mid(x,y)
ia = 1;
ib = length(x);
ic = 0;
u = zeros(size(x));
v = zeros(size(y));
while ia <= ib
    ic = ic+1;
    v(ic) = (y(ia)+y(ib))/2;
    if x(ia) == x(ib)
        u(ic) = x(ia);
    else
        u(ic) = (x(ia)+x(ib))/2.0;
    end
    ia = ia+1;
    ib = ib-1;
end
u = u(1:ic);
v = v(1:ic);
end