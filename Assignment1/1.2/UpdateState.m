function newState = UpdateState(currentState, weights, noiseParameter)

    newState = currentState;
    nNeurons = size(currentState, 2);    
    iRandom = 1 + fix(rand*nNeurons);
    
    localField = sum(weights(iRandom,:).*currentState);
    g = 1/(1+exp((-2*noiseParameter*localField)));
    if rand <= g
        newState(iRandom) = 1;
    else
        newState(iRandom) = -1;
    end
    
end
