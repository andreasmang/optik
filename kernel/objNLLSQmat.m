function [f, df, d2f] = objNLLSQmat( x, Y, C, actn )
%EVALOBJNLLSQMAT evaluates the objective function, gradient, and hessian for
%nonlinear least-squares problem
%
% input:
%   x       vector input reshaped to X = reshape(x,[n p]) matrix
%   Y       mxn matrix operator
%   C       mxp data vector
%   actn    activation function
%
% output:
%   f       scalar objective function value at current iterate
%   df      gradient w.r.t. X of least-square objective function
%   d2f     hessian w.r.t. X of least-square objective function

if nargin < 1, runSelfTest(); return; end

% get sizes
n = size(Y,2); % m: number of training examples; n: number of features per example
p = size(C,2); % p: number of different classes

% map column vector to matrix
X = reshape(x, [n, p]);

% apply matrix Y to X
Ypred = Y*X;

% get derivatives and hessian of activation function
[sYX, dsYX, d2sYX] = actn( Ypred );

% evaluate objective function
% f(X) = 0.5*||sigma(Y*X) - C||^2
f = ... ADD YOUR CODE HERE


% evaluate gradient of f(x)
if nargout > 1
    df = ... ADD YOUR CODE HERE
end

% evaluate gradient of f(x)
if nargout > 2
    d2f = @(x) ... ADD YOUR CODE HERE
end

end % end of function




function runSelfTest()

n = 100;
p = 10;
m = 600;

% create data for problem
eta = 0.5;
x0 = randn( n*p, 1 );
A  = randn( m, n );
B = A*reshape(x0,[n,p]) + eta*randn( [m, p] );

s = @(x) actFun( x, 'tanh' );

objfun = @(x) objNLLSQmat( x, A, B, s );

% perform derivative check
checkDerivative( objfun, x0 );


end % end function




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
