clc
close all
dossiermat = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/Vitessedotmat/';
dossiertif = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/Vitesse/';
files = dir(fullfile(dossiermat,'*.mat'));
lenfiles = length(files)
diles = zeros(lenfiles,1);

for k = 1:lenfiles
    name = files(k).name;
    tab = strsplit(name,{'=','_'});
    diles(k) = str2double(tab{4});
end

[~,idiles] = sort(diles);


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
filename = 'alamainplot.tif';
filename2 = 'alamainimage.tif';
for j = 1:lenfiles
    k = idiles(j);
    name = files(k).name;
    tab = strsplit(name,{'=','_'});
    name = fullfile(dossiermat,name);
    [~,nametif] = fileparts(name);
    nametif = strcat(nametif, '.tif');
    nametif = fullfile(dossiertif,nametif);
    volume0 = string(tab(4));
    vitesse = string(tab(2));
    stitle  = sprintf('$\\frac{x_{y_{max}}-x_{r}}{x_{a}-x_{r}}$ pour $volume =%.3fmm$',volume0);
    t = 0;
    Legend = cell(0);
    load(name)
    leg = strcat('Vitesse = ',vitesse, 'm/s');
    t = t+1;
    Legend{t}= leg;
    t = t+1;
    Legend{t}= leg;
    rapport = (x_y_max-x_r)./(x_a-x_r);
    temps = numero_image;
    figure(fig)
    set(fig,'units','normalized','outerposition',[0 0 1 1])
    plot(temps,rapport,A(k,4),A(k,5),'d')
    xlim([min(temps) max(temps)])
    ylim([0 max(rapport)])
    xlabel('numero image','Interpreter','Latex','FontSize',14,'fontweight','bold')
    ylabel('$\frac{x_{y_{max}}-x_{r}}{x_{a}-x_{r}}$','Interpreter','Latex','FontSize',14,'fontweight','bold')
    title(stitle,'Interpreter','Latex','FontSize',14,'fontweight','bold')
    legend(Legend,'Location','northeastoutside','FontSize',10,'fontweight','bold')
    frame = getframe(fig);
    if j == 1
        imwrite(frame2im(frame),filename);
        imwrite(imread(nametif,numimage(k)),filename2);
    else
        imwrite(frame2im(frame),filename,'WriteMode','append');
        imwrite(imread(nametif,numimage(k)),filename2,'WriteMode','append');
    end
end
close all