import matplotlib.pyplot as plot
import numpy as np

from . import competitive_unsupervised
from . import simple_perceptron

UNSUPERVISED_NETWORK_SIZE = 5
UNSUPERVISED_LEARNING_RATE = 0.02
UNSUPERVISED_ITERATIONS = 10^5

data = np.loadtxt('data_ex2_task3_2017.txt')

unsupervised_network = competitive_unsupervised.Network(
        network_size=UNSUPERVISED_NETWORK_SIZE, input_dimensions=2)
supervised_network = simple_perceptron.Network(input_dimensions=UNSUPERVISED_NETWORK_SIZE)

inputs = data[:,1:3]
unsupervised_network.train(data, learning_rate=UNSUPERVISED_LEARNING_RATE)
clustered_data = unsupervised_network.run(inputs)


# target_outputs = data[:,0]
# supervised_network.train(clustered_data, target_outputs)
# classified_data = supervised_network.run(clustered_data)
#
# red_indexes = np.where(classified_data>0)
# black_indexes = np.where(classified_data<=0)
#
# plot.plot(inputs[red_indexes,1:3], 'bo')
# plot.plot(inputs[black_indexes,1:3], 'ro')
#
