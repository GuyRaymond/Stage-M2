function sauverdebit(dossierousauver,dossier)
% dossierousauver = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/Debit';
% dossier = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/Debit';
% sauverfichiertif(dossierousauver,dossier)
warning('off','all')
files = dir(fullfile(dossier,'*.tif'));
lenfiles = length(files);
for k = 1:lenfiles
    name = files(k).name;
    if ~contains(name,'@')
        Stack_name = fullfile(dossier,name);
        sauvegarder(dossierousauver,Stack_name)
    end
end
end