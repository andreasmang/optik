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

% compute regularization operator
L = eye( numel(x0) );

% set up list of regularization parameters alpha
alphalist = logspace(-6,6,13);

% get number of different alphas
m = numel( alphalist );

% create vector to store individual solution
xsol = zeros( [m+1, 3] );

% compute solution using matlab's backslash command
% (direct solver for linear system)
xsol(1,:) = A \ b;

% solve regularized problem (normal equations)
fprintf(' true solution:       x = (%+-6e, %+-6e, %+-6e)\n', xtrue);
for i = 1 : m
    alpha = alphalist(i);
    xsol(i+1,:) = % ADD YOUR CODE HERE
end

% display solutions to user
fprintf('\n');
fprintf(' numerical solution: \n' );
fprintf(' alpha = %.2e     x = (%+-6e, %+-6e, %+-6e)\n', 0, xsol(1,:) );
for i = 2 : m
    fprintf(' alpha = %.2e     x = (%+-6e, %+-6e, %+-6e)\n', alphalist(i), xsol(i+1,:) );
end

% compute and display relative error
fprintf('\n');
fprintf(' relative error:\n' );

% error for unregularized solution
err(1) = % ADD YOUR CODE HERE
fprintf(' alpha = %.2e     %e\n', 0, err(1) );

% compute errors for regularized solution
for i = 2 : m + 1
    err(i) = % ADD YOUR COD HERE
    fprintf(' alpha = %.2e     %e\n', alphalist(i-1), err(i) );
end

% plot relative error
figure( )
h = semilogx( [0,alphalist], err );
ylabel('||x_{true} - x_\alpha|| / ||x_{true}||', 'FontSize', 16);
xlabel('\alpha', 'FontSize', 20);




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
