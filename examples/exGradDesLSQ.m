clear, close all; clc;

B = [1,1,1; 1,2,3];
A = B'*B + 0.001*eye(3);

xtrue = [1;2;3];

eta = randn(3,1);
b   = A*xtrue + 0.01*eta;

objfun = @(x) objFunLSQ(A,x,b);

x0 = zeros( size(xtrue) );

[fc,gc] = objfun( x0 );

x = gradientDescent( objfun, x0 );


fprintf('computed solution: (%e,%e,%e)\n', x);
fprintf('true solution:     (%e,%e,%e)\n', xtrue);
fprintf('relative error:    %e\n', norm(xtrue(:) - x(:))/norm(x(:)));



%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
