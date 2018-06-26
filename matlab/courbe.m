clear all
clc
close all
dossieroulire= '/home/gbesseng/Documents/StageGuy/matlab/Debit/';
motif = 'pression=365';
motif2 = 'volume=0.06';
files = dir(fullfile(dossieroulire,'*.mat'));
len = length(files);
Legend=cell(1,1);
plotStyle = {'b.-','r.-','m.-','c.-','g.-','k.-',...
    'b+-','r+-','m+-','c+-','g+-','y+-','k+-',...
    'bd-','rd-','md-','cd-','gd-','yd-','kd-'};
t = 0;
millimetre = 10;
pixel = 433;
facteur = millimetre/pixel;
xc = 2560;
yc = 377;
x0 =0;
y0 = 394;
poly = polyfit([x0 xc],[y0 yc],1);
ligne = @(xm,ym) polyval(poly,xm)-ym;
vit = sqrt(2*365/1.2);

stitle  = sprintf('$volume = 0.06ml$ et $pression =365Pa$ $\\sim vitesse =%.2f \\frac{m}{s}$',vit)
%stitle = 'Pression = $365Pa$';
sxlabel = '$t (s)$';
tps = 0
xa = 0
xr = 0;
dar= 0;
for k = 1:len
    name = files(k).name;
    if contains(name,motif) && contains(name,motif2)
        name
        Stack_name = fullfile(dossieroulire,name);
        load(Stack_name)      
        ik = find(x_a==1,1)
        if ~isempty(ik)
            t = t+1;
            temps = numero_image/50;
            tab = strsplit(name,{'=','_'});
            volume = tab{4};
            leg = strcat('debit = ',tab{2}, 'ml/s');
            %leg = strcat('Volume = ',volume);
            Legend{t}= leg;
            dist_a_r = dist_a_r(1:ik)*facteur;
            x_a = (2560-x_a(1:ik))*facteur;
            x_r = (2560-x_r(1:ik))*facteur;
            y_max = ligne(x_y_max,y_max);
            y_max = y_max(1:ik)*facteur;
            x_y_max = (2560-x_y_max(1:ik))*facteur;
            theta_a = theta_a(1:ik);
            theta_r = theta_r(1:ik);
            ithr = find(theta_r < 140);
            temps = temps(1:ik);
            figure(1)
            plot(temps,dist_a_r,'o-')
            title({stitle},'Interpreter','latex','fontweight','bold','fontsize',16)
            xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
            ylabel({'d (mm)'},'Interpreter','latex','fontweight','bold','fontsize',24)
            legend(Legend,'Location','northeastoutside')
            hold on
            figure(2)
            plot(temps,x_a,'o-')
            title({stitle},'Interpreter','latex','fontweight','bold','fontsize',16)
            xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
            ylabel({'$x_{a}$(mm)'},'Interpreter','latex','fontweight','bold','fontsize',24)
            legend(Legend,'Location','northeastoutside')
            hold on
            figure(3)
            plot(temps,x_r,'o-')
            title({stitle},'Interpreter','latex','fontweight','bold','fontsize',16)
            xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
            ylabel({'$x_{r}$(mm)'},'Interpreter','latex','fontweight','bold','fontsize',24)
            legend(Legend,'Location','northeastoutside')
            hold on
            figure(4)
            plot(temps,theta_a,'o-')
            title({stitle},'Interpreter','latex','fontweight','bold','fontsize',16)
            xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
            ylabel({'$\theta_{a}$'},'Interpreter','latex','fontweight','bold','fontsize',24)
            legend(Legend,'Location','northeastoutside')
            hold on
            if 0 == mod(t,2)
                figure(5)
                plot(temps,theta_a,'o-')
                title({stitle},'Interpreter','latex','fontweight','bold','fontsize',16)
                xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
                ylabel({'$\theta_{a}$'},'Interpreter','latex','fontweight','bold','fontsize',24)
                legend(Legend,'Location','northeastoutside')
                hold on
            else
                figure(6)
                plot(temps,theta_a,'o-')
                title({stitle},'Interpreter','latex','fontweight','bold','fontsize',16)
                xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
                ylabel({'$\theta_{a}$'},'Interpreter','latex','fontweight','bold','fontsize',24)
                legend(Legend,'Location','northeastoutside')
                hold on
            end
            figure(7)
            plot(temps(ithr),theta_r(ithr),'o-')
            title({stitle},'Interpreter','latex','fontweight','bold','fontsize',16)
            xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
            ylabel({'$\theta_{r}$'},'Interpreter','latex','fontweight','bold','fontsize',24)
            legend(Legend,'Location','northeastoutside')
            hold on
            if 0 == mod(t,2)
                figure(8)
                plot(temps(ithr),theta_r(ithr),'o-')
                title({stitle},'Interpreter','latex','fontweight','bold','fontsize',16)
                xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
                ylabel({'$\theta_{r}$'},'Interpreter','latex','fontweight','bold','fontsize',24)
                legend(Legend,'Location','northeastoutside')
                hold on
            else
                figure(9)
                plot(temps(ithr),theta_r(ithr),'o-')
                title({stitle},'Interpreter','latex','fontweight','bold','fontsize',16)
                xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
                ylabel({'$\theta_{r}$'},'Interpreter','latex','fontweight','bold','fontsize',24)
                legend(Legend,'Location','northeastoutside')
                hold on
            end
            figure(10)
            plot(temps,y_max,'o-')
            title({stitle},'Interpreter','latex','fontweight','bold','fontsize',16)
            xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
            ylabel({'$y_{max}$(mm)'},'Interpreter','latex','fontweight','bold','fontsize',24)
            legend(Legend,'Location','northeastoutside')
            hold on
            figure(11)
            plot(temps,x_y_max,'o-')
            title({stitle},'Interpreter','latex','fontweight','bold','fontsize',16)
            xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
            ylabel({'$x_{y_{max}}$(mm)'},'Interpreter','latex','fontweight','bold','fontsize',24)
            legend(Legend,'Location','northeastoutside')
            hold on
            if 3 == t
            figure(12)
            plot(temps,x_a,'o-',temps,x_r,'o-',temps,dist_a_r,'o-')
            tle = strcat(stitle,' et volume = ',volume)
            title({tle},'Interpreter','latex','fontweight','bold','fontsize',16)
            xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
            ylabel({'$x_{a}$(mm), $x_{r}$(mm), d(mm)'},'Interpreter','latex','fontweight','bold','fontsize',24)
            legend({'$x_{a}(mm)$','$x_{r}$(mm)','d(mm)'},'Interpreter','latex','Location','northeastoutside')
            figure(13)
            plot(temps(ithr),theta_a(ithr),'o-',temps(ithr),theta_r(ithr),'o-')
            title({tle},'Interpreter','latex','fontweight','bold','fontsize',16)
            xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
            ylabel({'$\theta_{a}$, $\theta_{r}$'},'Interpreter','latex','fontweight','bold','fontsize',24)
            legend({'$\theta_{a}$','$\theta_{r}$'},'Interpreter','latex','Location','northeastoutside')
            figure(14)
            plot(temps,theta_a,'o-',temps,x_a,'o-')
            title({tle},'Interpreter','latex','fontweight','bold','fontsize',16)
            xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
            ylabel({'$\theta_{a}$, $x_{a}$(mm)'},'Interpreter','latex','fontweight','bold','fontsize',24)
            legend({'$\theta_{a}$','$x_{a}$(mm)'},'Interpreter','latex','Location','northeastoutside')
            figure(15)
            plot(temps(ithr),theta_r(ithr),'o-',temps(ithr),x_r(ithr),'o-')
            title({tle},'Interpreter','latex','fontweight','bold','fontsize',16)
            xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
            ylabel({'$\theta_{r}$, $x_{r}$(mm)'},'Interpreter','latex','fontweight','bold','fontsize',24)
            legend({'$\theta_{r}$','$x_{r}$(mm)'},'Interpreter','latex','Location','northeastoutside')
            end
        end
    end
end

dossieroulire= '/home/gbesseng/Documents/StageGuy/matlab/Vitesse/';
for k = 1
    name = 'vitesse=24_volume=0.06_pression=349_temperature=23.6.mat';
        Stack_name = fullfile(dossieroulire,name);
        load(Stack_name)      
        ik = find(x_a==1,1)
        if ~isempty(ik)
            t = t+1;
            temps = numero_image/50;
            leg = 'debit = 0';
            %leg = strcat('Volume = ',volume);
            Legend{t}= leg;
            dist_a_r = dist_a_r(1:ik)*facteur;
            x_a = (2560-x_a(1:ik))*facteur;
            x_r = (2560-x_r(1:ik))*facteur;
            y_max = ligne(x_y_max,y_max);
            y_max = y_max(1:ik)*facteur;
            x_y_max = (2560-x_y_max(1:ik))*facteur;
            theta_a = theta_a(1:ik);
            theta_r = theta_r(1:ik);
            ithr = find(theta_r < 140);
            temps = temps(1:ik);
            figure(1)
            plot(temps,dist_a_r,'o-')
            title({stitle},'Interpreter','latex','fontweight','bold','fontsize',16)
            xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
            ylabel({'d (mm)'},'Interpreter','latex','fontweight','bold','fontsize',24)
            legend(Legend,'Location','northeastoutside')
            hold on
            figure(2)
            plot(temps,x_a,'o-')
            title({stitle},'Interpreter','latex','fontweight','bold','fontsize',16)
            xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
            ylabel({'$x_{a}$(mm)'},'Interpreter','latex','fontweight','bold','fontsize',24)
            legend(Legend,'Location','northeastoutside')
            hold on
            figure(3)
            plot(temps,x_r,'o-')
            title({stitle},'Interpreter','latex','fontweight','bold','fontsize',16)
            xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
            ylabel({'$x_{r}$(mm)'},'Interpreter','latex','fontweight','bold','fontsize',24)
            legend(Legend,'Location','northeastoutside')
            hold on
            figure(4)
            plot(temps,theta_a,'o-')
            title({stitle},'Interpreter','latex','fontweight','bold','fontsize',16)
            xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
            ylabel({'$\theta_{a}$'},'Interpreter','latex','fontweight','bold','fontsize',24)
            legend(Legend,'Location','northeastoutside')
            hold on
            if 0 == mod(t,2)
                figure(5)
                plot(temps,theta_a,'o-')
                title({stitle},'Interpreter','latex','fontweight','bold','fontsize',16)
                xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
                ylabel({'$\theta_{a}$'},'Interpreter','latex','fontweight','bold','fontsize',24)
                legend(Legend,'Location','northeastoutside')
                hold on
            else
                figure(6)
                plot(temps,theta_a,'o-')
                title({stitle},'Interpreter','latex','fontweight','bold','fontsize',16)
                xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
                ylabel({'$\theta_{a}$'},'Interpreter','latex','fontweight','bold','fontsize',24)
                legend(Legend,'Location','northeastoutside')
                hold on
            end
            figure(7)
            plot(temps(ithr),theta_r(ithr),'o-')
            title({stitle},'Interpreter','latex','fontweight','bold','fontsize',16)
            xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
            ylabel({'$\theta_{r}$'},'Interpreter','latex','fontweight','bold','fontsize',24)
            legend(Legend,'Location','northeastoutside')
            hold on
            if 0 == mod(t,2)
                figure(8)
                plot(temps(ithr),theta_r(ithr),'o-')
                title({stitle},'Interpreter','latex','fontweight','bold','fontsize',16)
                xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
                ylabel({'$\theta_{r}$'},'Interpreter','latex','fontweight','bold','fontsize',24)
                legend(Legend,'Location','northeastoutside')
                hold on
            else
                figure(9)
                plot(temps(ithr),theta_r(ithr),'o-')
                title({stitle},'Interpreter','latex','fontweight','bold','fontsize',16)
                xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
                ylabel({'$\theta_{r}$'},'Interpreter','latex','fontweight','bold','fontsize',24)
                legend(Legend,'Location','northeastoutside')
                hold on
            end
            figure(10)
            plot(temps,y_max,'o-')
            title({stitle},'Interpreter','latex','fontweight','bold','fontsize',16)
            xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
            ylabel({'$y_{max}$(mm)'},'Interpreter','latex','fontweight','bold','fontsize',24)
            legend(Legend,'Location','northeastoutside')
            hold on
            figure(11)
            plot(temps,x_y_max,'o-')
            title({stitle},'Interpreter','latex','fontweight','bold','fontsize',16)
            xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
            ylabel({'$x_{y_{max}}$(mm)'},'Interpreter','latex','fontweight','bold','fontsize',24)
            legend(Legend,'Location','northeastoutside')
            hold on
            if 3 == t
            figure(12)
            plot(temps,x_a,'o-',temps,x_r,'o-',temps,dist_a_r,'o-')
            tle = strcat(stitle,' et volume = ',volume)
            title({tle},'Interpreter','latex','fontweight','bold','fontsize',16)
            xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
            ylabel({'$x_{a}$(mm), $x_{r}$(mm), d(mm)'},'Interpreter','latex','fontweight','bold','fontsize',24)
            legend({'$x_{a}(mm)$','$x_{r}$(mm)','d(mm)'},'Interpreter','latex','Location','northeastoutside')
            figure(13)
            plot(temps(ithr),theta_a(ithr),'o-',temps(ithr),theta_r(ithr),'o-')
            title({tle},'Interpreter','latex','fontweight','bold','fontsize',16)
            xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
            ylabel({'$\theta_{a}$, $\theta_{r}$'},'Interpreter','latex','fontweight','bold','fontsize',24)
            legend({'$\theta_{a}$','$\theta_{r}$'},'Interpreter','latex','Location','northeastoutside')
            figure(14)
            plot(temps,theta_a,'o-',temps,x_a,'o-')
            title({tle},'Interpreter','latex','fontweight','bold','fontsize',16)
            xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
            ylabel({'$\theta_{a}$, $x_{a}$(mm)'},'Interpreter','latex','fontweight','bold','fontsize',24)
            legend({'$\theta_{a}$','$x_{a}$(mm)'},'Interpreter','latex','Location','northeastoutside')
            figure(15)
            plot(temps(ithr),theta_r(ithr),'o-',temps(ithr),x_r(ithr),'o-')
            title({tle},'Interpreter','latex','fontweight','bold','fontsize',16)
            xlabel({sxlabel},'Interpreter','latex','fontweight','bold','fontsize',24)
            ylabel({'$\theta_{r}$, $x_{r}$(mm)'},'Interpreter','latex','fontweight','bold','fontsize',24)
            legend({'$\theta_{r}$','$x_{r}$(mm)'},'Interpreter','latex','Location','northeastoutside')
            end
        end
end

