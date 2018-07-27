clc
close all
vitesse = 28;
svitesse = sprintf('=%d',vitesse);
stitle  = sprintf('$\\frac{x_{y_{max}}-x_{r}}{x_{a}-x_{r}}$ pour $vitesse %s$',svitesse);
spng  = sprintf('alamain_allure_general_vitesse=%d',vitesse);
dossiermat = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/Vitessedotmat/';
dossiertif = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/Vitesse/';

files = dir(fullfile(dossiermat,'*.mat'));
lenfiles = length(files);
diles = zeros(lenfiles,1);

for k = 1:lenfiles
    name = files(k).name;
    tab = strsplit(name,{'=','_'});
    diles(k) = str2double(tab{4});
end

[diles,idiles] = sort(diles);

filename = 'alamain.txt';
A = importdata(filename);
[ra,ca] = size(A);
B = zeros(ra,2);
B(:,1) =  A(:,2);
B(:,2) =  A(:,1);
[B,Ib] = sortrows(B);
A = A(Ib,:);
numimage = floor(A(:,4)); 

fps = 50;
millimetre = 10;
pixel = 433;
facteur = millimetre/pixel;

temps = zeros(lenfiles,1);
volume = zeros(lenfiles,1);
rapport = zeros(lenfiles,1);
rapport2 = zeros(lenfiles,1);
t = 0;
for j = 1:lenfiles
    k = idiles(j);
    name = files(k).name;
    tab = strsplit(name,{'=','_'});
    name = fullfile(dossiermat,name);
    [~,nametif] = fileparts(name);
    nametif = strcat(nametif, '.tif');
    nametif = fullfile(dossiertif,nametif);
    load(name)
    if contains(name,svitesse)
        t = t+1;
        rap = (x_y_max-x_r)./(x_a-x_r);
        chute = rap(1)-0.1;
        lim = find(rap < chute,1);
        if isempty(lim)
            lim = length(rap);
        end
        [xm,ixm] = max(rap(1:lim));
        temps(t) = numero_image(ixm)/fps;
        rapport(t) = rap(ixm);
        rapport2(t) = A(k,5);
        volume(t) = str2double(tab{4});
    end
end
rapport = rapport(1:t);
rapport2 = rapport2(1:t);
temps = temps(1:t);
volume = volume(1:t);
plot(volume,rapport,'o-',volume,rapport2,'d-')
xlabel('$volume(ml)$','Interpreter','Latex','FontSize',14,'fontweight','bold')
ylabel('$\frac{x_{y_{max}}-x_{r}}{x_{a}-x_{r}}$','Interpreter','Latex','FontSize',14,'fontweight','bold')
title(stitle,'Interpreter','Latex','FontSize',14,'fontweight','bold')
legend({'Critère de code','Pris à la main'},'Location','northeastoutside','FontSize',10,'fontweight','bold')
set(gcf,'units','normalized','outerposition',[0 0 1 1])
print(gcf,spng,'-dpng')