function verticalSeam = find_vertical_seam(cumulativeEnergyMap)
%find_vertical_seam finds the vertical seam
%   cumulativeEnergyMap is a vertical cumlativeEnergyMap
%   returns a vector with the column indexes.

% pad cumulativeEnergyMap
pad_nan = ones(size(cumulativeEnergyMap,1),1)*nan;
cumulativeEnergyMap = cat(2,cat(2,pad_nan,cumulativeEnergyMap),pad_nan);

% Finds the first minimum of the lowest row.
verticalSeam = [find(cumulativeEnergyMap(end,:) == min(cumulativeEnergyMap(end,:)),1)];


for i = size(cumulativeEnergyMap,1)-1:-1:1
    row = cumulativeEnergyMap(i,:);
    connected = [row(verticalSeam(1) - 1), row(verticalSeam(1)), row(verticalSeam(1)+1)];
    min_connected = find(connected == min(connected), 1);
    
    % 2 is an offset since left is -1, center is 0 and right is +1
    verticalSeam = [verticalSeam(1) - 2 + min_connected,verticalSeam];
end
verticalSeam = verticalSeam-1;

end

