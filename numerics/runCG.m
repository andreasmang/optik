function x = runCG( A, y, tol, maxiter )
%RUNCG execute conjugate gradient method to solve
%linear system of equations of form A*x = y
%
% input:
%   A        n x n matrix or function handle for matvec
%   y        right hand side (must be of size n x 1)
%   tol      tolerance for solver
%   maxiter  max iteration count (if not set, defaults to n)

% determine whether K is a matrix or a function
ktype = getOpType( A );

% setup up according to matrix type
if strcmp( ktype, 'matrix' )
    % check inputs for appropriate sizes
    [m,n] = size( A );
    if (m ~= n), error( 'matrix not square' ); end
    if ~isequal( size( y ), [m,1] ), error( 'size mismatch' ); end
    % define matrix vector product
    matvec = @(x) A*x;
else
    m = size( y, 1 ); n = m;
    if ~iscolumn( y ), error( 'y is not a colum vector' ); end

    % define matrix vector product
    matvec = @(x) A( x );
end

% set to default
if nargin < 4, maxiter = n; end

% set initial guess for CG
x = zeros( n,1 );

% main function executing CG
r = matvec( x ) - y;
d = -r;
rsold = r'*r;

% main CG loop
for i = 1 : maxiter
    % ADD YOUR CODE HERE
end

end % end of function




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################
