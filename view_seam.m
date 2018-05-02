function view_seam(im,seam,seamDirection)
%view_seam plots the seam over the image
%
if strcmp(seamDirection,'VERTICAL')
    figure
    imshow(im)
    hold on
    scatter(seam,[1:size(seam,2)])
elseif strcmp(seamDirection,'HORIZONTAL')
    figure
    imshow(im)
    hold on
    scatter(1:size(seam,2),seam)
end

end

