import scipy as sp
import numpy as np
import matplotlib.pyplot as plt


def objfctn(x, A, y, alpha, z ):
    # evaluate (1/2)*|| Ax - y ||_2^2 + \alpha || z ||_1
    f1 = sum_square( A @ x - y )
    f2 = np.linalg.norm( z, 1 )

    f = f1 + alpha*f2

    return f

def shrinkage( x, kappa ):
    # implement soft thresholding
    z = np.maximum( 0, x - kappa ) - np.maximum( 0, - x - kappa )

    return z


def sum_square( r ):
    # evaluate (1/2)*|| Ax - y ||_2^2
    r = np.square( r )
    f = 0.5*np.sum( r )

    return f


# algorithm constants
max_iter = 100
abstol = 1e-4
reltol = 1e-2
beta = 0.5 # line search parameter

m = 500 #  number of examples
n = 2500 # number of features

# draw random sparse vector
x_true = sp.sparse.random( n, 1, 0.05 )

# construct matrix A with columns to have unit ell^2 norm
A = np.random.randn( m, n )
z = np.sqrt( np.sum( np.square(A), axis=0 ) )
z = np.divide( 1.0, z )
B = sp.sparse.diags( z, 0 )
A = np.matmul( A, B.toarray() )

# compute right hand side
y = A @ x_true
v = np.sqrt(0.001)*np.random.rand(m,1)
y = y + v


# compute regularization paramater
alpha_max = np.linalg.norm(A.transpose() @ y, np.inf )
alpha = 0.1*alpha_max
print( 'regularization parameters', alpha )

# precompute
ATy = A.transpose() @ y
ATA = np.matmul( A.transpose(), A )

# function handle for objective
f = lambda u : sum_square( A @ u - y )


t = 1.0 # prox parameter

# proximal gradient algorithm
print( '----------------------------------' )
print( 'executing proximal gradient method' )
print( '----------------------------------' )
obj_vals = np.zeros(max_iter)
x = np.zeros( [n,1] ) # initial guess
x_prev = x
for k in range( max_iter ):
    while 1:
        grad_x = ATA@x - ATy
        z = shrinkage( x - t*grad_x, t*alpha )

        r = z - x
        s = np.inner( grad_x[:,0], r[:,0] )
        s = s + (1.0/(2.0*t))*sum_square( z - x )

        if f(z) <= f(x) + s:
            break

        t = beta*t

    x_prev = x
    x = z
    obj_vals[k] = objfctn( x, A, y, alpha, x )
    print( "{:>6d}".format(k), "{:>15e}".format(obj_vals[k]) )
    if k > 0 and abs(obj_vals[k] - obj_vals[k-1]) < abstol:
        break

pg_iter = k
pg_objval = obj_vals[:pg_iter]



fig = plt.figure(figsize=(8,4))
plt.plot( range(pg_iter), pg_objval[:pg_iter], label="proximal gradient method" )
plt.legend()
plt.show()


#######################################################
# This code is part of the python toolbox
# OPTIK --- Optimization Toolkit
# For details see https://github.com/andreasmang/optik
#######################################################

