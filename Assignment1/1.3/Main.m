clear all;

trainingData = importdata('training_data.txt');
trainingSet = trainingData(:,[1 2]);
outputSet = trainingData(:,3);

nbrOfInputNeurons = size(trainingSet,2);
nbrOfOutputNeurons = size(outputSet,2);
weights=zeros(nbrOfOutputNeurons,nbrOfInputNeurons);
bias

learningRate = 0.02;
beta = 1/2;

weightsInitializingInterval = [-2 2];
biasInitializingInterval = [-1 1];

nbrOfIterations = 10^6;

%initialize weights
weights = InitializeWeights(weightsInitializingInterval, size(weights));

%initialize biases



%calculate output
trainingSet(i,:)'*
