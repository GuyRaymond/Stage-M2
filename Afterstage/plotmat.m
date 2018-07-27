function plotmat(fichiermat)
% plotmat(cheminverstif,fichiermat)
% fonction sans aucune sous fonction
% plot respectivement
% plot(temps,theta_a,'r.-',temps,theta_r,'m.-')
% plot(temps,dist_a_r,'b.-')
% plot(temps,x_a,'r.-',temps,x_r,'m.-',temps,dist_a_r,'b.-')
% plot(temps,x_y_max,'b.-')
% plot(temps,x_a,'r.-',temps,x_r,'m.-',temps,x_y_max,'b.-')
% plot(temps,(x_a-x_y_max)./(x_a-x_r),'b.-')
% plot(temps,y_max/y_max(1),'b.-')
% plot(temps,y_max,'b.-')
clc
close all

if nargin == 0
    lafonction = 'plotmat(fichiermat)'
    fichiermat =  '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/Vitessedotmat/vitesse=28_volume=0.001_pression=473_temperature=23.7.mat'
end

[~,namemat] = fileparts(fichiermat);
namemat = strcat(namemat,'.tif');

load(fichiermat, 'theta_a', 'theta_r', 'x_a','y_a','x_r','y_r',...
    'y_max','x_y_max','dist_a_r','numero_image')

temps = numero_image;

millimetre = 10;
pixel = 433;
facteur = millimetre /pixel;
fps = 50;
temps = temps;

y_max = y_max*facteur;
x_y_max = x_y_max*facteur;
x_a = x_a*facteur;
x_r = x_r*facteur;
dist_a_r = dist_a_r*facteur;

fig = figure;
set(fig,'Name',namemat);
plot(temps,theta_a,'r.-',temps,theta_r,'m.-')
xlabel('$t(s)$','Interpreter','Latex','FontSize',16)
ylabel('$\theta_{a}$, $\theta_{r}$','Interpreter','Latex','FontSize',16)
title('$\theta_{a}(t)$, $\theta_{r}(t)$','Interpreter','Latex','FontSize',16)
legend({'$\theta_{a}(t)$','$\theta_{r}(t)$'},'Interpreter','Latex',...
    'FontSize',16,'TextColor','blue','Location','northeastoutside')

fig = figure;
set(fig,'Name',namemat);
plot(temps,dist_a_r,'b.-')
xlabel('$t(s)$','Interpreter','Latex','FontSize',16)
ylabel('$d_{ar}$','Interpreter','Latex','FontSize',16)
title('$d_{ar}(t)$','Interpreter','Latex','FontSize',16)

fig = figure;
set(fig,'Name',namemat);
plot(temps,x_a,'r.-',temps,x_r,'m.-',temps,dist_a_r,'b.-')
xlabel('$t(s)$','Interpreter','Latex','FontSize',16)
ylabel('$x_{a}$, $x_{r}$, $d_{ar}$','Interpreter','Latex','FontSize',16)
title('$x_{a}(t)$, $x_{r}(t)$, $d_{ar}(t)$','Interpreter','Latex','FontSize',16)
legend({'$x_{a}(t)$','$x_{r}(t)$', '$d_{ar}(t)$'},'Interpreter','Latex',...
    'FontSize',16,'TextColor','blue','Location','northeastoutside')

fig = figure;
set(fig,'Name',namemat);
set(fig,'Name',namemat);
plot(temps,x_y_max,'b.-')
xlabel('$t(s)$','Interpreter','Latex','FontSize',16)
ylabel('$x_{y_{max}}$','Interpreter','Latex','FontSize',16)
title('$x_{y_{max}}(t)$','Interpreter','Latex','FontSize',16)

fig = figure;
set(fig,'Name',namemat);
plot(temps,x_a,'r.-',temps,x_r,'m.-',temps,x_y_max,'b.-')
xlabel('$t(s)$','Interpreter','Latex','FontSize',16)
ylabel('$x_{a}$, $x_{r}$, $x_{y_{max}}$','Interpreter','Latex','FontSize',16)
title('$x_{a}(t)$, $x_{r}(t)$, $x_{y_{max}}(t)$','Interpreter','Latex','FontSize',16)
legend({'$x_{a}(t)$','$x_{r}(t)$', '$x_{y_{max}}(t)$'},'Interpreter','Latex',...
    'FontSize',16,'TextColor','blue','Location','northeastoutside')

fig = figure;
set(fig,'Name',namemat);
plot(temps,(x_y_max-x_r)./(x_a-x_r),'b.-')
xlabel('$t(s)$','Interpreter','Latex','FontSize',16)
ylabel('$\frac{x_{a} - x_{y_{max}}}{x_{a} - x_{r}}$','Interpreter','Latex','FontSize',16)
title('$\frac{x_{a} - x_{y_{max}}}{x_{a} - x_{r}}$','Interpreter','Latex','FontSize',16)

fig = figure;
set(fig,'Name',namemat);
plot(temps,y_max/y_max(1),'b.-')
xlabel('$t(s)$','Interpreter','Latex','FontSize',16)
ylabel('$\frac{y_{max}}{y_{max}(t = 0)}$','Interpreter','Latex','FontSize',16)
title('$\frac{y_{max}(t)}{y_{max}(t = 0)}$','Interpreter','Latex','FontSize',16)

fig = figure;
set(fig,'Name',namemat);
plot(temps,y_max,'b.-')
xlabel('$t(s)$','Interpreter','Latex','FontSize',16)
ylabel('$y_{max}$','Interpreter','Latex','FontSize',16)
title('$y_{max}(t)$','Interpreter','Latex','FontSize',16)

end