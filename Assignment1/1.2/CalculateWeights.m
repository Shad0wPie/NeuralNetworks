function weights = CalculateWeights(patterns)

    nNeurons = size(patterns,2);

    weights = zeros(nNeurons, nNeurons);
    for i = 1:nNeurons
        for j = 1:nNeurons
            weights(i,j) = 1/nNeurons * sum(patterns(:,i).*patterns(:,j));
        end
    end

end

