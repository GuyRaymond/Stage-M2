close all
clear all
clc

%Nom et proprietes du stack d'image
Stack_name='V70_tr10_rate3164_couper-lines.tif';
Stack_info=imfinfo(Stack_name);
Stack_length=size(Stack_info,1) % nombre d'image du stack
theta = zeros(2,Stack_length);
ns = 1:Stack_length;

for n_start = ns
    
    I1=imread(Stack_name,n_start);
    I2=double(I1);

    [yc,xc] = size(I2);
    x1 = [0 0 1098 xc xc];
    y1 = [yc 896 0 0 yc];
    mask = poly2mask(x1, y1, yc,xc); 

    [Gx,Gy] = imgradientxy(I2);    
    [IS, ~] = imgradient(Gx, Gy);%[Gmag, Gdir] = imgradient(Gx, Gy);
    IS=immultiply(IS,mask);
    seuil = 20000;
    Ibw=IS;
    Ibw(Ibw<seuil)=0; %seuillage
    Ibw(Ibw~=0)=1; %seuillage
    [o1,o2,u,v,u1,v1,u2,v2] = stage(Ibw);
    figure(n_start)
    imshow(I2,[min(min(I2)),max(max(I2))])
    hold on
    plot(u,v,'-b',u1,v1,'-r',u2,v2,'-m');

    pause(1)
    close all
end
%close all
%plot(ns,theta(1,:),'-r',ns,theta(2,:),'-m')