function pol = coef(file)
text = fileread(file)
pattern = 'a\d=\s*(\S+)'
[tokens,matches] = regexp(text, pattern, 'tokens','match')
pol = zeros(1,length(tokens));
for k = 1:length(tokens)
    %tokens{k}
    pol(k) = str2double(tokens{k}{1});
end
pol = pol(end:-1:1);
end