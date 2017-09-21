function [ totalEnergy ] = EnergyOfAllPatterns( patternInputs, patternOutputs, weights, biases, beta)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

        
    totalEnergy = 0;
    for i=1:size(patternInputs,1)
        input = patternInputs(i,:);
        zeta = patternOutputs(i);
        output = weights*input' - biases;
        ActivatedOutput = ActivationFunction(output,beta);
        totalEnergy = totalEnergy + CalculateEnergy(zeta, ActivatedOutput);
    end

end

