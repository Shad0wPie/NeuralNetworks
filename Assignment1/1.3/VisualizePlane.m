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

hold on
for iOutput = 1:length(validationOutputs)
    if validationOutputs(iOutput)>0
        plot(validationInputs(iOutput,1), validationInputs(iOutput,2), 'ro')
    else
        plot(validationInputs(iOutput,1), validationInputs(iOutput,2), 'bo')
    end
end
