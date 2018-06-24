function [o1,o2,u,v,u1,v1,u2,v2] = stage(Ibw)

B=bwboundaries(Ibw);
[~,Im] = sort(cellfun(@(x) numel(x),B),'descend'); 
boundary=B{Im(1)}; %selection du bon contour (celui qui a le plus de point)
boundary=boundary(:,[2 1]); %remise des X et Z dans le bon orxlim([xmi xma])
x = boundary(:,1);
y = boundary(:,2);

[u,v] = mid(x,y);
%[u,v] = tourne(u,v);

n = 1; % degre du polynomes
dth = 0.5; %precision sur l'angle

[m1,npts,found] = gpente(u,v,1,n,dth);

[u1,v1] = droite(u(1),u(end),v(1),m1,true);
[m2,npts,found] = gpente(u,v,length(u),n,dth)
[u2,v2] = droite(u(1),u(end),v(end),m2,false);
o1 = gangle(m1,true);
o2 = gangle(m2,false);
end