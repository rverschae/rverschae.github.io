%backproject2cam
%project sky plane image back to hemisphere
%Input:
%   ocam_model:fisheye lens calibration data
%   img: rgb image
%   fc: focal length
function b_img = backproject(ocam_model, img, fc)

% Parameters of the new image
Nwidth = 1280; %size of the final image
Nheight = 1280;
Nxc = Nheight/2;
Nyc = Nwidth/2;
Nz  = -Nwidth/fc;

xc = ocam_model.xc;
yc = ocam_model.yc;
c = ocam_model.c;
d = ocam_model.d;
e = ocam_model.e;

if ~isfield(ocam_model,'pol') 
    width = ocam_model.width;
    height = ocam_model.height;
    %The ocam_model does not contain the inverse polynomial pol
    ocam_model.pol = findinvpoly(ocam_model.ss,sqrt((width/2)^2+(height/2)^2));
end

[i,j] = meshgrid(1:Nheight,1:Nwidth);
x = (i-d*j-xc+d*yc)/(c-d*e);
y = j-e*x-yc;
z = ones(size(x))*Nz;
m = [x(:)';y(:)';z(:)'];
norm = sqrt(m(1,:).^2 + m(2,:).^2);
ind0 = find(norm == 0);
norm(ind0) = eps;

theta = atan(m(3,:)./norm);

rho = polyval(ocam_model.pol, theta);
M(1,:) = m(1,:).*norm./rho;
M(2,:) = m(2,:).*norm./rho;
M(1,:) = M(1,:) + ocam_model.xc;
M(2,:) = M(2,:) + ocam_model.yc;

[r,g,b] = get_color_from_imagepoints(img, M');
b_img(:,:,1) = reshape(r,Nwidth,Nheight)';
b_img(:,:,2) = reshape(g,Nwidth,Nheight)';
b_img(:,:,3) = reshape(b,Nwidth,Nheight)';




