
% crée les fichiers : 
% epaisseurdeplacement.txt
% epaisseurquantitemouvement.txt
% coeffrottement.txt
% reynolds.txt
repertoire = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/DISA voie C1 bis'


mesdossiers = dir(repertoire);
len = length(mesdossiers);

U = [15;20;24;28];
epaisseurdeplacement = zeros(len-2,3);
epaisseurquantitemouvement = zeros(len-2,3);
coeffrottement = zeros(len-2,3);
nu = 1.5e-5;
xe = 0.55;
reynolds = U*xe/nu;
t = 0;
ferreur = @(a,b) round((abs(a-b)/a)*100,2);

% le dossier pour k = 1 est: le dossier est '.'
% '.'  == '/home/gbesseng/Documents/StageGuy/DISA voie C1 bis'
% le dossier pour k = 2 est: le dossier est '..'
% '..' == '/home/gbesseng/Documents/StageGuy/'
for k = 3:length(mesdossiers)
    dossier = fullfile(repertoire,mesdossiers(k).name);
    [pressiondynamique,temperature,vitessemean,y] = filchaud(dossier);
    [delta1,deltablasius1,delta2,deltablasius2,Cf,Cfblasius]  =  epaisseur(vitessemean,y);
    t = t+1;
    epaisseurdeplacement(t,1) = deltablasius1;
    epaisseurdeplacement(t,2) = delta1;
    epaisseurdeplacement(t,3) = ferreur(deltablasius1,delta1);
    epaisseurquantitemouvement(t,1) = deltablasius2;
    epaisseurquantitemouvement(t,2) = delta2;
    epaisseurquantitemouvement(t,3) = ferreur(deltablasius2,delta2);
    coeffrottement(t,1) = Cfblasius;
    coeffrottement(t,2) = Cf;
    coeffrottement(t,3) = ferreur(Cfblasius,Cf);
end
["deltablasius1","deltablasius1exp","erreur relative"]
epaisseurdeplacement
["deltablasius2","deltablasius2exp","erreur relative"]
epaisseurquantitemouvement
["Cfblasius","CfblasiusExp","erreur relative"]
coeffrottement
save('reynolds.txt','reynolds','-ascii')
save('epaisseurdeplacement.txt','epaisseurdeplacement','-ascii')
save('epaisseurquantitemouvement.txt','epaisseurquantitemouvement','-ascii')
save('coeffrottement.txt','coeffrottement','-ascii')