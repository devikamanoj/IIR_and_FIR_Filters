% FIR lowpass filter using MATLAB

clear all;
clc;
N = 512;
O = 64; %order of the figure
fc = 1200;
fs = 3000;

%Normalising frequency
Wc=2*(fc/fs);
%calculation of filter coefficients
b=fir1(O,Wc,'low');
%plotting the filter response, returns the frequency response at n sample points
freqz(b,1,N,fs);
title('Magnitude and Phase response of FIR Lowpass Filter');

%-------------------------------------------------------------------------------------------%

% FIR Bandpass filter using MATLAB
clear all;
clc;
N=512;
O=64; %order of the figure
fn = [300 800];
fs = 3000;

%Normalising frequency
Wc=2*(fn/fs);
%calculation of filter coefficients
b=fir1(O,Wc,'bandpass');
%plotting the filter response, returns the frequency response at n sample points
freqz(b,1,N,fs);
title('Magnitude and Phase response of FIR Bandpass Filter');

%-------------------------------------------------------------------------------------------%

% FIR Highpass filter using MATLAB
clear all;
clc;
N=512;
O=64; %order of the figure
fc = 1200;
fs = 3000;

%Normalising frequency
Wc=2*(fc/fs);
%calculation of filter coefficients
b=fir1(O,Wc,'high');
%plotting the filter response, returns the frequency response at n sample points
freqz(b,1,N,fs);
title('Magnitude and Phase response of FIR Highpass Filter');

%-------------------------------------------------------------------------------------------%

% FIR Bandstop filter using MATLAB
clear all;
clc;
N=512;
O=64; %order of the figure
fn = [300 800];
fs = 3000;

%Normalising frequency
Wc=2*(fn/fs);
%calculation of filter coefficients
b=fir1(O,Wc,'stop');
%plotting the filter response, returns the frequency response at n sample points
freqz(b,1,N,fs);
title('Magnitude and Phase response of FIR BandStop Filter');