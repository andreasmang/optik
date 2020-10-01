function [t] = doLineSearch( objfun, xc, sdir )
%DOLINESEARCH perform backtracking linesearch
%
% input:
%   objfun   function handle for objective function
%   xc       current iterate
%   sdir     search direction
%
% output:
%   t        lin search parameter

% evaluate objective function
[fc, dfc] = objfun( xc );

% initialize flag
success = false;

% set max number of linesearch iterations
maxit = 24;

% set initial step size
t = 1.0;
c = 1e-4;

% do linesearch
for i = 1 : maxit
    % evaluate objective function
    ftrial = objfun( xc + t*sdir );

    % make sure that we have a descent direction
    % ADD YOUR CODE HERE

    % divide step size by 2
    t = t / 2;
end

% display message to user
if ~success, disp('line search failed'); gamma = 0.0; end

end % end of function




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
