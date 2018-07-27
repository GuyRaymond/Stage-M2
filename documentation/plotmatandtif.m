function plotmatandtif(fichiermat,fichiertif,pas)
clc
close all
if nargin == 0
    lafonction = 'plotmatandtif(fichiermat,fichiertif,pas)'
    fichiermat =  '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/Vitessedotmat/vitesse=28_volume=0.09_pression=473_temperature=22.6.mat'
    fichiertif = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/Vitesse/vitesse=28_volume=0.09_pression=473_temperature=22.6.tif'
    pas = 25
end
[~,namemat] = fileparts(fichiermat)
[~,nametif] = fileparts(fichiertif)

if 0 ==  all(namemat == nametif)
    error('fichiermat et fichiertif ne se correspondent pas')
end

warning('off','all')
load(fichiermat,'numero_image','u_c','v_c','u_t_a','v_t_a','u_t_r','v_t_r')
for k = 1:pas:length(numero_image)
    u = u_c{k};
    v = u_c{k};
    n_start = numero_image(k);
    sfig  = sprintf("%s.tif à l'image %d",nametif, n_start);
    Ibw=imread(fichiertif,n_start);
    fig = figure(k);
    set(fig,'Name',sfig);
    imshow(Ibw,[min(min(Ibw)),max(max(Ibw))])
    hold on
    plot(u_c{k},v_c{k},'-b',u_t_a{k},v_t_a{k},'-r',u_t_r{k},v_t_r{k},'-m');
    hold off
    pause(1)
    close all
end