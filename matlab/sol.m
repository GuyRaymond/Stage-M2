close all
clear all
clc

%Nom et proprietes du stack d'image
Stack_name='0.06.tif';
Stack_info=imfinfo(Stack_name);
Stack_length=size(Stack_info,1) % nombre d'image du stack
theta = zeros(2,Stack_length);
ns = 1:Stack_length;

for n_start = ns(30:70)
    I0=imread(Stack_name,1);
    
    I1=imread(Stack_name,n_start);
    I1 = abs(double(I1)-double(I0));
    I2=double(I1);

    [yc,xc] = size(I2);
     x1 = [0  0 xc xc 0];
     y1 = [395 0 0 395 395];
     mask = poly2mask(x1, y1, yc,xc); 

    [Gx,Gy] = imgradientxy(I2);    
    [IS, ~] = imgradient(Gx, Gy);%[Gmag, Gdir] = imgradient(Gx, Gy);
    %figure()
    %imshow(IS,[min(min(IS)),max(max(IS))])
     IS=immultiply(IS,mask);
    %figure()
    %imshow(IS,[min(min(IS)),max(max(IS))])
    seuil = 2000;
    Ibw=IS;
    Ibw(Ibw<seuil)=0; %seuillage
    Ibw(Ibw~=0)=1; %seuillage
    %figure()
    %imshow(IS,[min(min(Ibw)),max(max(Ibw))])
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