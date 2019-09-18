function [f,df,d2f] = objFunQuad(Q,x,b,c)
% OBJFUNQUAD implementation of quadratic
%
% inputs:
%    Q         n x n matrix
%    b         vector (linear part)
%    x         current iterate
%
% outputs:
%    f         objective value
%    df        gradient

%    d2f       hessian

if nargin < 1, runMinEx(); return; end


% evaluate objective functional of general quadratic
f = 0.5*x'*Q*x + b'*x + c;

% evaluate gradient
if nargout > 1
    df = Q*x + b;
end

% compute hessian matrix
if nargout > 2
    d2f = Q;
end


end % end function


%//////////////////////////////////////////////////////
function runMinEx()

n = 100;

% construct solution
x0 = rand(n,1);

% create SPD matrix with condition number 10^6
d  = logspace(0,-6,n);
A  = sprandsym(n,1,d);

% construct right hand side
b = A*x0 + 1e-3.*rand(n,1);
c = rand(1);

objfun = @(x) objFunQuad(A,x,b,c);

checkDerivative(objfun,x0);

end % end function
%//////////////////////////////////////////////////////




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
