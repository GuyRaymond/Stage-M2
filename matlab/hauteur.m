function y = hauteur(file)
fileID = fopen(file,'r');
formatSpec = '%f';
y = fscanf(fileID,formatSpec);
end
