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
outputActivate=0;

for iIterations=1:nbrOfIterations
    
    %pick random input from training set
    iRandomInput = randi(size(trainingSet,2));
    input = trainingSet(iRandomInput,:)'; %column vector
    
    %calculate output
    output = weights*input - biases;
    outputActivate = ActivationFunction(outputActivate,beta);
    
    %calculate energy
    eta = outputSet(iRandomInput);
    energy = CalculateEnergy(eta, outputActivate);
    
    %plot
    
    plot(iIterations,energy,'.')
    
    %update weights
    for i=1:size(weights,1)
        for j=1:size(weights,2)
            weights(i,j) = weights(i,j) + learningRate*(eta - outputActivate)*(1-outputActivate^2)*input(j);
        end
    end
    
    %update biases
    for i=1:size(weights,1)
            biases = biases - learningRate*(eta - outputActivate);
    end
    
    
end
