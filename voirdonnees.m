function voirdonnees(cheminverstif,fichiermat)
clc
close all
[~,namemat] = fileparts(fichiermat);
namemat = strcat(namemat,'.tif');
Stack_name = fullfile(cheminverstif,namemat);
load(fichiermat)
length(numero_image)
ns = 1:length(numero_image);
% plot(ns,theta_a,'r.-',ns,theta_r,'m.-')
% figure;
% plot(ns,theta_a,'r.-')
% figure;
% plot(ns,theta_r,'m.-')
% figure;
% plot(ns,dist_a_r,'b.-')
% figure;
% plot(ns,x_y_max,'b.-')
% figure;
% plot(ns,abs(x_a-2560),'b.-')

for k = 1:length(numero_image)
    u = u_c{k};
    v = u_c{k};
    length(u)
    n_start = numero_image(k)
    xa = x_a(k)
    ya = y_a(k)
    xr = x_r(k)
    yr = y_r(k)
    ym = y_max(k)
    xym = x_y_max(k)
    dar = dist_a_r(k)
    oa = theta_a(k)
    or = theta_r(k)
    Ibw=imread(Stack_name,n_start);
    figure(n_start)
    imshow(Ibw,[min(min(Ibw)),max(max(Ibw))])
    hold on
    plot(u_c{k},v_c{k},'-b',u_t_a{k},v_t_a{k},'-r',u_t_r{k},v_t_r{k},'-m');
    hold off
    pause(1)
    close all
end
end