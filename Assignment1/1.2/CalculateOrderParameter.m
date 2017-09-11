function [ orderParameter ] = CalculateOrderParameter( currentState, initialState )

    N = length(currentState);
    orderParameter = 0;
    
    for i=1:N
        orderParameter = orderParameter + currentState(i)*initialState(i);
    end
    
    orderParameter = orderParameter/N;
end

