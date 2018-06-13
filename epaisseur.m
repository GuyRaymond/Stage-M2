function [delta1,deltablasius1,delta2,deltablasius2,Cf,Cfblasius] = epaisseur(vitessemean,z)
% dossier = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/DISA voie C1 bis'
% [pressiondynamique,temperature,vitessemean,z] = filchaud(dossier);
% [delta1,deltablasius1,delta2,deltablasius2,Cf,Cfblasius] = epaisseur(vitessemean,z)

% calcul du offset
vinf = mean(vitessemean(end-2:end));
p1 = polyfit(vitessemean(1:3),z(1:3),1);
offset = polyval(p1,0);

% rajout du point (0,0) pour (vitessemean,z)
lz = length(z);
lvm = length(vitessemean);
y = zeros(1+lz,1);
v = zeros(1+lvm,1);
y(2:end) = 0.001*(z-offset);
v(2:end) = vitessemean(:);


vovinf = v/vinf;
fvovinf = 1 - vovinf;
nu = 1.5e-5;
xe = 0.55;
rex = vinf*xe/nu;

delta1 = trapz(y, fvovinf);
delta2 = trapz(y, fvovinf .* vovinf);
Cf = (2*xe/(rex*vinf))*v(2)/y(2);


deltablasius1  = 1.72*xe/sqrt(rex);
deltablasius2  = 0.664*xe/sqrt(rex);
Cfblasius = 0.664/sqrt(rex);

end