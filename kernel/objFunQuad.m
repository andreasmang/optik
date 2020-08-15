function [f, df, d2f] = objFunQuad( x, Q, b, c )
%OBJFUNQUAD evaluate objective function, gradient, and hessian
%for quadratic problem
%
% inputs:
%    x         current iterate
%    Q         n x n matrix
%    b         vector (linear part)
%    c         constant vector
%
% outputs:
%    f         objective value
%    df        gradient
%    d2f       hessian

if nargin < 1, runSelfTest(); return; end

% evaluate objective function
% f(x) = 0.5 x^T Q x + b^T x + c
f = % ADD YOUR CODE HERE

% evaluate gradient of f(x)
if nargout > 1
    df = % ADD YOUR CODE HERE
end

% compute hessian matrix for f(x)
if nargout > 2
    d2f = % ADD YOUR CODE HERE
end

end % end function




%//////////////////////////////////////////////////////
function runSelfTest()

n = 100;

% construct solution
x0 = rand( n, 1 );

% create SPD matrix with condition number 10^6
d = logspace( 0, -6, n );
Q = sprandsym( n, 1, d );

% construct right hand side (we add small perturbation
% so that b is not (likely) in col(A))
eta = 1e-3;
b = Q*x0 + eta*rand(n,1);
c = rand(1);

% define function handle for objective function
objfun = @(x) objFunQuad( x, Q, b, c );

% perform derivative check
checkDerivative( objfun, x0 );

end % end function
%//////////////////////////////////////////////////////




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
