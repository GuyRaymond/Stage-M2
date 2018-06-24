close all
%clear all
clc
repertoire = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/DISA voie C1 bis'
mesdossiers = dir(repertoire);
len = length(mesdossiers);
Legend=cell(len-2,1);
plotStyle = {'b.-','r.-','m.-','c.-','g.-','k.-','y.-','b--','r-','m-','c--','g--','y-','k-'};
blasius = xlsread('HttBlassius.xls');
nu = 1.5e-5;
xe = 0.55;

for k = 3:length(mesdossiers)
    dossier = fullfile(repertoire,mesdossiers(k).name)
    [pressiondynamique,temperature,vitessemean,y] = filchaud(dossier);
    %vinf = max(vitessemean)
    p1 = polyfit(vitessemean(1:3),y(1:3),1);
    offset = polyval(p1,0);
    y = y - offset;
    vinf = mean(vitessemean(end-2:end));
    rex = vinf*xe/nu;
    delta = (xe/sqrt(rex))*1000;
    plot(vitessemean/vinf,y/delta,plotStyle{k-2})
    hold on
    xlim([0,1.01])
    ylim([0,5])
    Legend{k-2}=mesdossiers(k).name;
end
plot(blasius(:,3),blasius(:,1),'k-')
hold off
xlabel({'$\frac{U}{U_{\infty}}$'},'Interpreter','latex')
ylabel('y')
%ylabel({'$y$'},'Interpreter','latex')
%legend(Legend)
legend(Legend,'Location','northwest')