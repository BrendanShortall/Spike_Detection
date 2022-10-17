%% Load ABF data
stim_30= abfload('stim30min_0000.abf','start',0,'stop','e');
pre_30= abfload('pre30min_0000.abf','start',0,'stop','e');
time = transpose(.001:.001:1800);
%% Plot pre-processed data
figure(1)
sgtitle("Pre-processed data (Channel 1 only)")
subplot(1,2,2)
plot(time,stim_30(:,1))
ylim([-2.5, 2.5])
title("Stim data pre-processed")
subplot(1,2,1)
plot(time, pre_30(:,1))
ylim([-2.5, 2.5])
title("Pre data pre-processed")
%% Chebychev Bandpass
fs = 1000; %sample rate
 %Chebychev bandpass filter .5-300hz passband, .1 peak-to-peak passband ripple
[b,a] = cheby1(1,.1, [.5 300]/fs, 'bandpass');
stim_1_filtered = filter(b,a,stim_30(:,1));
stim_2_filtered = filter(b,a,stim_30(:,2));
pre_1_filtered = filter(b,a,pre_30(:,1));
pre_2_filtered = filter(b,a,pre_30(:,2));
% figure(2)
% plot(time,stim_30(:,1), '-', time,stim_1_filtered,'-');
%% Bandpass
% Apply a .5Hz - 300Hz band pass filter on data
% fs = 1000; %Sample rate
% pass = [.5 300]; % Bandpass values
% stim_1_filtered = bandpass(stim_30(:,1), pass, fs);
% stim_2_filtered = bandpass(stim_30(:,2), pass, fs);
% pre_1_filtered = bandpass(pre_30(:,1), pass, fs);
% pre_2_filtered = bandpass(pre_30(:,2), pass, fs);
%% Spike Detection
thresh = .5603; %From previous calculations. Needs to be refined
%Calculate peaks
%Stim channel 1
[stim1_pks, stim1_pk_ind] = spike_detection(stim_1_filtered,thresh);
stim1_pk_ind = .001 *[stim1_pk_ind];
%stim channel 2
[stim2_pks, stim2_pk_ind] = spike_detection(stim_2_filtered,thresh);
stim2_pk_ind = .001 *[stim2_pk_ind];
%Pre Channel 1
[pre1_pks, pre1_pk_ind] = spike_detection(pre_1_filtered,thresh);
pre1_pk_ind = .001 *[pre1_pk_ind];
%Pre channel 2
[pre2_pks, pre2_pk_ind] = spike_detection(pre_2_filtered,thresh);
pre2_pk_ind = .001 *[pre2_pk_ind];
%plot peaks 
figure(2)
subplot(2,2,1)
hold on
plot(time,stim_1_filtered);
scatter(stim1_pk_ind,stim1_pks,2,'red','filled');
title("Stim channel 1 peaks")
hold off

subplot(2,2,2)
hold on
plot(time,stim_2_filtered);
scatter(stim2_pk_ind,stim2_pks,2,'red','filled');
title("Stim channel 2 peaks")
hold off

subplot(2,2,3)
hold on
plot(time,pre_1_filtered);
scatter(pre1_pk_ind,pre1_pks,2,'red','filled');
title("pre channel 1 peaks")
hold off

subplot(2,2,4)
hold on
plot(time,pre_2_filtered);
scatter(pre2_pk_ind,pre2_pks,2,'red','filled');
title("pre channel 2 peaks")
hold off
%% Plot histograms
figure(3)
subplot(2,2,1)
histogram(stim1_pk_ind, 1800)
ylim([0, 10])
title("Stim 1")

subplot(2,2,2)
histogram(stim2_pk_ind, 1800)
ylim([0, 10])
title("Stim 2")

subplot(2,2,3)
histogram(pre1_pk_ind, 1800)
title("Pre 1")

subplot(2,2,4)
histogram(pre2_pk_ind, 1800)
ylim([0, 10])
title("Pre 2")
%sliding window
%look into different filters
