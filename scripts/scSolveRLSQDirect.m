clear, close all;
clc;

% regularization parameter
alpha = 1e-2;

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

% compute solution using matlab's backslash
% (directly solve linear system)
xsol1 = A \ b;

% solve regularized problem (normal equations)
xsol2 = % ADD YOUR CODE HERE


fprintf(' true solution:       x = (%+-6e, %+-6e, %+-6e)\n', xtrue);
fprintf(' numerical solutions: x = (%+-6e, %+-6e, %+-6e)\n', xsol1);
fprintf('                      x = (%+-6e, %+-6e, %+-6e)\n', xsol2);
fprintf(' relative error:      %e\n', norm(xsol1 - xtrue)/norm(xtrue));
fprintf('                      %e\n', norm(xsol2 - xtrue)/norm(xtrue));




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
