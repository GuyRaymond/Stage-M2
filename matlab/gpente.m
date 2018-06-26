function [mp,npts,found] = gpente(x,y,k,n,dth) 
% [mp,npts,found] = gpente(x,y,k,n,dth) 
% Donne la pente <mp> de la tangente au point (x(k),y(k)) de la courbe courbe (x,y)
% <npts> est le nombre de points utilise pour trouver 2 droites dont les angles entre eux different d au plus <dth>
% <found> est vraie ou true si on a trouve la tangente est avec la precision <dth>
% <n> est le degre du polynome avec lequel on interpole les points autour du point (x(k),y(k))
found = false;
npts = max(n+1,max(0.7*floor(length(x)/100),10));
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