function pol = coef2(file)
text = strtrim(fileread(file))
A = splitlines(text)
A = A(end-1:-1:end-4)
    function res = dble(S)
        res = zeros(1,length(S));
        for k = 1:length(S)
            str = S{k};
            B = split(str(~isspace(str)),'=');
            res(k) = str2double(B{end});
        end
    end
pol = dble(A);
end