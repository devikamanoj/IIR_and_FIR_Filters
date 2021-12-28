% IIR Butterworth Lowpass filter using MATLAB
clear all;
clc;
N=512;
n=6;%order of the filter
fc = input("Enter the cut off  frequency: ");
fs = input("Enter sampling frequency: ");

%Normalising frequency
Wc=2*(fc/fs);
[b,a]=butter(n,Wc,'low'); %calculate the filter coefficient
freqz(b,a,N,fs) %plotting the filter response
title('Magnitude and Phase response of IIR Butterworth Lowpass filter');