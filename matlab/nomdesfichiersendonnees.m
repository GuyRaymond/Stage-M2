function [nomsdescolonnes,donnees] = nomdesfichiersendonnees(dossier)

files = dir(fullfile(dossier,'*.tif'));
lenfiles = length(files);

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
    [~,name,~] = fileparts(files(j).name);
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
donnees = donnees(1:i,:);
end