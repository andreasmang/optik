function checkDerivative( fctn, x0 )
%CHECKDERIVATIVE function to check if derivative
%of objective is correct (uses taylor expansion)
%
% inputs:
%   fctn    function handle for objective function
%   x0      initial guess
%
% author:   Andreas Mang
% date:     09/18/2019

nrep = 46;

fprintf('%s\n',repmat('-' , [1,nrep]));
fprintf('derivative check for objective\n<%s>\n',func2str(fctn));
fprintf('%s\n',repmat('-' , [1,nrep]));
fprintf(' %s %11s %11s %11s\n','h', 'T0', 'T1', 'T2');
fprintf('%s\n',repmat('-' , [1,nrep]));

h = logspace(-1,-10,10); % step size
v = rand(size(x0));      % random perturbation

% get objective value, gradient, and hessian
[f0,df,d2f] = fctn(x0);     % evaluate objective function
dfv         = df'*v;
vtd2fv      = v'*d2f*v;

% allocate history
T0 = zeros([numel(h),1]);
T1 = zeros([numel(h),1]);
T2 = zeros([numel(h),1]);

% do derivative check
for j=1:length(h)
    hh = h(j)*h(j);
	ft = fctn(x0+h(j)*v);					        % function value
	T0(j) = norm(f0-ft);						    % TaylorPoly 0
	T1(j) = norm(f0+h(j)*dfv - ft);				    % TaylorPoly 1
 	T2(j) = norm(f0+h(j)*dfv+0.5*hh*vtd2fv - ft);	% TaylorPoly 2
    % print result
    fprintf('%9.4e  %9.4e  %9.4e  %9.4e\n',h(j),T0(j),T1(j),T2(j));
end

fprintf('%s\n',repmat('-' , [1,nrep]));
fprintf('T0 = |f0 - ft|\n');
fprintf('T1 = |f0+h*df''-ft|\n');
fprintf('T2 = |f0+h*df''*v+0.5*h^2*v''*H*v-ft|\n');
fprintf('%s\n',repmat('-' , [1,nrep]));

end




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
