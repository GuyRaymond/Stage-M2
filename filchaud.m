clear all
clc

filesPath = '/home/gbesseng/Documents/StageGuy/Guy/test jet/19042018/C1/180_Pa/';
binaire = dir(fullfile(filesPath,'*.bin'));

file0 = '/home/gbesseng/Documents/StageGuy/Guy/calibrage/19042018/ANEMO DISA/Voie C1/HWcalib_20180419T152934.dat';
pol = coef(file0)

for k = 1%:length(binaire)
    file = fullfile(filesPath,binaire(k).name)
    fileID = fopen(file,'r');
    A = fread(fileID,'float');
    fclose(fileID);
    la = length(A)/3;
    % len = debut - fin + 1
    % la = la - 1 + 1
    % la = lb - (la+1) + 1
    % lb = la + (la+1) - 1 = 2*la 
    % la = lc - (lb+1) + 1
    % lc = la + (lb+1) - 1 = la + lb = 3*la = length(A)
    lb = 2*la;
    Pdyn = A(1:la);
    T = A(la+1:lb);
    E = A(lb+1:end);
    Pm = mean(Pdyn)
    Tm = mean(T)
    Em = mean(E)
end
