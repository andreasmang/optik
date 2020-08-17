clear, close all; clc;

% regularization parameter
alpha = 1e-4;

% construct matrix
B = [1, 1, 1; 1, 2, 3];
A = B' * B + .001 * eye(3);

% define true solution
xtrue = [1; 2; 3];

% compute right hand side (and add random perturbation)
eta = 0.05*norm( xtrue );
per = eta*randn(3,1);
b = A*xtrue + per;

% define initial guess for solver
x0 = zeros( size(xtrue) );

% compute regularization operator
L = eye( numel(x0) );

% setup objective function
objfun = @(x) objFunRLSQ( x, A, b, L, alpha );

% execute iterative solver
xisol = runOptimizer( objfun, x0, 'gd' );

fprintf( ' true solution:      x = (%6e, %6e, %6e)\n', xtrue );
fprintf( ' numerical solution: x = (%6e, %6e, %6e)\n', xisol );




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
