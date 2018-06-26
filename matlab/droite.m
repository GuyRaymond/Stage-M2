function [x,y] = droite(x1,x2,y12,m,side)
% x1 < X2
% pour (x1,y12), side = true
% pour (x2,y12), side = fase
len = x2-x1+1;
if side
    if m < 0
        % len = x1 - x3 + 1
        x3 = x1 - len + 1;
        x = linspace(x3,x1,len); 
    else
        x = linspace(x1,x2,len); 
    end
    y = m*(x-x1) + y12;
else
    if m < 0
        x = linspace(x1,x2,len); 
    else
        % len = x3 - x2 + 1
        x3 = x2 + len - 1;
        x = linspace(x2,x3,len);         
    end
    y = m*(x-x2) + y12;
end
end