function [ fcnValue ] = ActivationFunction( neuronState, beta )
    
    fcnValue = tanh(beta*neuronState);

end
