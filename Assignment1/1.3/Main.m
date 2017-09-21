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

nbrOfIterations = 10^6;
energyVec = zeros(nbrOfIterations,1);

%initialize weights
weights = InitializeWeights(weightsInitializingInterval, size(weights));

%initialize biases
biases = InitializeBiases(biasInitializingInterval, nbrOfOutputNeurons);

hold on

for iIterations=1:nbrOfIterations
    
    %pick random input from training set
    iRandomInput = randi(size(trainingSet,1));
    input = trainingSet(iRandomInput,:)'; %column vector
    zeta = outputSet(iRandomInput);
    
    %go through network
    output = weights*input - biases;
    ActivatedOutput = ActivationFunction(output,beta);
    
    %update weights
    deltaWeight = zeros(1,2);
    for j=1:size(weights,2)
        deltaWeight(1,j) = learningRate*beta*(zeta - ActivatedOutput)*(1-ActivatedOutput^2)*input(j,1);
        weights(1,j) = weights(1,j) + deltaWeight(1,j);
    end
    
    %update biases
    for i=1:nbrOfOutputNeurons
        deltaBiases = learningRate*beta*(zeta-ActivatedOutput)*(1-ActivatedOutput^2);
        biases = biases - deltaBiases;
    end
    
    
    energy = 0;
    for i=1:size(trainingData,1)
        input = trainingSet(i,:);
        zeta = outputSet(i);
        output = weights*input' - biases;
        ActivatedOutput = ActivationFunction(output,beta);
        energy = energy + CalculateEnergy(zeta, ActivatedOutput);
    end
    
    energyVec(iIterations) = energy;
    
end

plot(1:nbrOfIterations, energyVec);
 
 
 
