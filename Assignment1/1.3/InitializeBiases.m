function [ biases ] = InitializeBiases( interval, nbrOfOutputNeurons )
    
    biases = zeros(nbrOfOutputNeurons,1);
    for i=1:nbrOfOutputNeurons(1)
            biases(i) = interval(1)+(interval(2)-interval(1))*rand;
    end


end

