function sauvervitesse(dossierousauver,dossier,Stack_name1)
% dossierousauver = '/home/gbesseng/Documents/StageGuy/matlab/Vitesse/';
% dossier = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/Vitesse';
% Stack_name1 = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/Debit/debit=3_volume=0.04_pression=422_temperature=22.3.tif';
warning('off','all')
files = dir(fullfile(dossier,'*.tif'));
lenfiles = length(files);
for k = 1:lenfiles
    name = files(k).name;
    if ~contains(name,'@')
        name
        Stack_name = fullfile(dossier,name);
        sauvegardervitesse(dossierousauver,Stack_name1,Stack_name)
    end
end
end