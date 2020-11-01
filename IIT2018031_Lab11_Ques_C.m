input = imread('FigP0936.tif');
input_edges = edge(input,'Canny');
temp = input_edges;
input_edges=medfilt2(input_edges,[2 2]);
input_edges=bwareaopen(input_edges,130);
outputfig = temp-input_edges;
figure;
imshow(outputfig);