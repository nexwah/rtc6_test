clc
clear
close all

%% read the BMP file into a matrix
img = imread('C:\Users\liuqiyao\OneDrive - A STAR\Desktop\pattern_test.jpg');

% display the image
imshow(img);
hold on
% get the size of the image
[h, w, c] = size(img)

% convert the image to grayscale if it has more than one color channel
if c > 1
    img = rgb2gray(img);
end

% convert the image data to a double precision matrix
img = double(img);

% normalize the image data to the range [0,1]
A = 1-img / 255;
size(A);
figure
imshow(A)
shutter=A>0;

%% read amporous.txt as function
%% read txt
fid = fopen('C:\Users\liuqiyao\OneDrive - A STAR\Desktop\amorphous_func_test.txt', 'r');
data = textscan(fid, '%f %f %f', 'HeaderLines', 1);
data = cell2mat(data);

% transfer 2D matrix to fucntion: f(x)
f = griddedInterpolant(data(:,2), data(:,1));
pulse_generator=round(f(A))