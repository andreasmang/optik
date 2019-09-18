function [x] = gradientDescent( objfun, xc )
% GRADIENTDESCENT gradient descent
%
% inputs:
%    objfun    function handle for objective function
%    fc        current value of objective function
%
% input:
%    x         solution of problem

% define stopping conditions
stop    = zeros(2,1);
tolg    = 1e-6;
itermax = 1000;


% evaluate objective function for initial guess
[fc,gc] = objfun(xc);

dx = gc;
g0 = gc;

t    = 1.0;
iter = 0;
while ~any(stop)
    % gradient descent search direction
    dx = -t.*dx;

    [t,xt] = lineSearch(objfun,fc,xc,dx);

    if (t == 0), warning('line search failed'); break; end

    xc = xt;

    [fc,gc] = objfun(xc); dx = gc;

    iter = iter + 1;

    % check for convergence
    stop(1) = norm(gc) < tolg*norm(g0);
    stop(2) = iter >= itermax;

    dbgmsg = sprintf('iter=%-2i fc=%e ||gc||_2=%e\n',iter,fc,norm(gc));
    fprintf(dbgmsg);
end

x = xc;

end % end function




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
