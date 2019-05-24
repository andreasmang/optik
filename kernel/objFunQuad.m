%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
function [result] = objFunQuad(Q,x,b,c,flag)
% OBJFUNQUAD implementation of quadratic
%
% inputs:
%    Q         n x n matrix
%    b         vector (linear part)
%    x         current iterate
%    flag      flag to identify what's going to be computed
%              options are:
%              'f'    objective value
%              'df'   gradient
%              'd2f'  hessian
% outputs:
%    result    value of objective functional or gradient


switch flag
	case 'f'
		% evaluate objective functional of general quadratic
		result = 0.5*x'*Q*x + b'*x + c;
	case 'df'
		% evaluate gradient g(x) = Q*x + b
		result = Q*x + b;
	case 'd2f'
		% compute hessian Q
		result = Q;
	otherwise
		error('flag not defined');
end


end
