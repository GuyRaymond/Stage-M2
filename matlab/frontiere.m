function [u,v] = frontiere(Ibw)

B=bwboundaries(Ibw);
[~,Im] = sort(cellfun(@(x) numel(x),B),'descend'); 

if 0 < length(Im)
    boundary=B{Im(1)}; %selection du bon contour (celui qui a le plus de point)
    boundary=boundary(:,[2 1]); %remise des X et Z dans le bon ordre
    u = boundary(:,1);
    v = boundary(:,2);
else
    u = [];
    v = [];
end
end