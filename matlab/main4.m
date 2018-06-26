close all
clear all
clc
% https://angeljohnsy.blogspot.com/2011/06/image-rotation.html
%Nom et proprietes du stack d'image
%Stack_name='0.06.tif';
Stack_name1 = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/Debit/debit=0.25_volume=0.06_pression=365_temperature=22.7.tif';
%Stack_name='/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/Vitesse/vitesse=28_volume=0.03_pression=473_temperature=24.4.tif';
Stack_name='/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/Vitesse/vitesse=24_volume=0.04_pression=349_temperature=23.2.tif'
Stack_info=imfinfo(Stack_name);
Stack_length=size(Stack_info,1) % nombre d'image du stack
theta = zeros(2,Stack_length);
ns = 1:Stack_length;

I1=imread(Stack_name1,1);
I1 = double(I1);
[yc,xc] = size(I1)
mimi = min(min(I1))
x1 = [1  1 xc xc 1];
y1 = [394 1 1 377 394];
mask = poly2mask(x1, y1, yc,xc); 
x2 = [0  0 xc xc 1];
y2 = [377 0 0 394 377];
mask2 = poly2mask(x2, y2, yc,xc);
seuil = 1000;%1000;
dth = 0.5; % precision en degre de l ange entre 2 droites
n = 1; % degre du polynome d interpolation
x0 =0;
y0 = 394;
millimetre = 10;
pixel = 433;
facteur = millimetre/pixel;
poly = polyfit([x0 xc],[y0 yc],1);
ligne = @(xm,ym) polyval(poly,xm)-ym;
minpoints = max(10,n+1);
for n_start = 540:559%Stack_length
    Ibww=imread(Stack_name,n_start);
    %imwrite(Ibww,'vitesse=28_volume=0.03_pression=473_temperature=24.4.jpg','jpg','BitDepth',12)
    Ibw=imread(Stack_name,n_start);
    Ibw = abs(double(Ibw)- I1);
    Ibw = double(Ibw);
    Ibw2 = fliplr(Ibw);
    Ibw = traitement(Ibw,seuil,mask);
%     figure(n_start)
%     imshow(Ibww,[min(min(Ibww)),max(max(Ibww))])
%     pause(1)
%     close all
    Ibw2 = traitement(Ibw2,seuil,mask2);
    [c1,d1] = frontiere(Ibw);
    [c2,d2] = frontiere(Ibw2);
    if (minpoints < length(c1) && minpoints < length(c2))
        c1 = c1(1:end-1);
        d1 = d1(1:end-1);
        while d1(1) < d1(end)
            d1 = circshift(d1,1);
            c1 = circshift(c1,1);
        end
        xk = xc-c2(1);
        yk = d2(1);
        dist = zeros(size(c1));
        for k = 1:length(c1)
            dist(k) = hypot(c1(k)-xk,d1(k)-yk);
        end
        [~,k]  = min(dist);
        if minpoints < k
            n_start
            u = c1(1:k);
            v = d1(1:k);
            [m1,npts1,found1] = gpente(u,-v,1,n,dth);
            [u1,v1] = droite(u(1),u(end),-v(1),m1,true);
            v1 = -v1;
            [m2,npts2,found2] = gpente(u,-v,length(u),n,dth)
            [u2,v2] = droite(u(1),u(end),-v(end),m2,false);
            v2 = -v2;
            if (found1 && found2)
                o1 = gangle(m1,true)
                o2 = gangle(m2,false)
                x1 = -(u(1)-2560)*facteur
                x2 = -(u(end)-2560)*facteur
                [vh,ih] = min(v)
                h = ligne(u(ih),vh)*facteur
                xh = u(ih)*facteur
                figure(n_start)
                imshow(Ibww,[min(min(Ibww)),max(max(Ibww))])
                hold on
                plot(u,v,'-b',u1,v1,'-r',u2,v2,'-m');
                hold off
                   pause(1)
                 close all
            end
        end
    end
end


% close all
% plot(ns(35:75),theta(1,35:75),'-r',ns(35:75),theta(2,35:75),'-m')