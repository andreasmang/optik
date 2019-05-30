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


% evaluate objective functional j(x) = ||Ax-b||^2_2
dr = A*x - b;
f  = 0.5*dr(:)'*dr(:);

if nargout > 1
    % evaluate gradient
    df = A'*dr;
end

if nargout > 2
    % compute hessian A^\T A
    df2 = A'*A;
end


end % end function




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
