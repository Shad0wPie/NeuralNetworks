function [ biases ] = InitializeBiases( interval, dimensions )
    
    biases = zeros(interval);
    for i=1:dimensions(1)
        for j=1:dimensions(2)
            biases(i,j) = interval(1)+(interval(2)-interval(1))*rand;
        end
    end


end

