clearvars, close all
nNeurons = 200;
nPatterns = 5;
noiseParameter = 2;
iterations = 20;
timePerIteration = 10^3;

hold on
timeSeries = 1:timePerIteration;
for i = 1:iterations
    orderParameterSeries = SimulateOrderParameter(nPatterns, nNeurons, noiseParameter, timePerIteration);
    plot(timeSeries, orderParameterSeries)
    drawnow
end

title('Order parameters over time')
xlabel('time')
ylabel('Order parameter')