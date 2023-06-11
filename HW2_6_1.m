clc; close all; clear;

%%
file_name = 'Lab2_6-5-c.jpg';
img = double(imread(file_name));
img = img./255.0;
[rows, columns, channels] = size(img);
img_XYZ = sRGB2XYZ(img);
img_XYZ = img_XYZ.*100;
XYZ_destination = [95.047, 100.0, 108.883];
%% Method 1:    (execute one method at a time)
XYZ_source = method1(img_XYZ);
%% Method 2:
img_XYZ_method2 = reshape(img_XYZ', [rows, columns, channels]);
XYZ_source = method2(img_XYZ_method2, file_name);
%% Method 3:
XYZ_source = method3(img);
%% Chromatic adaptation: Von Kries  (execute both chormatic adaptation methods)
corrected_XYZ_VonKries = vonKries(img_XYZ, XYZ_source, XYZ_destination);
corrected_RGB_VonKries = XYZ2sRGB(corrected_XYZ_VonKries);
corrected_RGB_VonKries = reshape(corrected_RGB_VonKries, [rows, columns, channels]);
corrected_RGB_VonKries = corrected_RGB_VonKries.*255.0;
corrected_RGB_VonKries = uint8(corrected_RGB_VonKries);
%% Chromatic adaptation: CAT02
corrected_XYZ_CAT02 = CAT02(img_XYZ, XYZ_source, XYZ_destination);
corrected_RGB_CAT02 = XYZ2sRGB(corrected_XYZ_CAT02);
corrected_RGB_CAT02 = reshape(corrected_RGB_CAT02, [rows, columns, channels]);
corrected_RGB_CAT02 = corrected_RGB_CAT02.*255.0;
corrected_RGB_CAT02 = uint8(corrected_RGB_CAT02);
%% Results:
figure, 
subplot(1,3,1)
imshow(img,[])
subplot(1,3,2)
imshow(corrected_RGB_VonKries)
subplot(1,3,3)
imshow(corrected_RGB_CAT02)