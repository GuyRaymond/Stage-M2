function [u,v] = convergence(y,n)
u = 1:n:length(y);
v = zeros(length(u),1);
for k = 1:length(u)
    v(k) = mean(y(1:u(k)));
end
end