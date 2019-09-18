function [f,df,d2f] = objFunLSQ(A,x,b)
% OBJFUNLSQ implementation of objective function for
% least squares problem
%
% inputs:
%    A         n x m matrix
%    b         right hand side (vector)
%    x         current iterate
%
% outputs:
%    f         objective value
%    df        gradient
%    d2f       hessian

if nargin < 1, runMinEx(); return; end

% evaluate objective functional j(x) = ||Ax-b||^2_2
dr = A*x - b;
f  = 0.5*dr(:)'*dr(:);

if nargout > 1
    % evaluate gradient
    df = A'*dr;
end

if nargout > 2
    % compute hessian A^\T A
    d2f = A'*A;
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

objfun = @(x) objFunLSQ(A,x,b);

checkDerivative(objfun,x0);

end % end function
%//////////////////////////////////////////////////////




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
