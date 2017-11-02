import numpy as np


data = np.loadtxt('data_ex2_task2_2017.txt')


num_patterns = data.shape[0]

average_pattern = np.zeros((1,2))
for pattern in data:
    average_pattern += pattern
average_pattern /= num_patterns

covariance_matrix = np.zeros((2,2))
for pattern in data:
    for i in range(2):
        for j in range(2):
            diff = pattern - average_pattern
            covariance_matrix[i][j] += diff[0,i] * diff[0,j]

covariance_matrix /= num_patterns

print(covariance_matrix)
print(np.linalg.eig(covariance_matrix))