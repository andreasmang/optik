clear, close all; clc;

% this example illustrates how to solve the
% (unconstrained) least squares problem
%
%   minimize 0.5*||A*x - b||_2^2
%
% using a gradient descent approach

% define matrix
B = [1,1,1; 1,2,3];
A = B'*B + 0.001*eye(3);

% define true solution
xtrue = [1;2;3];

% compute right hand side (with noise added)
eta = randn(3,1);
b   = A*xtrue + 0.01*eta;

% define function handle for objective function
objfun = @(x) objFunLSQ(A,x,b);

% compute initial guess x0 = 0
x0 = zeros( size(xtrue) );

% run gradient descent algorithm
x = gradientDescent( objfun, x0 );

% display results for users
fprintf('computed solution: (%e,%e,%e)\n', x);
fprintf('true solution:     (%e,%e,%e)\n', xtrue);
fprintf('relative error:    %e\n', norm(xtrue(:) - x(:))/norm(x(:)));



%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
