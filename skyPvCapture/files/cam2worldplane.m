%projection to world (sky plane)
clc;
clear all;
cali_result = load('D:/Fisheye_CamCalib/Omni_Calib_Results.mat');

img_n = 1;

for im=1:302
    img = imread(sprintf('E:/skyimage/original/img_%03d.jpeg', im)); % Read frame
    undist = undistort_rgb(cali_result.calib_data.ocam_model,img,4,0);
    %figure;
    imwrite(undist,sprintf('E:/skyimage/undist/img_%03d.jpeg', img_n));
    img_n = img_n + 1;
end




