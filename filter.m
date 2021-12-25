close all; clear all;

% generate signal
fs = 100; % sampling frequency
f = 5;     % signal frequency
t = 5;      % time duration
n = [0:1/fs:t]; % sample vector

x = 2*sin(2*pi*f*n); % single tone signal

z = awgn(x,1);  % noisy signal

subplot(2,1,1); plot(n,x); title('Sinusoidal signal');
subplot(2,1,2); plot(n,z); title('signal with noise');

%% IIR Butterworth LPF filter Design
o = 40;  % order of the filter
Wc = 2*pi*f/fs;     % normalized cut-off frequency (as of signal freq)

[b,a] = butter(o,Wc,'low'); % Nr and Dr coeff. of IIR butterworth filter

fvtool(b,a); % filter frequency response

% filter the signal
x_f_iir = filter(b,a,z);

figure; plot(n,x_f_iir); title('Filtered Sinusoidal Signal of IIR ');

%% FIR Filter Design
o = 40;
b = fir1(o,Wc); % FIR low pass filter

figure;freqz(b,1,512); % frequency response of FIR LPF filter

% filter the signal
x_f_fir = filter(b,1,z);

figure; plot(n,x_f_fir); title('Filtered Sinusoidal Signal of FIR');
