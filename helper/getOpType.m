function [atype,afun,afcnstr] = getOpType( A )
%GETOPTYPE checks matrix argument K for iterative methods and
%determines its type (function handle, matrix operator, ...)
%
% input:
%   A              matrix operator
%
% output
%   atype          type of argument A, which can either be 'matrix',
%                  'function', 'expression' or 'inline object'
%   afun           function name or inline object (is '' if "atype" is 'matrix')
%   afcnstr        is the function name if "atype" is 'function' or the
%                  formula of the function if "atype" is 'expression' or
%                  'inline object';  it is '' if "atype" is 'matrix'

[afun,afunmsg] = fcnchk( A );

% check if afunmsg is empty
if isempty( afunmsg )
    % if it is an inline function
    if isa( afun,'inline' )
        if isa( A, 'inline' ), atype = 'inline object';
        else                   atype = 'expression';
        end
        afcnstr = formula( afun );
    else % both function_handles @fun and function names 'fun'
        atype = 'function';
        if isa( A, 'function_handle' ), afcnstr = func2str( A );
        else                            afcnstr = A;
        end
    end

elseif isa( A, 'float' )
    afun = A; atype = 'matrix'; afcnstr = '';
else error('input for operator A is invalid (can not be handled)');
end

end % end of function



%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################

