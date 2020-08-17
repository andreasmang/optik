function [f, df, d2f] = objFunNLRLSQ( x, A, b, L, alpha )
%EVALOBJNLRLSQ evaluate objective function, gradient, and hessian
%of regularized least squares problem
%
% input:
%   A      matrix
%   x      current iterate
%   b      right hand side
%   L      regularization operator
%   alpha  regularization parameter
%
% output:
%   f      objective function value
%   df     objective function gradient
%   d2f    objective function hessian

if nargin < 1, runSelfTest(); return; end

% evaluate objective function
% f(x) = ||sin(A*x)-b||_2^2 + alpha*||Lx||_2^2
f = % ADD YOUR CODE HERE

% evaluate gradient of f(x)
if nargout > 1
    df = % ADD YOUR CODE HERE
end

% evaluate hessian of f(x)
if nargout > 2
    d2f = % ADD YOUR CODE HERE
end

end % end of function




%//////////////////////////////////////////////////////
function runSelfTest()

n = 100;

% construct solution
x0 = rand( n, 1 );

% create SPD matrix
d = logspace( 0, -6, n );
A = sprandsym( n, 1, d );

% construct right hand side (we add small perturbation
% so that b is not (likely) in col(A))
eta = 1e-3;
b = A*x0 + eta*rand(n,1);

% construct regulariation operator
L = eye( n );

% define function handle for objective function
objfun = @(x) objFunNLRLSQ( x, A, b, L, 0.1 );

% perform derivative check
checkDerivative( objfun, x0 );

end % end function
%//////////////////////////////////////////////////////




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
