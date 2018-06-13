close all
clear all
clc
repertoire = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/DISA voie C1 bis'
mesdossiers = dir(repertoire);
len = length(mesdossiers);
res = zeros(len-2,6);
t = 0;
for k = 3:length(mesdossiers)
    dossier = fullfile(repertoire,mesdossiers(k).name);
    [pressiondynamique,temperature,vitessemean,y] = filchaud(dossier);
    [delta1,deltablasius1,delta2,deltablasius2,Cf,Cfblasius]  =  epaisseur(vitessemean,y);
    t = t+1;
    res(t,1) = delta1;
    res(t,2) = deltablasius1;
    res(t,3) = delta2;
    res(t,4) = deltablasius2;                                                                                                                                                                                                                                                                                             
    res(t,5) = Cf;
    res(t,6) = Cfblasius;
end
res