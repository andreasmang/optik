%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
function x = solLSQML(A,b)
% SOLLSQML compute solution of unconstrained least 
% squares problem, i.e.,
%         minimize_x ||A*x - b||,
% based on the default matlab implementation (will 
% call a QR factorization)
%
% inputs:
%    A         n x m matrix
%    b         right hand side (vector)
% outputs:
%    x         solution of least-squares problem

% we use backslash, which will default to
% a QR fractorization
x = A\b;

end
