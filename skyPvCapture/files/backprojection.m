%back projection
%project sky plane image back to hemishpere
clc;
clear all;
cali_result = load('D:/Fisheye_CamCalib/Omni_Calib_Results.mat');

ocam_model = cali_result.calib_data.ocam_model;
fc = 20;
img_n = 1;
for im = 1:302
    img = imread(sprintf('D:/skyimage/undist/img_%03d.jpeg', im)); % Read frame
    b_img = backproject(ocam_model, img, fc);

%--------
    m_img = maskimg(img, ocam_model);
    %m_img = rgb2gray(m_img);
    imwrite(b_img,sprintf('D:/skyimage/backpro/img_%03d.jpeg', img_n));
    img_n = img_n + 1;
end





