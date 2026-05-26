function numObstacles = count_obstacles(B, varargin)
% COUNT_OBSTACLES  Count obstacles from a 24x30 logical grid (1=blocked).
% Usage:
%   n = count_obstacles(B);                       % defaults
%   n = count_obstacles(B,'Close',0,'MinArea',8); % tweak behaviour
%
% Params (optional name-value):
%   'MinSpeckle'  (default 2)  remove blobs smaller than this (holes)
%   'Close'       (default 1)  bridge gaps with a square (2*Close+1)
%   'MinArea'     (default 6)  keep components with >= this many cells

% ---- parameters
ip = inputParser;
ip.addParameter('MinSpeckle',2,@(x)isnumeric(x)&&isscalar(x));
ip.addParameter('Close',1,@(x)isnumeric(x)&&isscalar(x));
ip.addParameter('MinArea',6,@(x)isnumeric(x)&&isscalar(x));
ip.parse(varargin{:});
s = ip.Results;

% ---- clean up & connect
M = logical(B);
M = bwareaopen(M, s.MinSpeckle);                 % drop tiny speckles
if s.Close > 0
    M = imclose(M, strel('square', 2*s.Close+1));% bridge 1-cell gaps (set Close=0 to disable)
end
M = imfill(M,'holes');
M = bwareaopen(M, s.MinArea);                    % remove small leftover blobs

% ---- label & count
CC = bwconncomp(M, 8);                           % 8-connected components
numObstacles = CC.NumObjects;
end
