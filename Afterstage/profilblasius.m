%dessine le profile de blasius et les profils experimentaux
close all
clc
repertoire = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/DISA voie C1 bis';
mesdossiers = dir(repertoire);
len = length(mesdossiers);
Legend=cell(len-2,1);
plotStyle = {'b.-','r.-','m.-','c.-','g.-','k.-','y.-','b--','r-','m-','c--','g--','y-','k-'};
blasius = xlsread('HttBlassius.xls');
nu = 1.5e-5;
xe = 0.55;
t = 0;
for k = 3:length(mesdossiers)
    t = t+1;
    dossier = fullfile(repertoire,mesdossiers(k).name)
    [pressiondynamique,temperature,vitessemean,y] = filchaud(dossier);
    p1 = polyfit(vitessemean(1:3),y(1:3),1);
    offset = polyval(p1,0);
    y = y - offset;
    vinf = mean(vitessemean(end-2:end));
    rex = vinf*xe/nu;
    delta = (xe/sqrt(rex))*1000;
    plot(vitessemean/vinf,y/delta,plotStyle{k-2})
    hold on
    xlim([0,1.01])
    ylim([0,7])
    Legend{t}=strcat('U = ',mesdossiers(k).name);
end
t = t+1;
Legend{t}= 'Blasius';
plot(blasius(:,3),blasius(:,1),'k-')
xlim([0,1.01])
ylim([0,7])
xlabel({'$\frac{u}{U_{\infty}}$'},'Interpreter','latex','fontweight','bold','fontsize',32)
ylabel({'$\frac{y}{\delta}$'},'Interpreter','latex','fontweight','bold','fontsize',32)
title('Profil de Blasius et expérimentaux')
text(0.3,4,{'$$\left(\frac{u}{U_{\infty}},\frac{y}{\delta}\right)$, $x=0.55m$, $\delta = \frac{x}{\sqrt{Re_{x}}}$$'},'Interpreter','latex')
legend(Legend,'Location','northwest')