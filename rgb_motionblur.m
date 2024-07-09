I = imread('./filename.png'); % filepath of image here
Im = im2double(I);

[r,g,b] = imsplit(Im);

% this helps determine how large our gaussian filter will be 
sigma = 2;

h = fspecial('gaussian', 2 * ceil(3 * sigma) + 1, sigma);

% three different motion blur filters
h2 = fspecial('motion', 200, 10);
h3 = fspecial('motion', 400, 39);
h4 = fspecial('motion', 600, 102);


% apply gaussian smoothing
im_red = img_filter(r,h);
im_green = img_filter(g,h);
im_blue = img_filter(b,h);

% apply motion blur by color channel
im_red = img_filter(im_red,h2);
im_green = img_filter(im_green,h3);
im_blue = img_filter(im_blue,h4);

im_final = cat(3, im_red, im_green, im_blue);

im_final = im2uint8(im_final);

% save image with filename of your choice
imwrite(im_final, 'final_name.png');