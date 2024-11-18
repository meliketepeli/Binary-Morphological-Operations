clc
clear all;
image=imread("Tepeli.png"); 

gray_image=rgb2gray(image);   %1
imshow(gray_image); 

thresh=0.35;   %2
binary_image = im2bw(gray_image, thresh); 
figure;
imshow(binary_image);

mask=[1,1,1; 1,1,1; 1,1,1];   %3
er_image=imerode(binary_image, mask);
figure;
imshow(er_image);

dil_image=imdilate(er_image,mask);  %4
figure;
imshow(dil_image);

new_mask=strel('square', 7); %5
opening_bin_image=imopen(binary_image, new_mask);
figure;
imshow(opening_bin_image);

closing_bin_image=imclose(binary_image,new_mask);  %6
figure;
imshow(closing_bin_image);

