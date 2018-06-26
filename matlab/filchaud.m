function [pressiondynamique,temperature,vitessemean,y] = filchaud(dossier)
% dossier = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/DISA voie C1 bis'
% [pressiondynamique,temperature,vitessemean,y] = filchaud(dossier);

binaire = dir(fullfile(dossier,'*.bin'));
dat = dir(fullfile(dossier,'*.dat'));
fdat = fullfile(dossier,dat.name);
out = dir(fullfile(dossier,'*.out'));
fout = fullfile(dossier,out.name);
y = hauteur(fout);
polynome = calibration(fdat);
vitessemean = zeros(size(y));
pressiondynamique = zeros(size(y));
temperature = zeros(size(y));
for k = 1:length(binaire)
    file = fullfile(dossier,binaire(k).name);
    fileID = fopen(file,'r');
    A = fread(fileID,'float');
    fclose(fileID);
    la = length(A)/3;
    % len = fin - debut + 1
    % la = la - 1 + 1
    % la = lb - (la+1) + 1
    % lb = la + (la+1) - 1 = 2*la 
    % la = lc - (lb+1) + 1
    % lc = la + (lb+1) - 1 = la + lb = 3*la = length(A)
    lb = 2*la;
    pressiondynamique(k) = mean(A(1:la));
    temperature(k) = mean(A(la+1:lb));
    tension = A(lb+1:end);
    vitesse = polyval(polynome,tension);
    vitessemean(k) = mean(vitesse);
    %[u,v] = convergence(vitesse,floor(length(vitesse)/100));
    %figure(k)
    %plot(vitessemean,y)
    %hold on
  
end
end