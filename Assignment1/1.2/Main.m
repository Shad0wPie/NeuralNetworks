clearvars, close all
nNeurons = 200;
nPatterns = 40;
noiseParameter = 2;
iterations = 20;
timePerIteration = 10^6;
smoothedTimeStep = timePerIteration/100;

hold on
timeSeries = 1:smoothedTimeStep:timePerIteration;
for i = 1:iterations
    orderParameterSeries = SimulateOrderParameter(nPatterns, nNeurons, noiseParameter, timePerIteration);
    smoothedSeries = SmoothResults(orderParameterSeries, smoothedTimeStep);
    plot(timeSeries, smoothedSeries)
    drawnow
end

title('Order parameters over time')
xlabel('time')
ylabel('Order parameter')