function [delta1,deltablasius1,delta2,deltablasius2,Cf,Cfblasius] =  epais(v,y)
vinf = mean(v(end-2:end));
k = find(0.99*vinf <= v,1);
p1 = polyfit(v(1:3),y(1:3),1);
offset = polyval(p1,0);
y = 0.001*(y-offset);
y(:) = y(end:-1:1);
ly = length(y);
y(ly+1) = 0;
y(:) = y(end:-1:1);
v(:) = v(end:-1:1);
lv = length(v);
v(lv+1) = 0;
v(:) = v(end:-1:1);

p2 = polyfit(v(1:3),y(1:3),1);
offset2 = polyval(p2,0)
vovinf = v/vinf;
fvovinf = 1 - vovinf;
delta1 = trapz(y, fvovinf);
delta2 = trapz(y, fvovinf .*vovinf);
nu = 1.5e-5;
xe = 0.55;
rex = vinf*xe/nu;
deltablasius1  = 1.72*xe/sqrt(rex);
deltablasius2  = 0.664*xe/sqrt(rex);

Cf = (2/rex)*diff(vovinf/vinf)./diff(y/xe);
Cf = Cf(1);
Cfblasius = 0.664*xe/sqrt(rex);

end