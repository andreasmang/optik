function result = objFunRosenbrock(x)
% OBJFUNROSENBROCK implementation of rosenbrock function
%
% inputs:
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
		result = ;
	case 'df'
		% evaluate gradient g(x) = Q*x + b
		result = ;
	case 'd2f'
		% compute hessian Q
		result = ;
	otherwise
		error('flag not defined');
end


end % end of function




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
