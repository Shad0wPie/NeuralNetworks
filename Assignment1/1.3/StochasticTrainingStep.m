function [weights, biases] = StochasticTrainingStep(weights, biases, trainingInputs, trainingOutputs, beta, learningRate)

    %pick random input from training set
    iRandomInput = randi(size(trainingInputs,1));
    input = trainingInputs(iRandomInput,:);
    zeta = trainingOutputs(iRandomInput);

    %evaluate first layer
    firstLayerOutput = input * weights{1}' - biases{1};
    firstLayerOutput = ActivationFunction(firstLayerOutput, beta);
    
    bHasHiddenLayer = size(weights,2) > 1;
    if bHasHiddenLayer
        %evaluate second layer
        secondLayerOutput = firstLayerOutput * weights{2}' - biases{2};
        secondLayerOutput = ActivationFunction(secondLayerOutput, beta);
        finalOutput = secondLayerOutput;
    else
        finalOutput = firstLayerOutput;
    end
    delta = beta*(zeta - finalOutput)*(1-finalOutput.^2);

    if bHasHiddenLayer
        weights{2} = weights{2} + delta * firstLayerOutput;
        biases{2} = biases{2} - delta;
        %propagate delta
        delta = beta*weights{2}*delta'.*(1-firstLayerOutput.^2);
    end
        
    %update first layer weights
    weights{1} = weights{1} + learningRate*delta'*input;

    %update first layer biases
    biases{1} = biases{1} - learningRate*delta;    
 
end

