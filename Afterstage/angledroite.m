function [o1,o2,u1,v1,u2,v2] = angledroite(u,v,n,dth)
% [o1,o2,u1,v1,u2,v2] = angledroite(u,v,n,dth)
% donne les angles o1 et o2 des tangentes (u1,v1) et (u2,v2) au points
% (u(1),v(1)) et (u(end),v(end)) de le la courbe(u,v)
% La tangente au point (u(1),v(1)) est la courbe (u1,v1)
% La tangente au point (u(end),v(end)) est la courbe (u2,v2)
% n est degre du polynomes
% dth precision sur l'angle

[m1,npts,found] = gpente(u,v,1,n,dth);
[u1,v1] = droite2(u(1),u(end),v(1),m1,true);

[m2,npts,found] = gpente(u,v,length(u),n,dth);
[u2,v2] = droite2(u(1),u(end),v(end),m2,false);

o1 = gangle(m1,true);
o2 = gangle(m2,false);
end