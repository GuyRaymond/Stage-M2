close all
clear all
clc
repertoire = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/DISA voie C1 bis'
mesdossiers = dir(repertoire);
len = length(mesdossiers);
res = zeros(len-2,6);
erreur = zeros(len-2,3);
d1 = zeros(len-2,3);
d2 = zeros(len-2,3);
d3 = zeros(len-2,3);
t = 0;
ferreur = @(a,b) round((abs(a-b)/a)*100,2);
for k = 3:length(mesdossiers)
    dossier = fullfile(repertoire,mesdossiers(k).name);
    [pressiondynamique,temperature,vitessemean,y] = filchaud(dossier);
    [delta1,deltablasius1,delta2,deltablasius2,Cf,Cfblasius]  =  epaisseur(vitessemean,y);
    t = t+1;
    res(t,1) = delta1;
    res(t,2) = deltablasius1;
    erreur(t,1) = ferreur(deltablasius1,delta1);
    res(t,3) = delta2;
    res(t,4) = deltablasius2; 
    erreur(t,2) = ferreur(deltablasius2,delta2);
    res(t,5) = Cf;
    res(t,6) = Cfblasius;
    erreur(t,2) = ferreur(Cfblasius,Cf);
    d1(t,1) = deltablasius1;
    d1(t,2) = delta1;
    d1(t,3) = ferreur(deltablasius1,delta1);
    d2(t,1) = deltablasius2;
    d2(t,2) = delta2;
    d2(t,3) = ferreur(deltablasius2,delta2);
    d3(t,1) = Cfblasius;
    d3(t,2) = Cf;
    d3(t,3) = ferreur(Cfblasius,Cf);
end

res
erreur
d1
d2
d3
save('resfile.txt','res','-ascii')
save('erreurfile.txt','erreur','-ascii')
save('delta1.txt','d1','-ascii')
save('delta2.txt','d2','-ascii')
save('Cf.txt','d3','-ascii')
