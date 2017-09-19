clear all;

trainingData = importdata('training_data.txt');
trainingSet = trainingData(:,[1 2]);
outputSet = trainingData(:,3);

nbrOfInputNeurons = size(trainingSet,2);
nbrOfOutputNeurons = size(outputSet,2);
weights = zeros(nbrOfOutputNeurons,nbrOfInputNeurons);
biases = zeros(nbrOfOutputNeurons,1);
energy = 0;

learningRate = 0.02;
beta = 1/2;

weightsInitializingInterval = [-2 2];
biasInitializingInterval = [-1 1];
input = zeros(nbrOfInputNeurons,1);
output=0;

nbrOfIterations = 10^3;

%initialize weights
weights = InitializeWeights(weightsInitializingInterval, size(weights));

%initialize biases
biases = InitializeBiases(biasInitializingInterval, nbrOfOutputNeurons);

hold on
for i=1:nbrOfIterations
    
    %pick random input from training set
    iRandomInput = randi(size(trainingSet,2));
    input = trainingSet(iRandomInput,:)'; %column vector
    
    %calculate output
    output = weights*input - biases;
    output = ActivationFunction(output,beta);
    
    %calculate energy
    energy = CalculateEnergy(outputSet(iRandomInput), output);
    
    %plot
    %plot(i,energy,'.')
    
    %update weights
    
    
end
