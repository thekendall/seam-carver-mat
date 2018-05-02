image = imread('ostrich.jpg');
im = image;

energy = energy_img(image);
cum = cumulative_min_energy_map(energy, 'VERTICAL');
seam = find_vertical_seam(cum);

view_seam(im, seam, 'VERTICAL');

for i = 1:300
    [image, energy] = decrease_width(image, energy);
end
figure
imshow(image)




