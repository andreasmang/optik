import numpy as np
import scipy as sp
import math
import matplotlib.pyplot as plt


m = 20
n = 50
r = 4 # rank

# construct low rank matrix
L = np.matmul( np.random.randn(m,r), np.random.randn(r,n) )

# generate random matrix with entries drawn from {-10,10}
M = sp.sparse.random( m, n, 0.05 )
ids = M.nonzero()
nzz = M.count_nonzero()
s = 20.0*np.random.binomial(1, 0.5, nzz ) - 10.0
S = M.todense()
S[ids] = s

V = 0.01*np.random.randn(m,n)

# construct matrix A
A = S + L + V

# computation of regularization weights
a = A.reshape(m*n,1)
g2_max = np.linalg.norm(a,ord=np.inf);
g3_max = np.linalg.norm(A)
g2 = 0.15*g2_max
g3 = 0.15*g3_max


fig,ax = plt.subplots(1, 3)
ax[0].matshow(L)
ax[1].matshow(S)
ax[2].matshow(V)
plt.show()




#######################################################
# This code is part of the python toolbox
# OPTIK --- Optimization Toolkit
# For details see https://github.com/andreasmang/optik
#######################################################

