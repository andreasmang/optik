function [converged] = checkConvergence( dfc, df0, iter, tol, maxit )
%CHECKCONVERGENCE check stopping condition
%
% input:
%   df          gradient at iteration k
%   df0         gradient at iteration k = 0
%   iter        iteration count
%   maxit       maximum number of iterations
%
% output:
%   converged   flag, if convergence criteria are met

% init flag
converged = false;

% test stoping conditions
stop = zeros(3,1);

% evaluate convergence criteria
stop(1) = % ADD YOUR CODE HERE
stop(2) = % ADD YOUR CODE HERE
stop(3) = % ADD YOUR CODE HERE

% if any of the convergence criteria are met, set flag
if any ( stop ), converged = true; end

end % end of function




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
