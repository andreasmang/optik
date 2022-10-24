function [f,df,d2f] = actFun( x, flag )
%ACTFCTN evaluate activation function
%
% inputs:
%   x       input vector
%   flag    flag to select activation function
%
% outputs:
%   f       objective value
%   df      gradient
%   d2f     hessian

if nargin == 0, runSelfTest; return, end

if strcmp(flag, 'tanh' )
    f   = ... ADD YOUR CODE HERE
    df  = ... ADD YOUR CODE HERE
    d2f = ... ADD YOUR CODE HERE
elseif strcmp(flag, 'sin' )
    f   = ... ADD YOUR CODE HERE
    df  = ... ADD YOUR CODE HERE
    d2f = ... ADD YOUR CODE HERE
end

end % end of function




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################

