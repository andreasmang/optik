function sdir = getSearchDir( objfun, xc, dfc, df0, flag )
%GETSEARCHDIR compute search direction
%
% input:
%    objfun  function handle for objective function
%    xc      current iterate
%    dfc     current estimate of gradient
%    flag    identifier for method to compute search direction
%
% output:
%  sdir      search direction

if strcmp( flag, 'gd' )
    % comupte search direction for gradient descent
    sdir = % ADD YOUR CODE HERE
elseif strcmp( flag, 'newton' )
    % compute newton step
    sdir = compNewtonStep( objfun, xc, dfc, df0 );
else
    error( ['search direction ', flag, ' not defined'] );
end

end % end of function




function sdir = compNewtonStep( objfun, xc, dfc, df0 )
%COMPNEWTONSTEP compute newton step
%
% input:
%    objfun  function handle for objective function
%    x       current iterate
%    flag    identifier for method to compute search direction
%
% output:
%  sdir      search direction

% ADD YOUR CODE HERE

end % end of function




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
