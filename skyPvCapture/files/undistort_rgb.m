%UNDISTORT unwrap part of the rgb image onto a plane perpendicular to the
%camera axis
%   B = UNDISTORT(OCAM_MODEL, A, FC, DISPLAY)
%   A is the input image
%   FC is a factor proportional to the distance of the camera to the plane;
%   start with FC=5 and then tune the parameter to change the result.
%   DISPLAY visualizes the output image if set to 1; its default value is
%   0.
%   B is the final image
%   Note, this function uses nearest neighbour interpolation to unwrap the
%   image point. Better undistortion methods can be implemented using
%   bilinear or bicub interpolation.
%   Note, if you want to change the size of the final image, change Nwidth
%   and Nheight
%   Author: Davide Scaramuzza, 2009

function Dimg = undistort_rgb(ocam_model, img, fc, display)

% Parameters of the new image
Nwidth = 1280; %size of the final image
Nheight = 1280;
Nxc = Nheight/2;
Nyc = Nwidth/2;
Nz  = -Nwidth/fc;

if ~isfield(ocam_model,'pol') 
    width = ocam_model.width;
    height = ocam_model.height;
    %The ocam_model does not contain the inverse polynomial pol
    ocam_model.pol = findinvpoly(ocam_model.ss,sqrt((width/2)^2+(height/2)^2));
end

if nargin < 3
    fc = 5;%distance of the plane from the camera, change this parameter to zoom-in or out
    display = 0;
end

Dimg = zeros(Nheight, Nwidth, 3);

[i,j] = meshgrid(1:Nheight,1:Nwidth);
Nx = i-Nxc;
Ny = j-Nyc;
Nz = ones(size(Nx))*Nz;
M = [Nx(:)';Ny(:)';Nz(:)'];
m = world2cam_fast( M , ocam_model );

[r,g,b] = get_color_from_imagepoints(img, m');
Dimg(:,:,1) = reshape(r,Nwidth,Nheight)';
Dimg(:,:,2) = reshape(g,Nwidth,Nheight)';
Dimg(:,:,3) = reshape(b,Nwidth,Nheight)';

Dimg = uint8(Dimg);
if display
    figure; imshow(Dimg); %colormap(gray);
end



