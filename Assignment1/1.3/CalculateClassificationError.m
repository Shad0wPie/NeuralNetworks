function [ tCE ] = CalculateClassificationError( patternInputs, patternOutputs, weights, biases, beta )
    
    outputs = EvaluateNetwork(patternInputs, weights, biases, beta);
    tCE = 0; %totalClassificationError
    for i=1:size(patternInputs,1)
        tCE = tCE + abs(patternOutputs(i)-sign(outputs(i)));
    end
    
    tCE = tCE/(2*size(patternInputs,1));

end

