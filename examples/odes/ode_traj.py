import scipy as sp
import numpy as np
import matplotlib.pyplot as plt


def rhs1(t, z):
    x,y = z
    dxdt = -x - 2.0*y
    dydt = 2.0*x - y

    return [dxdt,dydt]


def rhs2(t, z):
    x,y = z
    dxdt = -t*x - 2.0*y
    dydt = 2.0*t*x - 2.0*y

    return [dxdt,dydt]


# time horizon
t_span = (0, 10)
nt = 1000 # number of time steps
t = np.linspace( t_span[0], t_span[1], nt )

# solve with rhs1 (autonomous system) for different inital guesses
sol1 = sp.integrate.solve_ivp(rhs1, t_span, [-1,-1], method='RK45', t_eval=t, dense_output=True)
sol2 = sp.integrate.solve_ivp(rhs1, t_span, [ 1,-1], method='RK45', t_eval=t, dense_output=True)
sol3 = sp.integrate.solve_ivp(rhs1, t_span, [-1, 1], method='RK45', t_eval=t, dense_output=True)
sol4 = sp.integrate.solve_ivp(rhs1, t_span, [ 1, 1], method='RK45', t_eval=t, dense_output=True)


# plot solutions
fig = plt.figure(figsize=(8,4))
plt.plot( sol1.y[0,:], sol1.y[1,:] )
plt.plot( sol2.y[0,:], sol2.y[1,:] )
plt.plot( sol3.y[0,:], sol3.y[1,:] )
plt.plot( sol4.y[0,:], sol4.y[1,:] )
plt.show()


# solve with rhs2 (non-autonomous system) for different inital guesses
sol1 = sp.integrate.solve_ivp(rhs2, t_span, [-1,-1], method='RK45', t_eval=t, dense_output=True)
sol2 = sp.integrate.solve_ivp(rhs2, t_span, [ 1,-1], method='RK45', t_eval=t, dense_output=True)
sol3 = sp.integrate.solve_ivp(rhs2, t_span, [-1, 1], method='RK45', t_eval=t, dense_output=True)
sol4 = sp.integrate.solve_ivp(rhs2, t_span, [ 1, 1], method='RK45', t_eval=t, dense_output=True)


# plot solutions
fig = plt.figure(figsize=(8,4))
plt.plot( sol1.y[0,:], sol1.y[1,:] )
plt.plot( sol2.y[0,:], sol2.y[1,:] )
plt.plot( sol3.y[0,:], sol3.y[1,:] )
plt.plot( sol4.y[0,:], sol4.y[1,:] )
plt.show()



#######################################################
# This code is part of the python toolbox
# OPTIK --- Optimization Toolkit
# For details see https://github.com/andreasmang/optik
#######################################################
