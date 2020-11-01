input = imread('FigP0936.tif');
input_edges = edge(input,'Canny');
input_edges=medfilt2(input_edges,[2 2]);
input_edges=bwareaopen(input_edges,130);
figure;
imshow(input_edges);