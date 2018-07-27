function sauvegardervitesse(dossierousauver,Stack_name1,Stack_name)

Stack_info=imfinfo(Stack_name);
Stack_length=size(Stack_info,1); % nombre d'image du stack

[~,filename,~] = fileparts(Stack_name);
filename = strcat(filename,'.mat');
filename = fullfile(dossierousauver,filename);

theta_a = zeros(Stack_length,1);
theta_r = zeros(Stack_length,1);
x_a = zeros(Stack_length,1);
y_a = zeros(Stack_length,1);
x_r = zeros(Stack_length,1);
y_r = zeros(Stack_length,1);
y_max = zeros(Stack_length,1);
x_y_max = zeros(Stack_length,1);
dist_a_r = zeros(Stack_length,1);
numero_image = zeros(Stack_length,1);


I1=imread(Stack_name1,1);
I1 = double(I1);
[yc,xc] = size(I1);
x1 = [0  0 xc xc 0];
y1 = [394 0 0 377 394];
mask = poly2mask(x1, y1, yc,xc); 
x2 = [0  0 xc xc 0];
y2 = [377 0 0 394 377];
mask2 = poly2mask(x2, y2, yc,xc);
seuil = 1000;
dth = 0.5; % precision en degre de l ange entre 2 droites
n = 1; % degre du polynome d interpolation
minpoints = max(10,n+1);
t = 0;
for n_start = 1:Stack_length
    Ibw=imread(Stack_name,n_start);
    Ibw = abs(double(Ibw)- I1);
    Ibw2 = fliplr(Ibw);
    Ibw = traitement(Ibw,seuil,mask);
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
        if  minpoints < k
            u = c1(1:k);
            v = d1(1:k);
            [m1,~,found1] = gpente(u,-v,1,n,dth);
            [u1,v1] = droite(u(1),u(end),-v(1),m1,true);
            v1 = -v1;
            [m2,~,found2] = gpente(u,-v,length(u),n,dth);
            [u2,v2] = droite(u(1),u(end),-v(end),m2,false);
            v2 = -v2;
            if (found1 && found2)
	            t = t+1;
                theta_a(t) = gangle(m1,true);
                theta_r(t) = gangle(m2,false);
	            x_a(t) = u(1); 
	            y_a(t) = v(1);
	            x_r(t) = u(end);
	            y_r(t) = v(end);
                [ym,kym] = min(v);
	            y_max(t) = ym;
                x_y_max(t) = u(kym);
	            dist_a_r(t) = hypot(u(1)-u(end),v(1)-v(end));
	            numero_image(t) = n_start;
                u_c{t} = u(:);
                v_c{t} = v(:);
                u_t_a{t} = u1(:);
                v_t_a{t} = v1(:);
                u_t_r{t} = u2(:);
                v_t_r{t} = v2(:);
            end
        end
    end
end
if 0 < t
    theta_a = theta_a(1:t);
    theta_r = theta_r(1:t);
    x_a = x_a(1:t); 
    y_a = y_a(1:t);
    x_r = x_r(1:t);
    y_r = y_r(1:t);
    y_max = y_max(1:t);
    x_y_max = x_y_max(1:t);
    dist_a_r = dist_a_r(1:t);
    numero_image = numero_image(1:t);
    save(filename, 'theta_a', 'theta_r', 'x_a','y_a','x_r','y_r','y_max','x_y_max','dist_a_r',...
    'numero_image','u_c','v_c','u_t_a','v_t_a','u_t_r','v_t_r')
end
end