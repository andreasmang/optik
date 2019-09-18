function [t,xt,lsiter,success] = lineSearch( objfun, fc, xc, sdir, verbosity )
% LINESEARCH implements back tracking line search
%
% inputs:
%   objfun     function handle for objective function
%   fc         current value of objective function
%   xc         current iterate
%   sdir       update for iterate / search direction
%   verbosity  verbosity level
%
% outputs:
%   t          step length
%   xt         new iterate
%   lsiter     number of line search steps
%   success    flag to determine if line search was
%              successful
%
% author:      Andreas Mang
% date:        09/18/2019

if nargin < 5, verbosity = 1; end


t = 1;    % initial step size
n = 10;   % number of trials

% do the line search
for i = 1 : n
    xt = xc + t.*sdir;              % compute test value xt

    ft = objfun( xt );              % evalute objective functional

    if verbosity > 1
        dbgmsg = sprintf('line search: i=%-2i fc=%e ft=%e df=%+e ||sdir||_2=%e t=%.2f\n',i,fc,ft,fc-ft,norm(t.*sdir(:)),t);
        fprintf(dbgmsg);
    end

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
