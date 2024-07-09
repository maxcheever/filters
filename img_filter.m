function [img1] = img_filter(img0, h)
% input: image img0 and filter h
% output: img0 cross correlated with filter h img1

    [i, j] = size(img0);
    [x, y] = size(h);
    
    % add replicate image padding based on size of filter
    pad_size = ([x, y]-1)/2;
    pad_img = padarray(img0, pad_size, 'replicate', 'both');
    
    img1 = zeros(i,j);
    
    % correlation
    for col = 1:i
        for row = 1:j
            img1(col,row) = sum(sum(pad_img(col:col+x-1, row:row+y-1).*h));
        end
    end

end

