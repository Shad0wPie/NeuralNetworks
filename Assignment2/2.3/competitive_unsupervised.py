import numpy as np
from numpy import linalg as LA


class Network(object):
    def __init__(self, network_size, input_dimensions):
        self.network_size = network_size
        self.weights = 2 * np.random.rand((network_size, input_dimensions)) - 1

    def train(self, data, iterations, learning_rate):

        for i in range(iterations):
            random_index = np.random.randint(0, data.size)
            random_sample = data[random_index, :]
            best_weight_index = np.inf
            best_weight_value = 0
            for weight_index, weight in enumerate(self.weights):
                weight_value = np.exp(- LA.norm(random_sample - weight) / 2)
                if weight_value > best_weight_value:
                    best_weight_value = weight_value
                    best_weight_index = weight_index

            self.weights[best_weight_index] += learning_rate * (
                random_sample - self.weights[best_weight_index])

    def run(self, inputs):

        outputs = np.zeros(inputs.size[0], self.network_size)
        for i, input in enumerate(inputs):
            weight_values = np.exp(- LA.norm(input - self.weights) / 2)
            total_sum = np.sum(weight_values)
            outputs[i] = weight_values / total_sum

        return outputs
