function tha = gangle(m,side)
% pour point de gauche, side = true
% pour point de gauche, side = false
tha = zeros(size(m));
for ik = 1:length(m)
    if side
        if m(ik) < 0
            tha(ik) = 180 + atand(m(ik));
        else
            tha(ik) = atand(m(ik));
        end
    else
        if m(ik) < 0
            tha(ik) = -atand(m(ik));
        else
            tha(ik) = 180 - atand(m(ik));
        end
    end
end
end