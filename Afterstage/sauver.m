function sauver(dossierousauver,dossieroulire,Stack_name1)
% dossierousauver = '/home/gbesseng/Documents/StageGuy/dosssiertest/';
% dossieroulire = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/Vitesse';
% Stack_name1 = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/Debit/debit=3_volume=0.04_pression=422_temperature=22.3.tif';
% sauver(dossierousauver,dossier,Stack_name1)
if nargin == 0
    lafonction = 'sauver(dossierousauver,dossieroulire,Stack_name1)'
    dossierousauver = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/dossiertest';
    dossieroulire = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/Vitesse';
    Stack_name1 = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/Debit/debit=3_volume=0.04_pression=422_temperature=22.3.tif';
end
warning('off','all')
files = dir(fullfile(dossieroulire,'*.tif'));
lenfiles = length(files);
for k = 1:lenfiles
    name = files(k).name;
    if ~contains(name,'@')
        name
        Stack_name = fullfile(dossieroulire,name);
        sauvegarder(dossierousauver,Stack_name1,Stack_name)
    end
end
end