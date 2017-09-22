clearvars; close all
tic

% settings
learningRate = 0.02;
beta = 1/2;
weightsInitializingInterval = [-2 2];
biasInitializingInterval = [-1 1];
nIterations = 10^6;
nRuns = 10;
nHiddenNeurons = 4;

% import raw data
trainingData = importdata('training_data.txt');
validationData = importdata('validation_data.txt');

nTrainingPatterns = size(trainingData,1);

% combine data, normalize, and then split apart again
combinedData = [trainingData;validationData];
combinedNormalizedData = NormalizeData(combinedData, [1,2]);

trainingData = combinedNormalizedData(1:nTrainingPatterns,:);
trainingInputs = trainingData(:,[1 2]);
trainingOutputs = trainingData(:,3);

validationData = combinedNormalizedData(nTrainingPatterns+1:end,:);
validationInputs = validationData(:,[1 2]);
validationOutputs = validationData(:,3);

nInputNeurons = size(trainingInputs,2);
nOutputNeurons = size(trainingOutputs,2);

trainingClassificationErrorOverRuns = zeros(nRuns,1);
validationClassificationErrorOverRuns = zeros(nRuns,1);

hold on

for iRun = 1:nRuns
        
    %initialize weights
    weights = InitializeWeights(weightsInitializingInterval, nInputNeurons, nHiddenNeurons, nOutputNeurons);
    
    %initialize biases
    biases = InitializeBiases(biasInitializingInterval, nHiddenNeurons,nOutputNeurons);
    
    trainingEnergies = zeros(nIterations,1);
    validationEnergies = zeros(nIterations,1);
    for iIterations=1:nIterations
        
        [weights, biases] = StochasticTrainingStep(weights, biases, trainingInputs, trainingOutputs, beta, learningRate);
        
        trainingEnergy = EnergyOfAllPatterns(trainingInputs, trainingOutputs, weights, biases, beta);
        validationEnergy = EnergyOfAllPatterns(validationInputs, validationOutputs, weights, biases, beta);
        trainingEnergies(iIterations) = trainingEnergy;
        validationEnergies(iIterations) = validationEnergy;
    end %loop over iteraions
    
    trainingClassificationError = CalculateClassificationError(trainingInputs, trainingOutputs, weights, biases, beta);
    validationClassificationError = CalculateClassificationError(validationInputs, validationOutputs, weights, biases, beta);

    trainingClassificationErrorOverRuns(iRun) = trainingClassificationError;
    validationClassificationErrorOverRuns(iRun) = validationClassificationError;
    
    iterations = 1:10^3:nIterations;
    plot(iterations, trainingEnergies(1:10^3:end), 'r');
    plot(iterations, validationEnergies(1:10^3:end), 'b');
    
    fprintf("Finished run: %d\n", iRun);
end %loop over runs

legend('Training Energy', 'Validation Energy')

minTrainingClassificationError = min(trainingClassificationErrorOverRuns)
minValidationClassificationError = min(validationClassificationErrorOverRuns)

avgTrainingClassificationError = mean(trainingClassificationErrorOverRuns)
avgValidationClassificationError = mean(validationClassificationErrorOverRuns)

varTrainingClassificationError = var(trainingClassificationErrorOverRuns)
varValidationClassificationError = var(validationClassificationErrorOverRuns)

toc