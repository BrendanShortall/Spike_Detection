function [stim1_pks,stim1_pk_ind,stim2_pks,stim2_pk_ind,pre1_pks,pre1_pk_ind,pre2_pks,pre2_pk_ind,stim_1_filtered,stim_2_filtered,pre_1_filtered,pre_2_filtered] = start_up()
stim_30= abfload('stim30min_0000.abf','start',0,'stop','e');
pre_30= abfload('pre30min_0000.abf','start',0,'stop','e');
fs = 1000; %sample rate
%Chebychev bandpass filter .5-300hz passband, .1 peak-to-peak passband ripple
[b,a] = cheby1(1,.1, [.5 300]/fs, 'bandpass');
stim_1_filtered = filter(b,a,stim_30(:,1));
stim_2_filtered = filter(b,a,stim_30(:,2));
pre_1_filtered = filter(b,a,pre_30(:,1));
pre_2_filtered = filter(b,a,pre_30(:,2));
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

end

