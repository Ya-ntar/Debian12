import numpy as np
N = 1000
while True:
    A = np.random.rand(N, N)
    B = np.random.rand(N, N)
    C = np.dot(A, B)
    Q, R = np.linalg.qr(A)
    eigvals, eigvecs = np.linalg.eig(A)
    print("Iteration done")