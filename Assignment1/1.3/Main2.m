clearvars;
tic
learningRate = 0.02;
beta = 1/2;
weightsInitializingInterval = [-2 2];
biasInitializingInterval = [-1 1];
nbrOfIterations = 10^5;

% import raw data
trainingData = importdata('training_data.txt');
validationData = importdata('validation_data.txt');

% process imported data
trainingData = NormalizeData(trainingData, [1,2]);
trainingInputs = trainingData(:,[1 2]);
trainingOutputs = trainingData(:,3);
validationData = NormalizeData(validationData, [1,2]);
validationInputs = validationData(:,[1 2]);
validationOutputs = validationData(:,3);

nbrOfInputNeurons = size(trainingInputs,2);
nbrOfOutputNeurons = size(trainingOutputs,2);

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
    trainingEnergies(iIterations) = trainingEnergy;
    validationEnergies(iIterations) = validationEnergy;
end
hold on
iterations = 1:nbrOfIterations;
plot(iterations, trainingEnergies);
plot(iterations, validationEnergies);
toc