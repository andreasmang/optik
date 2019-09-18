function [xsol] = gradientDescent( objfun, xc )
% GRADIENTDESCENT gradient descent
%
% inputs:
%   objfun  function handle for objective function
%   fc      current value of objective function
%
% input:
%   xsol    solution of problem
%
% author:   Andreas Mang
% date:     09/18/2019

verbosity = 2;

dline = repmat('-',1,100);

% define stopping conditions
stop    = zeros(2,1);
tolg    = 1e-4;
itermax = 1000;

% evaluate objective function for initial guess
[fc,gc] = objfun(xc);
sdir = -gc; g0 = gc;

fprintf('%s\n', dline);
fprintf('OPTIK: gradient descent\n');
fprintf('%s\n', dline);
fprintf('objective function: <%s>\n',func2str(objfun));
fprintf('%s\n', dline);

fprintf('%-4s %-14s %-14s %-14s\n', 'iter', 'f', '||df||_2', '||df||_rel' );
iter = 0;
while ~any(stop)
    % preform line search

    if verbosity > 1, fprintf('%s\n', dline); end
    [t, xt] = lineSearch( objfun, fc, xc, sdir, verbosity );
    if (t == 0), warning('line search failed'); break; end
    if verbosity > 1, fprintf('%s\n', dline); end

    % store current iterate
    xc = xt;

    % update search direction
    [fc, gc] = objfun( xc ); sdir = -gc;

    % increase iteration count
    iter = iter + 1;

    % check for convergence
    stop(1) = norm(gc) < tolg*norm(g0);
    stop(2) = iter >= itermax;

    % display message tu user
    dbgmsg = sprintf('%-4i %-14e %-14e %-14e\n', iter, fc, norm(gc), norm(gc)/norm(g0));
    fprintf(dbgmsg);
end


fprintf('%s\n', dline);
fprintf('OPTIK: optimization finished\n');
fprintf('%s\n', dline);



% assign solution
xsol = xc;

end % end function




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
