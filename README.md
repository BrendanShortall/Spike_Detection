# Spike_Detection
This repo contains MATLAB code for analyzing EEG signals and extracting seizure spikes.

Begin by downloading the Spike Detection mlappinstall file. This will install the GUI onto your local matlab environment under the 'Apps' tab. This package should contain all of the necessary functions and files.  
  
On the app you can switch between filtered EEG data and a histogram of spike frequency, as well as switching between two channels. A slider allows you to change the histogram bin size on a range from 1ms-2000ms.  
  
Pictured below is the GUI showing a histogram with a bin size of roughly 800ms.  
![image](https://user-images.githubusercontent.com/115127093/196244783-9491dd82-4ad8-48fb-8eaa-224891bc9b77.png)  
If you wish to see the code that contains the spike detection and signal processing, download the entire timeline from the 'pre_stim_data_histogram.m' file.  
You will also need to download 'process.m', 'spike_detection.m', 'abfload.m', as well as the data files: 'pre30min_0000.abf' and 'stim30min_0000.abf'. 
