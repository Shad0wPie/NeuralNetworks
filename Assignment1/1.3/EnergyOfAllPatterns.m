function [ totalEnergy ] = EnergyOfAllPatterns( patternInputs, patternOutputs, weights, biases, beta)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
    outputs = patternInputs * weights' - biases;
    activatedOutputs = ActivationFunction(outputs, beta);
    totalEnergy = CalculateEnergy(patternOutputs, activatedOutputs);

end

