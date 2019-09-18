function [y,ytrue,t] = setupData(flag)

switch flag
    case 's1'
    case 's2'

    otherwise
        error('flag not defined');
end