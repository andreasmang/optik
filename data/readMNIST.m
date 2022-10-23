function [Y,C,L] = readMNIST( train )
% READMNIST read MNIST data
%
% input:
%   train  flag for data set
%
% output:
%   Y      Y in R^{s,n} is a matrix containing s
%          data sets each with n features
%          (n is the number of pixels in this case)
%   C      C in R^{s,m} is a matrix containing s
%          data sets;  the columns are indicator
%          functions ({0,1}) for row i belonging to
%          class j

if nargin == 0, train = 1; end

% if they do not exist, download files (if this does not work
% on your computer, download the MNIST data manually at
% "http://yann.lecun.com/exdb/mnist/") and store them in
% the subfolder data/MNIST (see code win function)
downLoadMNIST();

if train
    iFile = 'data/MNIST/train-images-idx3-ubyte';
    lFile = 'data/MNIST/train-labels-idx1-ubyte';
else
    iFile = 'data/MNIST/t10k-images-idx3-ubyte';
    lFile = 'data/MNIST/t10k-labels-idx1-ubyte';
end

% load individual bits
Y = readMNISTImages( iFile ); % features: Y in R^{s,n}, s: samples; n: features (pixels)
L = readMNISTLabels( lFile ); % labels: L in R^{s,1}, s: samples;

[m] = size( Y, 1 ); % get number of rows (examples)
C = sparse(1:m, L+1, ones(m,1) ); % create binary matrix for 10 classes

end % end of function



function downLoadMNIST( )

% boolean for testing if files exist
download = exist( fullfile(pwd, 'data/MNIST'), 'dir') ~= 7;

% define list of file names
files = { "train-images-idx3-ubyte", ...
          "train-labels-idx1-ubyte", ...
          "t10k-images-idx3-ubyte",  ...
          "t10k-labels-idx1-ubyte"  };

% if files do not exist, download them
if download
    disp('downloading files...')
    mkdir data/MNIST
    addr = "http://yann.lecun.com/exdb/mnist/";

    filenames = files + ".gz";
    for ii = 1:numel( files )
        fn = fullfile('data/MNIST', filenames{ii});
        disp( fn );
        websave( fn, char(addr + filenames{ii}) );
    end
    disp('download complete');

    cdir = pwd;
    % unzip the files
    cd('data/MNIST');
    gunzip *.gz

    % return to main directory
    cd(cdir);
end

end % end of function




%//////////////////////////////////////////////////////
function data = readMNISTImages( filename )
% READMNISTIMAGES read images of MNIST dataset
%
% input:
%     filename      file name
%
% output:
%     data          MNIST images stored in 10000x784 matrix, where each row
%                   corresponds to an image of size 28x28

% read digits
fid    = fopen(filename, 'r', 'b');
header = fread(fid, 1, 'int32');
if (header~=2051), error('field could not be read'); end

% get number of images (10000)
nimg = fread(fid, 1, 'int32');

% get first dimension of images (28)
nx1 = fread(fid, 1, 'int32');

% get second dimension of images (28)
nx2 = fread(fid, 1, 'int32');

% allocate array to hold images
data = zeros([nimg,nx1*nx2]);

% load images
for i = 1 : nimg
    data(i,:) = double(fread( fid, nx1*nx2, 'uint8' ));
end

% convert to double and rescale to [0,1]
data = data / 255.0;

fclose( fid );

end % end of function
%//////////////////////////////////////////////////////




%//////////////////////////////////////////////////////
function [data, num] = readMNISTLabels( filename )
% READMNISTLABELS read labels of MNIST dataset
%
% input:
%     filename  file name
%
% output:
%     data      MNIST labels stored in 10000x1 matrix, where each row
%               corresponds to a label between 0 and 9


% read digits
fid = fopen( filename, 'r', 'b' );
hdr = fread( fid, 1, 'int32' );
if ( hdr ~= 2049 ), error('field could not be read'); end

% get number of images (10000)
nlab = fread( fid, 1, 'int32' );
data = fread( fid, nlab, 'uint8' );

num = zeros([10,1]);

fclose( fid );
for i = 0 : 9
    num(i+1) = sum(data == i);
end

end % end of function
%//////////////////////////////////////////////////////




%######################################################
% This code is part of the Matlab-based toolbox
% OPTIK --- Optimization Toolkit
% For details see https://github.com/andreasmang/optik
%######################################################

