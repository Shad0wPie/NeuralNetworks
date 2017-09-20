function [ cumOrderParameter ] = CalculateCumOrderParameter ( orderParameter, nbrOfIterations )
    
    cumOrderParameter = zeros(nbrOfIterations,1);
    
    for i=1:nbrOfIterations
        cumOrderParameter(i) = sum(orderParameter(1:i))/i;
    end

end

