function [valid_peaks,peak_ind] = spike_detection(data,threshold)
[maxima, minima, min_ind, max_ind] = process(data);
minima = -minima;
invalid_peaks = find(maxima < threshold);
maxima(invalid_peaks)=[];
max_ind(invalid_peaks)=[];
invalid_below = find(minima > -threshold);
minima(invalid_below) = [];
min_ind(invalid_below) = [];
valid_peaks = [maxima;minima];
peak_ind = [max_ind;min_ind];
end

