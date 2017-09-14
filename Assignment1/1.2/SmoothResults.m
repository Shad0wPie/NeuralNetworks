function smoothedResults = SmoothResults(results, stepSize)

    numSteps = floor(numel(results)/stepSize);
    smoothedResults = zeros(1,numSteps);
    for i = 1:numSteps
        lastResultIndex = i * stepSize;
        smoothedResults(i) = sum(results(1:lastResultIndex))/lastResultIndex;
    end
end

