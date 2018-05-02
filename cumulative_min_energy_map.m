function cumulativeEnergyMap = cumulative_min_energy_map(energyImg,seamDirection)
%Uses Dynamic Programming approach to calculate minimum seam.
%   For each row > 1. We create a previous row with NaN padding on the left
%   and right side. Next, we shift the array to the left and right and
%   compare the values of the shifted left,right, and original previous
%   array and find the min. We add this to the row's current energy

if strcmp(seamDirection,'VERTICAL')
    cumulativeEnergyMap = energyImg;
    for i = 2:size(cumulativeEnergyMap,1)
        prev_row = cat(2, cat(2,[nan],cumulativeEnergyMap(i-1,:)),[nan]);
        shift_left = circshift(prev_row, 1);
        shift_right = circshift(prev_row, -1);
        min_prev = min(shift_right, min(prev_row, shift_left));
        
        cumulativeEnergyMap(i,:) = cumulativeEnergyMap(i,:) + min_prev(2:end-1);
    end
elseif strcmp(seamDirection , 'HORIZONTAL')
    cumulativeEnergyMap = energyImg;
    for i = 2:size(cumulativeEnergyMap,2)
        display(i)
        prev_row = cat(1, cat(1,[nan],cumulativeEnergyMap(:,i-1)),[nan]);
        shift_left = circshift(prev_row, 1);
        shift_right = circshift(prev_row, -1);
        min_prev = min(shift_right, min(prev_row, shift_left));
        
        cumulativeEnergyMap(:,i) = cumulativeEnergyMap(:,i) + min_prev(2:end-1);
    end
end

end

