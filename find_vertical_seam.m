function verticalSeam = find_vertical_seam(cumulativeEnergyMap)
%find_vertical_seam finds the vertical seam
%   cumulativeEnergyMap is a vertical cumlativeEnergyMap
%   returns a vector with the column indexes.

% pad cumulativeEnergyMap
pad_nan = ones(size(cumulativeEnergyMap,1),1)*nan;
cumulativeEnergyMap = cat(2,cat(2,pad_nan,cumulativeEnergyMap),pad_nan);
display(cumulativeEnergyMap)
verticalSeam = [find(cumulativeEnergyMap(end,:) == min(cumulativeEnergyMap(end,:)),1)]

% Find min of the last row.

for i = size(cumulativeEnergyMap,1)-1:-1:1
    row = cumulativeEnergyMap(i,:);
    left = row(verticalSeam(end) - 1);
    center = row(verticalSeam(end));
    right = row(verticalSeam(end)+1);
    verticalSeam = [verticalSeam, find(row == min(min(left,center),right),1)];
end
verticalSeam = verticalSeam-1

end

