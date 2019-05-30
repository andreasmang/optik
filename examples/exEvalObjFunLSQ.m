clear, close all;
clc;

m = 32; n = 32;

% create random matrices and vectors
A = randn(n,m);
b = randn(m,1);

% define function handle for objective function
objfun = @(x) objFunLSQ(A,x,b);

% setup random vector
x = randn(n,1);

% evaluate objective for random vector x
[f, df] = objfun(x);

% display value of objective function and norm
% of gradient
fprintf('objective value:  %e\n', f);
fprintf('norm of gradient: %e\n', norm(df));




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
