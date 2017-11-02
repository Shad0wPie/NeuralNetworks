import numpy as np

points = np.matrix([
    [-2,5],
    [0,0],
    [0,1],
    [1,1],
    [1,-1]
])
mean = np.array([np.mean(points[:,0]), np.mean(points[:,1])])

covariance_matrix = np.zeros((2,2))

for point in points:
    mean_diff = point - mean
    print(mean_diff.shape)
    covariance_matrix += mean_diff.T.dot(mean_diff)

covariance_matrix /= 5
print(covariance_matrix)

print(np.linalg.eig(covariance_matrix))