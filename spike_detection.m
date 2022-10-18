function [valid_peaks,peak_ind] = spike_detection(data,threshold)
%Function takes in data and a threshold value. Returns the peaks that exceed the threshold. Each peak returns a value and index. 
%Get local maxima/minima values
[maxima, minima, min_ind, max_ind] = process(data);
minima = -minima;
%Find peaks that are less than the specified threshold
invalid_peaks = find(maxima < threshold);
%Remove the peaks that are invalid, or not above the threshold
maxima(invalid_peaks)=[];
max_ind(invalid_peaks)=[];
invalid_below = find(minima > -threshold);
minima(invalid_below) = [];
min_ind(invalid_below) = [];
%Return all valid peaks 
valid_peaks = [maxima;minima];
peak_ind = [max_ind;min_ind];
end

