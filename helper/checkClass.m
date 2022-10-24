function [perc,inds] = checkClass( Cpred, Ctrue )
%CHECKCLASS given data classification Cpred and known classes Ctrue,
%give percentage of correct classifications and indicices of
%correct classifications
%
% input:
%   Cpred   mxp array of classification distributions
%   Ctrue   mxp array of known classifications (1 non-zero per row)
%
% output:
%   perc    percentage of correct answers
%   inds    indices of correctly classified cases

[~,class] = max(Cpred,[],2);
[~,truth] = max(Ctrue,[],2);

inds = find(class == truth);
perc = numel(inds)/numel(truth);

end % end of function




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################

