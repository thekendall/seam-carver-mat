function [reducedColorImg,reducedEnergyImg] = decrease_width(im,energyImg)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

cumulative_energy = cumulative_min_energy_map(energyImg,'VERTICAL');
seam = find_vertical_seam(cumulative_energy);

temp = energyImg.';
temp(sub2ind(size(temp),seam,1:size(temp,2))) = [];
reducedEnergyImg = reshape(temp,[],size(energyImg,1)).';

r = im(:,:,1);
g = im(:,:,2);
b = im(:,:,3);

temp = r.';
temp(sub2ind(size(temp),seam,1:size(temp,2))) = [];
r = reshape(temp,[],size(r,1)).';

temp = g.';
temp(sub2ind(size(temp),seam,1:size(temp,2))) = [];
g = reshape(temp,[],size(g,1)).';

temp = b.';
temp(sub2ind(size(temp),seam,1:size(temp,2))) = [];
b = reshape(temp,[],size(b,1)).';

reducedColorImg = cat(3,r,g,b);
end

