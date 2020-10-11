clear, close all; clc;

% noise perturbation
% delta = 0.05;
delta = 0.0;
i = 1; % change to select different grid sizes, where i in [1,2,3]
j = 4; % change to select different regularization parameters, where j in [1,2,3,4]


% problem setup
k = [1, 2, 4];
n = k(i)*64;
A = gallery( 'lehmer', n );

% regularization parameters
alphalist = [1e-1; 1e-2; 1e-3; 1e-4];
alpha = alphalist( j );

% define true solution
s = linspace( 0, 2*pi, n)';
sigma = 0.9;
xtrue = sin( s );
xtrue = xtrue + sin( 4*s ).*( 0.35*s );
xtrue = xtrue.*exp(-((s-pi).*(s-pi))./(2*sigma*sigma));

% compute right hand side
b      = A*xtrue;
eta    = delta*norm(xtrue).*rand( n, 1);
bdelta = b + eta;

% define initial guess for solver
x0 = zeros( size(xtrue) );

% compute regularization operator
L = eye( numel(x0) );

% setup objective function
objfun = @(x) objFunRLSQ( x, A, bdelta, L, alpha );

% method = 'gd';     % gradient descent
method = 'newton'; % newton method

% execute iterative solver
xisol = runOptimizer( objfun, x0, method );

% compute relative error
err = norm( xtrue - xisol ) / norm( xtrue );
fprintf( 'relative error: %e \n', err );

% plot solutions and data
figure()
subplot(1,2,1), plot( s, xtrue, s, xisol, 'x', s, x0, 'LineWidth', 2 );
legend( 'true solution', 'numerical solution', 'initial guess' );
xlabel( 's', 'FontSize', 14 );
ylabel( 'x(s)', 'FontSize', 14 );
subplot(1,2,2), plot( s, b, s, bdelta, 'x', 'LineWidth', 2 );
legend( 'data', 'perturbed data' );
xlabel( 's', 'FontSize', 14 );
ylabel( 'b(s)', 'FontSize', 14 );
