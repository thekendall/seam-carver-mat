function horizontalSeam = find_horizontal_seam(cumulativeEnergyMap)
%find_horizontal_seam finds the horizontal seam
%   cumulativeEnergyMap is a vertical cumlativeEnergyMap
%   returns a vector with the column indexes.

% pad cumulativeEnergyMap
pad_nan = ones(1,size(cumulativeEnergyMap,2))*nan
cumulativeEnergyMap = cat(1,cat(1,pad_nan,cumulativeEnergyMap),pad_nan)

% Finds the first minimum of the lowest row.
cumulativeEnergyMap(:,end)
horizontalSeam = [find(cumulativeEnergyMap(:,end) == min(cumulativeEnergyMap(:,end)),1)]


for i = size(cumulativeEnergyMap,2)-1:-1:1
    row = cumulativeEnergyMap(:,i);
    connected = [row(horizontalSeam(1) - 1), row(horizontalSeam(1)), row(horizontalSeam(1)+1)];
    min_connected = find(connected == min(connected), 1);
    
    % 2 is an offset since left is -1, center is 0 and right is +1
    horizontalSeam = [horizontalSeam(1) - 2 + min_connected,horizontalSeam];
end
horizontalSeam = horizontalSeam-1;

end

