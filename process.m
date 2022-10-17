function [maxima, minima, min_ind, max_ind, amplitudes] = process(data)
    [maxima, max_ind] = findpeaks(data);
    [minima, min_ind] = findpeaks(-data);
%     num_peaks = size(max_ind, 1);
%     amplitudes = zeros(num_peaks, 1);
%     for i = 1: num_peaks
%         amplitudes(i,1) = abs(maxima(i,1) - minima(i,1));
%     end
end

