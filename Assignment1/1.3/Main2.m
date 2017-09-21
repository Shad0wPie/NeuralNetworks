clearvars;
tic
learningRate = 0.02;
beta = 1/2;
weightsInitializingInterval = [-2 2];
biasInitializingInterval = [-1 1];
nbrOfIterations = 10^6;

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

nbrOfInputNeurons = size(trainingInputs,2);
nbrOfOutputNeurons = size(trainingOutputs,2);

numberOfRuns = 10;

trainingClassificationErrorOverRuns = zeros(numberOfRuns,1);
validationClassificationErrorOverRuns = zeros(numberOfRuns,1);

for iNumberOfRuns = 1:numberOfRuns
    
    %initialize weights
    weights = InitializeWeights(weightsInitializingInterval, [nbrOfOutputNeurons,nbrOfInputNeurons]);
    
    %initialize biases
    biases = InitializeBiases(biasInitializingInterval, nbrOfOutputNeurons);
    
    trainingEnergies = zeros(nbrOfIterations,1);
    validationEnergies = zeros(nbrOfIterations,1);
    for iIterations=1:nbrOfIterations
        
        %pick random input from training set
        iRandomInput = randi(size(trainingInputs,1));
        input = trainingInputs(iRandomInput,:)'; %column vector
        zeta = trainingOutputs(iRandomInput);
        
        %go through network
        output = weights*input - biases;
        ActivatedOutput = ActivationFunction(output,beta);
        
        %update weights
        deltaWeight = learningRate*beta*(zeta - ActivatedOutput)*(1-ActivatedOutput^2)*input';
        weights = weights + deltaWeight;
        
        %update biases
        deltaBiases = learningRate*beta*(zeta-ActivatedOutput)*(1-ActivatedOutput^2);
        biases = biases - deltaBiases;
        
        trainingEnergy = EnergyOfAllPatterns(trainingInputs, trainingOutputs, weights, biases, beta);
        validationEnergy = EnergyOfAllPatterns(validationInputs, validationOutputs, weights, biases, beta);
        trainingClassificationError = CalculateClassificationError(trainingInputs, trainingOutputs, weights, biases, beta);
        validationClassificationError = CalculateClassificationError(validationInputs, validationOutputs, weights, biases, beta);
        trainingEnergies(iIterations) = trainingEnergy;
        validationEnergies(iIterations) = validationEnergy;
    end %loop over iteraions
    
    trainingClassificationErrorOverRuns(iNumberOfRuns) = trainingClassificationError;
    validationClassificationErrorOverRuns(iNumberOfRuns) = validationClassificationError;
    
    hold on
    iterations = 1:10^3:nbrOfIterations;
    plot(iterations, trainingEnergies(1:10^3:end));
    plot(iterations, validationEnergies(1:10^3:end));
    toc
    
end %loop over runs

minTrainingClassificationError = min(trainingClassificationErrorOverRuns)
minValidationClassificationError = min(validationClassificationErrorOverRuns)

avgTrainingClassificationError = mean(trainingClassificationErrorOverRuns)
avgValidationClassificationError = mean(validationClassificationErrorOverRuns)

varTrainingClassificationError = var(trainingClassificationErrorOverRuns)
varValidationClassificationError = var(validationClassificationErrorOverRuns)

