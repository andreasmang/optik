clear, close all;

% define true solution
xtrue = [ 0; 0];

% define function handle
objfun = @(x) objFunRA( x );

% initial guess
x0 = [ 1.2; 0 ];

method = 'gd';
%method = 'newton';

% execute iterative solver
xisol = runOptimizer( objfun, x0, 'newton' );

% display solution
fprintf(' true solution:      x = (%+-6e, %+-6e)\n', xtrue);
fprintf(' numerical solution: x = (%+-6e, %+-6e)\n', xisol);

% plot optimization landscape
m = 100;
x1 = linspace(-2,  2, m ); % defines range
x2 = linspace( 3, -1, m ); % defines range
[ x1, x2 ] = meshgrid( x1, x2 );
fval = zeros( [m, m] ); % matrix to store objective values

% evaluate objective function for all points
for i = 1 : m
    for j = 1 : m
        x = [ x1( i, j ), x2( i, j ) ];
        fval( i, j ) = objfun( x );
    end
end

% plot optimization landscape / values of objective function
figure();
subplot(1,2,1);
h = surf( x1, x2, fval, 'FaceAlpha', 0.5 );
title( 'surface plot of objective function' );
h.EdgeColor = 'none';
hold on;
plot3( xtrue(1), xtrue(2), objfun( xtrue ) ,'rx', 'MarkerSize', 10, 'LineWidth', 4 );
plot3( xisol(1), xisol(2), objfun( xisol ) ,'kx', 'MarkerSize', 10, 'LineWidth', 4 );
plot3( x0(1), x0(2), objfun( x0 ) ,'bx', 'MarkerSize', 10, 'LineWidth', 4 );
hold off;
subplot(1,2,2);
h = contour( fval, 100 );
title( 'contour plot of objective function' );
colormap hot;




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
