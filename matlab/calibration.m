function polynome = calibration(file)
% polynome = calibration(file)
% Donne les cofficients du polynome de la calibration du file chaud
text = fileread(file);
pattern = '[ap]\d=\s*(\S+)';
[tokens,matches] = regexp(text, pattern, 'tokens','match');
polynome = zeros(1,length(tokens));
for k = 1:length(tokens)
    polynome(k) = str2double(tokens{k}{1});
end
polynome = polynome(end:-1:1);
end
