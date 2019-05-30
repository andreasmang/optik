function [t,xt,lsiter,success] = lineSearchBT(objfun,fc,xc,dx)
% LINESEARCHBT implements back tracking line search
%
% inputs:
%    objfun    function handle for objective function
%    fc        current value of objective function
%    xc        current iterate
%    dx        update of iterate / search direction
%
% outputs:
%   t          step length
%   xt         new iterate
%   lsiter     number of line search steps
%   success    flag to determine if line search was
%              successful

t = 1;    % initial step size
n = 10;   % number of trials

% do the line search
for i = 1 : n
    xt = xc + t.*dx;                % compute test value vt

    ft = objfun(xt);                % evalute objective functional

    dbgmsg = sprintf('line search: i=%-2i fc=%e ft=%e df=%+e ||dx||_2=%e t=%.2f\n',i,fc,ft,fc-ft,norm(t.*dx(:)),t);
    fprintf(dbgmsg);

    success = (ft < fc);            % compare

    if success, break; end;         % if success, we're done

    t = t/2;                        % reduce t
end

if success, return; end             % well done
t = 0; xt = xc;                     % take no action

end % end function




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
