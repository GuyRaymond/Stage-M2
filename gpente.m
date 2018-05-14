function [mp,npts,found] = gpente(x,y,k,n,dth) 

found = false;
npts = max(9,n+1);
[a,b] = between(x,k,npts);
pol = polyfit(x(a:b)-x(k),y(a:b),n);
mc = pol(end-1); % pente
mp = mc;
while (npts < length(x)) && (~found)
    npts = npts+1;
    mp = mc;
    [a,b] = between(x,k,npts);
    pol = polyfit(x(a:b)-x(k),y(a:b),n);
    mc = pol(end-1);
    found = abs(atand(abs((mp-mc)/(1+mp*mc)))) < dth;
end

end
