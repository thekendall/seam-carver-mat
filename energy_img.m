function energyImg = energy_img( img )
%energy_img: Uses gradient magnitude to calculate the energy in an image.
%   im = RGB image
%   energyImg = Output Gradient Magnitude 2D double of size img.
%   Uses sqrt(dx^2 + dy^2) to compute the gradient.

gray = rgb2gray(img);

%Compute Gradient
dx = double(imfilter(gray, [-1,1]));
dy = double(imfilter(gray, [-1;1]));
energyImg = sqrt(dx.^2 + dy.^2);

end

