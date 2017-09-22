function [ totalEnergy ] = EnergyOfAllPatterns( patternInputs, patternOutputs, weights, biases, beta)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
    networkOutputs = EvaluateNetwork(patternInputs, weights, biases, beta);
    totalEnergy = CalculateEnergy(patternOutputs, networkOutputs);

end

