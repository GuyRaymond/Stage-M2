function [nomsdescolonnes,donnees] = nomdesfichiersendonnees(dossier)
% dossier = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/Vitessedotmat/';
% [nomsdescolonnes,donnees] = nomdesfichiersendonnees(dossier)
clc
if nargin == 0
    dossier = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/Vitessedotmat/';
end
files = dir(fullfile(dossier,'*.mat'));
lenfiles = length(files);
donnees = zeros(0);
nomsdescolonnes = cell(0);
if 0 < lenfiles
    [~,name] = fileparts(files(1).name);
    tab = strsplit(name,{'=','_'});
    lentab = length(tab);
    col = mod(lentab,2);
    donnees = zeros(lenfiles,col);
    nomsdescolonnes = cell(col,1);
    t = 0;
    for k = 1:2:lentab
        t = t+1;
        nomsdescolonnes{t} = tab{k};
    end
end


i = 0;
for j = 1:lenfiles
    [~,name] = fileparts(files(j).name);
    if ~contains(name,'@')
        i = i+1;
        tab = strsplit(name,{'=','_'});
        t = 0;
        for k = 2:2:length(tab)
            t = t+1;
            donnees(i,t) = str2double(tab{k});
        end
    end
end
donnees = sortrows(donnees(1:i,:));
end