clear all;

trainingData = importdata('training_data.txt');
%validationData =
%toatlData =

%normalize data
n1trainingData(:,1) = trainingData(:,1)/norm(trainingData(:,1));
n2trainingData(:,1) = trainingData(:,2)/norm(trainingData(:,2));
trainingData = [n1trainingData n2trainingData trainingData(:,3)];


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
    iRandomInput = randi(size(trainingSet,1));
    input = trainingSet(iRandomInput,:)'; %column vector
    zeta = outputSet(iRandomInput);
    
    %go through network
    output = weights*input - biases;
    outputActivate = ActivationFunction(output,beta);
    
    %update weights
    deltaWeight = zeros(1,2);
    for j=1:size(weights,2)
        deltaWeight(1,j) = learningRate*beta*(zeta - outputActivate)*(1-outputActivate^2)*input(j,1);
        weights(1,j) = weights(1,j) + deltaWeight(1,j);
    end
    
    %update biases
    for i=1:nbrOfOutputNeurons
        deltaBiases = learningRate*beta*(zeta-outputActivate)*(1-outputActivate^2);
        biases = biases + deltaBiases;
    end
    
    
    energy = 0;
    for i=1:size(trainingData,1)
        output = weights*(trainingSet(i,:))' - biases;
        outputActivate = ActivationFunction(output,beta);
        energy = energy + CalculateEnergy(zeta, outputActivate);
    end
    
    plot(iIterations,energy,'.')
    
    
end
