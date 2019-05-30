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


% evaluate objective functional of general quadratic
f = 0.5*x'*Q*x + b'*x + c;

% evaluate gradient
if nargout > 1
    df = Q*x + b;
end

% compute hessian matrix
if nargout > 2
    df2 = Q;
end


end % end function




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
