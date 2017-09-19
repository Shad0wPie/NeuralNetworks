function [ weights ] = InitializeWeights( interval, dimensions )
%InitializeWeights: Creates a matrix with weights with
%dimensions(dimensions=[M, N]). Values for weights are chosen randomly from
%a uniform distribution on the interval (interval = [-x, +x]).

    weights = zeros(dimensions);
    for i=1:dimensions(1)
        for j=1:dimensions(2)
            weights(i,j) = interval(1)+(interval(2)-interval(1))*rand;
        end
    end

end

