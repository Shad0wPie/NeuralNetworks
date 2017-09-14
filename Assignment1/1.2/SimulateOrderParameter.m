function orderParameterValues = SimulateOrderParameter(nPatterns, nNeurons, noiseParameter, timeToRun)

    %Initialize new patterns
    patterns = zeros(nPatterns,nNeurons);
    for i = 1:nPatterns
        patterns(i,:) = GenerateRandomPattern(nNeurons);
    end    
    weights = CalculateWeights(patterns);

    
    initialState = patterns(1,:);
    currentState = initialState;
    
    orderParameterValues = zeros(timeToRun,1);
    t = 1;
    while t <= timeToRun
        currentState = UpdateState(currentState, weights, noiseParameter);
        orderParameterValues(t) = CalculateOrderParameter(currentState, initialState);
        t = t + 1;
    end

end

