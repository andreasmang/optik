clear, close all;
clc;

m = 32; n = 32;

% create random matrices and vectors
A = randn(n,m);
b = zeros(m,1);
x0 = zeros(n,1);

% define function handle for objective
j = @(x) objFunQuad(A,x,b,0,'f');

plotObj(j,[-1,1,-1,1],x0);




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
