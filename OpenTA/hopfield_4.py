import numpy as np

points = np.matrix([
    [-2,5],
    [0,0],
    [0,1],
    [1,1],
    [1,-1]
])

mean = np.zeros((1,2))
for point in points:
    mean += point/5

print(mean)
covariance_matrix = np.zeros((2,2))

for point in points:
    covariance_matrix += point.transpose().dot(point)/5

print(covariance_matrix)
print(np.linalg.eig(covariance_matrix))