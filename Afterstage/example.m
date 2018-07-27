close all
clear all
clc

%Nom et proprietes du stack d'image
Stack_name='0.06.tif';
Stack_info=imfinfo(Stack_name);
Stack_length=size(Stack_info,1) % nombre d'image du stack


I0=imread(Stack_name,1);
figure()
imshow(I0,[min(min(I0)),max(max(I0))])


I=imread(Stack_name,56);
figure()
imshow(I,[min(min(I)),max(max(I))])

Im=double(I)-double(I0);

figure()
imshow(Im,[min(min(Im)),max(max(Im))])
