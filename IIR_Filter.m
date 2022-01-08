clear all;
clc;

kp = 3;           % passband ripple
ks = 60;          % stop attenuation
fp = 40;          % passband frequency
fs = 1000;        % sampling frequency
Fs = 150;         % stop band frequency

% Normalising filter
wp = fp/(fs/2);
ws = Fs/(fs/2);

% Butterworth Filters

%To determine the filter order and cut-off frequency
[N wc] = buttord(wp, ws, kp, ks);

disp(' IIR Butterworth Lowpass filter');
disp(' -------------------------------------------'); 
[den num] = butter(N, wc, 'low')% To normalise the cut-off frequency wc
freqz(den, num, 1000, fs);%plot the response
title('Magnitude and Phase response of IIR Butterworth Lowpass filter');

disp(' IIR Butterworth Lowpass filter ');
disp(' -------------------------------------------');
[b a] = butter(N, wc, 'high')
freqz(b, a, 1000, fs); %plot the response
title('Magnitude and Phase response of IIR Butterworth Highpass filter');

%Chebyshev Filter

%To determine the filter order and cut-off frequency
[N wc] = cheb1ord(wp, ws, kp, ks);   

disp(' IIR Chebyshev Lowpass filter');
disp(' -------------------------------------------'); 
[num den] = cheby1(N, kp, wc, 'low')   
freqz(b, a, 1000, fs)    %plot the response
title('Magnitude and Phase response of IIR Chebyshev Lowpass filter');

disp(' IIR Chebyshev Highpass filter ');
disp(' -------------------------------------------'); 
[num den] = cheby1(N, kp, wc, 'high')   
freqz(b, a, 1000, fs)    %plot the response
title('Magnitude and Phase response of IIR Chebyshev Highpass filter');