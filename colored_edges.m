I = imread('./filename.png'); % filepath of image here
Im = im2double(I);

[r,g,b] = imsplit(Im);

% this helps determine how large our filters will be
% you can define different sigma for LoG and gaussian filter if you like
sigma = 2;

h = fspecial('gaussian', 2 * ceil(3 * sigma) + 1, sigma);

% these two filters help to show edges
h2 = fspecial('log', 2 * ceil(3 * sigma) + 1, sigma);
h3 = fspecial('laplacian', 0.1);
% this filter is for the edge color we want to preserve
h4 = [1,1,1,1,1;        
      0,0,0,0,0;
      0,0,0,0,0;        
      0,0,0,0,0;
      -1,-1,-1,-1,-1];


% apply gaussian smoothing
im_red = img_filter(r,h);
im_green = img_filter(g,h);
im_blue = img_filter(b,h);

% apply edge filters of your choosing
im_red = img_filter(im_red,h4);
im_green = img_filter(im_green,h3);
im_blue = img_filter(im_blue,h2);

im_final = cat(3, im_red, im_green, im_blue);

im_final = im2uint8(im_final);

% save image with filename of your choice
imwrite(im_final, 'final_name.png');