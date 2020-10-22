% IIT2018031 Lab 10

Ques1_a
A = imread('larrypage2.jpg');
A = rgb2gray(A);
A = uint8(imresize(A,[128 128]));
[R C] = size(A);
sigma = [0.5 0.8 0.9];
for k = 1:size(sigma,2)
    F = fspecial('gaussian',[5 5],sigma(k));
    B = zeros(R+4,C+4);
    B(3:R+2,3:C+2) = A;
    for i = 3:R+2
        for j = 3:C+2
            I_FILTERED(i-2,j-2) = sum(B(i-2:i+2,j-2:j+2).*F,'all');
        end
    end
    subplot(1,3,k);
    imshow(I_FILTERED,[]);
   title('Sigma:'+string(sigma(k)))
end

Ques1_b

 A = imread('larrypage2.jpg');
A = rgb2gray(A);
A = uint8(imresize(A,[128 128]));
[R C] = size(A);
sigma = [0.5 0.8 0.9];
for k = 1:size(sigma,2)
    F = fspecial('gaussian',[5 5],sigma(k));
    B = zeros(R+4,C+4);
    B(3:R+2,3:C+2) = A;
    I_FILTERED = zeros(R+2,C+2);
    for i = 3:R+2
        for j = 3:C+2
            I_FILTERED(i-1,j-1) = sum(B(i-2:i+2,j-2:j+2).*F,'all');
        end
    end
    L = [0 1 0;1 -4 1;0 1 0]
    for i = 2:R+1
        for j = 2:C+1
            I_SHARP(i-1,j-1) = sum(I_FILTERED(i-1:i+1,j-1:j+1).*L,'all');
        end
    end
    subplot(1,3,k);
    imshow(I_SHARP-I_FILTERED(2:R+1,2:C+1),[]);
    title('Sigma:'+string(sigma(k)))
end


Ques1_c

A = imread('larry page.jpg');
A = rgb2gray(A);
A = uint8(imresize(A,[128 128]));
[R C] = size(A);
sigma = [0.5 0.8 0.9];
for k = 1:size(sigma,2)
    F = fspecial('gaussian',[5 5],sigma(k));
    B = zeros(R+4,C+4);
    B(3:R+2,3:C+2) = A;
    I_FILTERED = zeros(R+2,C+2);
    for i = 3:R+2
        for j = 3:C+2
            I_FILTERED(i-1,j-1) = sum(B(i-2:i+2,j-2:j+2).*F,'all');
        end
    end
    L = [0 1 0;1 -4 1;0 1 0];
    for i = 2:R+1
        for j = 2:C+1
            I_SHARP(i-1,j-1) = sum(I_FILTERED(i-1:i+1,j-1:j+1).*L,'all');
        end
    end
    IX = abs(I_SHARP)-I_FILTERED(2:R+1,2:C+1);
    IOUT = double(A)+IX;
    subplot(1,3,k);
    imshow(IOUT,[]);
    title('Sigma:'+string(sigma(k)))
end

Ques2

i=imread('larry page.jpg');
Log_filter = fspecial('log',[5,5],4.0);
                                    
i_LOG = imfilter(i,Log_filter,'symmetric', 'conv');
imshow(i_LOG)
