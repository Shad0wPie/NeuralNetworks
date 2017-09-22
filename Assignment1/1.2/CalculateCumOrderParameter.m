function [ cumOrderParameter ] = CalculateCumOrderParameter ( orderParameter, nbrOfIterations, nbrOfDataPoints )
    
    smoothedTimeStep = nbrOfIterations/nbrOfDataPoints;
    cumOrderParameter = zeros(nbrOfDataPoints,1);
    
    
    for i=smoothedTimeStep:smoothedTimeStep:nbrOfIterations
        cumOrderParameter(i/smoothedTimeStep) = sum(orderParameter(1:i))/i;
    end

end

