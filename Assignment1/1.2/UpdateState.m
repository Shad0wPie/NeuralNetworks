function newState = UpdateState(currentState, weights)

    newState = zeros(size(currentState));
    for i = 1:numel(currentState)
        newState(i) = sign(sum(weights(i,:).*currentState));
        if newState(i) == 0
            newState(i) = 1;
        end
    end

end
