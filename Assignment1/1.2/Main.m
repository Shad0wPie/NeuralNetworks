clear all
close all
nNeurons = 200;
nIndependentBits = 10^5;
patternNumbers = [1, 20, 40, 60, 80, 100, 120, 140, 160, 180, 200, 220, 240, 260, 280, 300, 320, 340, 360, 380, 400];

patternSpace = linspace(1,400);
pErrorTheoretical = TheoreticalErrorProbability(patternSpace, nNeurons);
plot(patternSpace/nNeurons, pErrorTheoretical)

hold on

% Draw experimental results for comparison
for iNumPatterns = patternNumbers
    pError = EstimateOneStepError(iNumPatterns, nNeurons, nIndependentBits);
    alpha = iNumPatterns/nNeurons; 
    plot(alpha, pError, 'ro')
    drawnow
end

title('Graph of one step error probability')
xlabel('p/N') % x-axis label
ylabel('P_{Error}') % y-axis label
legend('theoretical curve','experimental results')