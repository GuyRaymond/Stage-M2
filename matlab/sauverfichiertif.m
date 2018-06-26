function sauverfichiertif(dossierousauver,dossier)
% dossierousauver = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/Vitesse';
% dossier = '/mnt/shared/projects/BlowDrop/Shared/Stage_GUY/Vitesse';
% sauverfichiertif(dossierousauver,dossier)
warning('off','all')
files = dir(fullfile(dossier,'*.tif'));
lenfiles = length(files);
for k = 1:lenfiles
    name = files(k).name;
    if ~contains(name,'@') && ~contains(name,'vitesse=28_volume=0.001_pression=473_temperature=24.0.tif')
        Stack_name = fullfile(dossier,name);
        sauvegarder(dossierousauver,Stack_name)
    end
end
end