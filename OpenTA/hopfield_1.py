import numpy as np

patterns = np.matrix([
    [-1, -1, -1, -1, -1, 1, 1, -1, -1],
    [-1, -1, 1, -1, -1, -1, -1, 1, -1],
    [-1, -1, -1, -1, -1, 1, -1, -1, -1],
])


weights = np.zeros((9,9))
for pattern in patterns[0:2]:
    print(pattern.shape)
    weights += pattern.transpose().dot(pattern)/2

print(weights)

for pattern in patterns:
    output = weights * pattern.transpose()
    output[output <= 0] = -1
    output[output > 0] = 1
    print("Pattern vs output")
    print(pattern)
    print(output.transpose())