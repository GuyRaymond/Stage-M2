function [r,t,irt] = intersection2dpoints(x,y,u,v)
lx = length(x);
xy = zeros(lx,2);
xy(:,1) = x(:);
xy(:,2) = y(:);
[sxy,ixy] = sortrows(xy);
lu = length(u);
uv = zeros(lu,2);
uv(:,1) = u(:);
uv(:,2) = v(:);
[suv,iuv] = sortrows(uv);
lr = min(lx,lu);
irt = zeros(lr,6);
ix = 1;
iu = 1;
ir = 0;
while ix <= lx && iu <= lu
    if (sxy(ix,1) == suv(iu,1)) && (sxy(ix,2) == suv(iu,2))
        ir = ir+1;
        irt(ir,1) = ixy(ix);
        irt(ir,2) = iuv(iu);
        ix = ix+1;
        iu = iu+1;
    elseif sxy(ix,1) < suv(iu,1)
        ix = ix+1;
    else
        iu = iu+1;   
    end
end
irt = irt(1:ir,:);
ks = sort(irt(1:ir,1));
r = x(ks);
t = y(ks);
irt(:,3) = x(irt(:,1));
irt(:,4) = y(irt(:,1));
irt(:,5) = u(irt(:,2));
irt(:,6) = v(irt(:,2));
end