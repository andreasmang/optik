clear, close all;
clc;

actflag = 'sin';
% actflag = 'tanh';

% read mnist data
[Ytrain, Ctrain] = readMNIST( true );
[Ytest, Ctest] = readMNIST( false );

% get size of training data (Y in R^{m,n})
n = size( Ytrain, 2 );
p = 10;

% compute initial guess
x0 = zeros(n*p,1);

sigma = @(x) actFun( x, actflag );

% define objective function
fctn = @(x) objNLLSQmat( x, Ytrain, Ctrain, sigma );


% solve optimization problem (TBD)
x = runOptimizer( fctn, x0, 'gd' );

X = reshape(x,[n p]);

% compute accuracy
CpredTR = actFun( Ytrain*X, actflag );
CpredTE = actFun( Ytest*X, actflag );

[pctTR] = checkClass( CpredTR, Ctrain );
[pctTE] = checkClass( CpredTE, Ctest );


fprintf(' training accuracy: %0.3f \n', pctTR );
fprintf(' testing  accuracy: %0.3f \n', pctTE );




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
