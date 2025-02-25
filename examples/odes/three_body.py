import numpy as np
import scipy as sp
import numpy as np
import matplotlib.pyplot as plt


m0 = 5.0
m1 = 3.0
m2 = 4.0


def dudt( t, y ):
    u0 = y[0:2]
    u1 = y[4:6]
    u2 = y[8:10]

    d0 = ( u2 - u1 ) / np.linalg.norm( u2 - u1 )**3
    d1 = ( u0 - u2 ) / np.linalg.norm( u0 - u2 )**3
    d2 = ( u1 - u0 ) / np.linalg.norm( u1 - u0 )**3

    ydot1 = y[2:4]
    ydot2 = m1 * d2 - m2 * d1
    ydot3 = y[6:8]
    ydot4 = m2 * d0 - m0 * d2
    ydot5 = y[10:12]
    ydot6 = m0 * d1 - m1 * d0

    return np.concatenate([ydot1,ydot2,ydot3,ydot4,ydot5,ydot6])


# time horizon
t_span = (0.0, 4.2)
nt = 210 # number of time steps
t = np.linspace( t_span[0], t_span[1], nt )

# initial guess
u0 = np.array([1, -1, 0.1, 0.15, 1, 3, 0, 0.07, -2, -1, -0.1, -0.5])

# solve problem using RK4 time integrator
solRK4 = sp.integrate.solve_ivp(dudt, t_span, u0, method='RK45', t_eval=t, dense_output=True)


nt = 210
ht = t_span[1]/nt
u = np.zeros([12,nt+1])

# explicit euler metho
u[:,0] = u0
for i in range(nt):
    u[:,i+1] = u[:,i] + ht*dudt( i*ht, u[:,i] )


fig, ax = plt.subplots(2)
ax[0].plot( solRK4.y[0,:], solRK4.y[1,:] )
ax[0].plot( solRK4.y[4,:], solRK4.y[5,:] )
ax[0].plot( solRK4.y[8,:], solRK4.y[9,:] )

ax[1].plot( u[0,:], u[1,:] )
ax[1].plot( u[4,:], u[5,:] )
ax[1].plot( u[8,:], u[9,:] )
plt.show()


# fig = plt.figure(figsize=(8,4))
# plt.plot( solRK4.y[0,:], solRK4.y[1,:] )
# plt.plot( solRK4.y[4,:], solRK4.y[5,:] )
# plt.plot( solRK4.y[8,:], solRK4.y[9,:] )
# plt.show()


#######################################################
# This code is part of the python toolbox
# OPTIK --- Optimization Toolkit
# For details see https://github.com/andreasmang/optik
#######################################################
