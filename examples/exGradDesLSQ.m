clear, close all; clc;

B = [1,1,1; 1,2,3];
A = B'*B + 0.001*eye(3);

x_true = [1;2;3];

eta = randn(3,1);
b   = A*x_true + 0.01*eta;

objfun = @(x) objFunLSQ(A,x,b);

x0 = zeros(size(x_true));

[fc,gc] = objfun(x0);

x = gradientDescent(objfun,x0);

disp(x);
