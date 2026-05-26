% clc
% clear
% --- Inputs you already have
load fixed_n_moving_points.mat;
Iref = imread('C:\Users\hfsul\Documents\GitHub\BA-Path-planning\Image Processing\Calibration etc\Refrence.png');      % empty table
%Icur = imread('C:\Users\hfsul\Documents\GitHub\BA-Path-planning\Image Processing\Calibration etc\current.png');  % with obstacles
Icur = imread('C:\Users\hfsul\Documents\GitHub\BA-Path-planning\Image Processing\demo_capture_color.jpg');
% gridImage = imread('Path Planning Grid.png')
gridImage = imread('Grid3.png');

load('cam.mat');
cameraParams = calibrationSession.CameraParameters;
% cameraParams = load('calibrationSession.mat').CameraParameters;

figure; 
imshow(Icur);
% title('Full Output View');

% 1) Undistort
IrefU = undistortImage(Iref, cameraParams,'OutputView','full');
IcurU = undistortImage(Icur, cameraParams,'OutputView','full');
% figure; 
% imshow(IrefU);
% title('Full Output View');
% figure; imshowpair(Iref,IrefU,'montage');
% figure; imshowpair(Icur,IcurU,'montage');


% 2) Compute tform once (provide imgPts/worldPtsMM your way)
% e.g., [imgPts, worldPtsMM] = getCorrespondencesSomehow();
% tform = fitgeotrans(movingPoints, worldPoints, 'projective');
% tform = fitgeotform2d(movingPoints, fixedPoints, 'projective');
tform = fitgeotform2d(movingPoints, fixedPoints, 'pwl');


% Define metric output view: 1 px = 1 mm
% Rout = imref2d([725 575], [0 575], [0 725]);
Rout = imref2d([725 575], [0 725], [0 575]);

% 3) Warp both images to metric grid

IrefG = imwarp(IrefU, tform);
IcurG = imwarp(IcurU, tform);
% figure; imshowpair(IrefG,IcurG,'montage');title('Image Warp2G');
% figure; imshow(IcurG);

% 4) Difference -> obstacle mask
D  = imabsdiff(rgb2gray(IcurG), rgb2gray(IrefG));
% figure; imshow(D);title('Difference');

BW = D > graythresh(D)*255;
% figure; imshow(BW);title('GrayT');

BW = imopen(BW, strel('disk',3));
% figure; imshow(BW);title('Open Strel');

BW = imclose(BW, strel('disk',5));
% figure; imshow(BW);title('Close Difference');

BW = imfill(BW,'holes');
% figure; imshow(BW);title('imfill obstacle mask');

% im=imread(BW); %Image read
% img_inserted = insertShape(IcurG,"rectangle",[movingPoints(1,1), movingPoints(1,2) 725 575],...
%     "ShapeColor","red",LineWidth=3);
% figure; imshow( img_inserted);
% img_inserted2 = insertShape(BW,"rectangle",[movingPoints(1,1)-3, movingPoints(1,2)-3 728 578],...
%     "ShapeColor","red",LineWidth=3);
% Suppose your logical image is bw
%[M, N] = size(BW);   % rows = M, cols = N

% Rectangle parameters
x = movingPoints(1,1);      % column index (start)
y = movingPoints(1,2);      % row index (start)
w = 728;      % width
h = 578;

% BW(y:y+h-1, x:x+w-1) = true;   % set pixels to 1 inside the rectangle

% BW(y, x:x+w-1) = true;             % top edge
% BW(y+h-1, x:x+w-1) = true;         % bottom edge
% BW(y:y+h-1, x) = true;             % left edge
% BW(y:y+h-1, x+w-1) = true;
[M,N] = size(BW);
x = max(1, ceil(x));
y = max(1, ceil(y));
x_end = min(N, floor(x + w - 1));
y_end = min(M, floor(y + h - 1));

if x <= x_end && y <= y_end
    BW(y,     x:x_end) = true;
    BW(y_end, x:x_end) = true;
    BW(y:y_end, x)     = true;
    BW(y:y_end, x_end) = true;
end

% figure; imshow(BW); %draw rectangle on image.
% --- DILATE ONLY INSIDE THE RECTANGLE ---

% Build an "interior" mask (exclude the 1-px border)
interiorMask = false(M,N);
xi = max(1, x+1);
yi = max(1, y+1);
xe = min(N, x_end-1);
ye = min(M, y_end-1);

if xe >= xi && ye >= yi
    interiorMask(yi:ye, xi:xe) = true;
else
    warning('Rectangle too thin to have an interior. Skipping interior dilation.');
end

% Choose dilation amount (pixels). If `inflate` is in mm, convert first:
inflate_mm = 32;
% If you know your scale s_mm_per_px, do: inflate_px = round(inflate_mm / s_mm_per_px);
inflate_px = inflate_mm; % assuming 1 px per mm for now

se = strel('disk', inflate_px);

% Dilate only the white pixels inside the rectangle
inside = BW & interiorMask;          % keep only interior whites
inside_dil = imdilate(inside, se);   % dilate them
inside_dil = inside_dil & interiorMask;  % clip dilation to interior area

% Keep everything outside the interior exactly as-is (including the border)
outside_or_border = BW & ~interiorMask;

% Combine back
BW_limited = outside_or_border | inside_dil;

figure; imshow(BW_limited); title('Inflated ONLY inside the rectangle');

BW_limited = 1-BW_limited;


figure; imshow(BW_limited); title('Negative');
%% Later Addition

%% PARAMETERS
nRows = 24;                 % grid rows (Y)
nCols = 30;                 % grid cols (X)
min_white_fraction = 0.02;  % threshold per cell (tune 0.01–0.1)
safety_dilate_px = 0;       % 0 (off) or small integer (e.g., 2–5) if you want inside-only dilation

[M,N] = size(BW_limited); 

% 1) Interior of your rectangle (skip the 1-px border you drew)
xi0 = max(1, x+1);
yi0 = max(1, y+1);
xe0 = min(size(BW,2), x_end-1);
ye0 = min(size(BW,1), y_end-1);
if xe0 < xi0 || ye0 < yi0
    error('Rectangle interior is empty. Check x,y,w,h (and the border thickness).');
end

% 2) Adjust interior to match target aspect ratio (cols/rows = 30/24 = 1.25)
targetAR = nCols / nRows;           % 1.25
w0 = xe0 - xi0 + 1;
h0 = ye0 - yi0 + 1;
currAR = w0 / h0;

xi = xi0; yi = yi0; xe = xe0; ye = ye0; % start from original interior

if abs(currAR - targetAR) > 1e-3
    % We will trim inside the rectangle to achieve target aspect ratio.
    % Keep center; prefer shrinking the larger dimension.
    cx = (xi0 + xe0) / 2;
    cy = (yi0 + ye0) / 2;

    % Candidate sizes (integers, at least 1 px)
    w_by_h = floor(h0 * targetAR);
    h_by_w = floor(w0 / targetAR);

    % Pick the option that stays within current interior best
    % Option A: Adjust width based on height (keep height)
    if w_by_h >= 1 && w_by_h <= w0
        wA = w_by_h; hA = h0;
        scoreA = (w0 - wA); % less trimming is better
    else
        scoreA = inf;
    end

    % Option B: Adjust height based on width (keep width)
    if h_by_w >= 1 && h_by_w <= h0
        wB = w0; hB = h_by_w;
        scoreB = (h0 - hB);
    else
        scoreB = inf;
    end

    if scoreA <= scoreB
        wN = max(1, w_by_h); hN = h0;
    else
        wN = w0; hN = max(1, h_by_w);
    end

    % Center the new box around (cx,cy), clamp to image
    xi = max(1, round(cx - (wN-1)/2));
    xe = min(size(BW,2), xi + wN - 1);
    yi = max(1, round(cy - (hN-1)/2));
    ye = min(size(BW,1), yi + hN - 1);

    % Recompute final size (in case of clamping)
    wN = xe - xi + 1; hN = ye - yi + 1;
    % Final sanity on aspect ratio
    if abs((wN/hN) - targetAR) > 0.02
        warning('Could not perfectly match target aspect ratio; proceeding with nearest fit.');
    end
else
    wN = w0; hN = h0;
end

% 3) Build interior mask and (optionally) dilate only inside
interiorMask = false(size(BW));
interiorMask(yi:ye, xi:xe) = true;

insideBW = BW & interiorMask;
if safety_dilate_px > 0
    se = strel('disk', safety_dilate_px);
    insideBW = imdilate(insideBW, se) & interiorMask;
end

% 4) Split adjusted interior into 24×30 bins and classify
col_edges = round(linspace(xi, xe+1, nCols+1)); % right edge exclusive
row_edges = round(linspace(yi, ye+1, nRows+1));

gridBlocked = false(nRows, nCols);
for r = 1:nRows
    r0 = row_edges(r); r1 = row_edges(r+1) - 1;
    for c = 1:nCols
        c0 = col_edges(c); c1 = col_edges(c+1) - 1;
        if r1 >= r0 && c1 >= c0
            patch = insideBW(r0:r1, c0:c1);
            fracWhite = nnz(patch) / numel(patch);
            gridBlocked(r,c) = fracWhite >= min_white_fraction;
        else
            gridBlocked(r,c) = false;
        end
    end
end
gridBlocked= -0.5.*(2.*gridBlocked -2);
% 5) Optional quick visual
vis = repmat(uint8(insideBW)*255,[1 1 3]);
% draw the adjusted interior frame
vis(yi:ye, [xi xi+1 xe-1 xe], :) = 0;  % thin black border
vis([yi yi+1 ye-1 ye], xi:xe, :) = 0;

% draw grid lines
for c = 1:numel(col_edges)
    xg = max(min(col_edges(c)-1, xe), xi);
    vis(yi:ye, xg, :) = 0;
end
for r = 1:numel(row_edges)
    yg = max(min(row_edges(r)-1, ye), yi);
    vis(yg, xi:xe, :) = 0;
end

% shade blocked cells
overlay = vis;
shadeVal = 96;
for r = 1:nRows
    r0 = row_edges(r); r1 = row_edges(r+1)-1;
    for c = 1:nCols
        if gridBlocked(r,c)
            c0 = col_edges(c); c1 = col_edges(c+1)-1;
            if r1 >= r0 && c1 >= c0
                for ch = 1:3
                    tmp = overlay(:,:,ch);
                    blk = false(size(tmp)); blk(r0:r1, c0:c1) = true;
                    tmp(blk) = uint8(max(0, double(tmp(blk)) - shadeVal));
                    overlay(:,:,ch) = tmp;
                end
            end
        end
    end
end

%figure; imshow(overlay); title('24×30 inside adjusted rectangle (dark = not blocked)');

% RESULT: 24x30 logical matrix
% disp(gridBlocked);
%save gridBlocked.mat gridBlocked

%%

% 
% % Inflate for safety
% inflate = 10;  % mm
% BW = imdilate(BW, strel('disk', inflate));
% figure; imshow(BW);title('Inflate for safety');

%Rectangle Insertion after BW
% [M,N] = size(BW);
% x = max(1, ceil(x));
% y = max(1, ceil(y));
% x_end = min(N, floor(x + w - 1));
% y_end = min(M, floor(y + h - 1));
% 
% if x <= x_end && y <= y_end
%     BW(y,     x:x_end) = true;
%     BW(y_end, x:x_end) = true;
%     BW(y:y_end, x)     = true;
%     BW(y:y_end, x_end) = true;
% end
% figure; imshow(BW);title('Rectangle insetion');

% 5) Coarse 25 mm occupancy grid (optional)
% gridSize = 25;
% [H,W] = size(BW);
% [xmm, ymm] = meshgrid(0:W-1, 0:H-1);
% G = accumarray([round(ymm(:)/gridSize)+1, round(xmm(:)/gridSize)+1], BW(:), [], @max);
% figure; imshow(G);title('Coarse 25 mm occupancy grid');


% 6) Plan (placeholder)
% start_mm = [ 50  50];
% goal_mm  = [520 680];
% startCell = round(start_mm/gridSize)+1;
% goalCell  = round(goal_mm /gridSize)+1;
% [path_cells, cost] = beesPlanner(G, startCell, goalCell);   % <- your BA
% path_mm = (path_cells-1)*gridSize + gridSize/2;

% 7) Convert to robot base coords with T_base_grid (you calibrate this)
% p_base = (T_base_grid * [path_mm, zeros(size(path_mm,1),1), ones(n,1)]')';
