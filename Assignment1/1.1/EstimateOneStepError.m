function pError = EstimateOneStepError(nPatterns, nNeurons, nIndependentBits)

    nEvaluatedBits = 0;
    nTotalErrors = 0;
    
    bGotEnoughData = false;
    while ~bGotEnoughData
        %Initialize new patterns
        patterns = zeros(nPatterns,nNeurons);
        for i = 1:nPatterns
            patterns(i,:) = GenerateRandomPattern(nNeurons);
        end
        
        weights = CalculateWeights(patterns);
        
        %Evaluate the number of errors after one step for each pattern
        for iPattern = 1:nPatterns
            inputState = patterns(iPattern,:);
            newState = UpdateState(inputState,weights);
                        
            nTotalErrors = nTotalErrors + sum(newState ~= inputState);
            nEvaluatedBits = nEvaluatedBits + nNeurons;
            if nEvaluatedBits >= nIndependentBits
                bGotEnoughData = true;
                break
            end
        end
    end
    pError = nTotalErrors / nEvaluatedBits;

end

