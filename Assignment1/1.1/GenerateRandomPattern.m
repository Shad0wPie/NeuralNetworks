function pattern = GenerateRandomPattern(length)

    pattern = zeros(1,length);
    for i = 1:length
        pattern(i) = -1 + 2*round(rand);
    end
    
end
