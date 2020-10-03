function [f, df, d2f] = objFunRA( x, a )
%OBJFUNRB implementation of rastrigin objective function
%
% inputs:
%    x         current iterate (2 x 1 vector)
%
% outputs:
%    f         objective value
%    df        gradient
%    d2f       hessian

if nargin < 1, runSelfTest(); return; end

% define default constants
if nargin < 2, a = 10; end

% evaluate objective function
% f(x) = 2a + (x_1 - a*cos(2\pi x_1) + (x_2 - a*cos(2\pi x_2)
f = % ADD YOUR CODE HERE

% evaluate gradient of f(x)
if nargout > 1
    df = % ADD YOUR CODE HERE
end

% evaluate hessian matrix of f(x)
if nargout > 1
    d2f = % ADD YOUR CODE HERE
end

end % end of function




%//////////////////////////////////////////////////////
function runSelfTest()

% construct solution
x0 = rand( 2, 1 );

% define function handle for objective function
objfun = @(x) objFunRA( x );

% perform derivative check
checkDerivative( objfun, x0 );

end % end function
%//////////////////////////////////////////////////////




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
