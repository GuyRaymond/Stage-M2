
% plot(volume,vitesse)
clc
close all
dossier = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/Vitessedotmat/';
[nomsdescolonnes,donnees] = nomdesfichiersendonnees(dossier)
donnees = sortrows(donnees)
A = donnees(:,1)
B = donnees(:,2)
[C,ia] = unique(A)
xc = donnees(ia,2)
yc = donnees(ia,1)
figure
plot(B,A,'b.')
hold on
plot(xc,yc,'bo-')
ylabel('$vitesse(\frac{m}{s})$','Interpreter','Latex','FontSize',16)
xlabel('$volume(ml)$','Interpreter','Latex','FontSize',16)
title('vitesse(volume)','FontSize',16)
print(gcf,'volumevitesse','-dpng')
savefig(gcf,'volumevitesse.fig')


% title('$volume(ml)$','Interpreter','Latex','FontSize',16)
figure
plot(A,B,'b.')
hold on
plot(yc,xc,'bo-')
xlabel('$vitesse(\frac{m}{s})$','Interpreter','Latex','FontSize',16)
ylabel('$volume(ml)$','Interpreter','Latex','FontSize',16)
title('volume(vitesse)','FontSize',16)
print(gcf,'vitessevolume','-dpng')
savefig(gcf,'vitessevolume.fig')