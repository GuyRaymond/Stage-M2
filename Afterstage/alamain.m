clc
close all
dossiermat = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/Vitessedotmat/';
dossiertif = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/Vitesse/';
files = dir(fullfile(dossiermat,'*.mat'));
lenfiles = length(files);
diles = cell(lenfiles,1);

for k = 1:lenfiles
    name = files(k).name;
    tab = strsplit(name,'_');
    diles{k} = strjoin([tab(2),tab(1),tab(3:end)],'_');
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
j = 1;
fig = 1;
idx = 0;
filename = 'alamain.tif';
while (j <= lenfiles)
    fig = fig + 1;
    k = idiles(j);
    name = files(k).name;
    tab = strsplit(name,{'=','_'});
    volume0 = string(tab(4));
    vitesse = string(tab(2));
    stitle  = sprintf('$\\frac{x_{y_{max}}-x_{r}}{x_{a}-x_{r}}$ pour $volume =%.3fmm$',volume0);
    spng  = sprintf('rapportvolume = %.3fmm',volume0);
    sfig  = sprintf('rapportvolume = %.3fmm.fig',volume0);
    t = 0;
    Legend = cell(0);
    while (j <= lenfiles)
        k = idiles(j);
        name = files(k).name
        tab = strsplit(name,{'=','_'});
        volume = string(tab(4));
        vitesse = string(tab(2));
        if volume == volume0
            name = fullfile(dossiermat,name);
            load(name)
            leg = strcat('Vitesse = ',vitesse, 'm/s');
            t = t+1;
            Legend{t}= leg;
            t = t+1;
            Legend{t}= leg;
            rapport = (x_y_max-x_r)./(x_a-x_r);
            chute = rapport(1)-0.1;
            lim = find(rapport < chute,1);
            if isempty(lim)
                lim = length(rapport);
            end
            [xm,ixm] = max(rapport(1:lim));
            temps = numero_image;
            figure(fig)
            set(fig,'units','normalized','outerposition',[0 0 1 1])
            plot(temps,rapport,A(k,4),A(k,5),'d')
            hold on
            xlabel('numero image','Interpreter','Latex','FontSize',14,'fontweight','bold')
            ylabel('$\frac{x_{y_{max}}-x_{r}}{x_{a}-x_{r}}$','Interpreter','Latex','FontSize',14,'fontweight','bold')
            title(stitle,'Interpreter','Latex','FontSize',14,'fontweight','bold')
            legend(Legend,'Location','northeastoutside','FontSize',10,'fontweight','bold')
        else
            break
        end
        print(fig,spng,'-dpng')
        savefig(fig,sfig)
        frame = getframe(fig);
        idx = idx+1;
        if idx == 1
            imwrite(frame2im(frame) ,filename);
        else
            imwrite(frame2im(frame),filename,'WriteMode','append');
        end        
        j = j+1;
    end
end