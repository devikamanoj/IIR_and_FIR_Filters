while true
    disp('    Magnitude and Phase response of FIR Filters');
    disp('    -------------------------------------------');
    fprintf('\n') 
    disp('1 - FIR LowPass Filter');
    disp('2 - FIR HightPass Filter');
    disp('3 - FIR Bandpass Filter');
    disp('4 - FIR Bandstop Filter');
    disp('5 - Exit')
    n = input('Choose an option: ');
    
    % FIR filter using MATLAB
    
    clc;
    if (n~=5)
    O = input('Enter the order of figure: ');
    fs = input('Enter the sampling frequency: ');
    end
    
    N = 512;
    
    if (n==1) || (n==2)
        fc = input('Enter the cutt-off frequency: ');
        %Normalising frequency for LowPass/HighPass
        Wc_lh=2*(fc/fs);
    elseif (n==3) || (n==4)
        fn = input('Enter the passband range of frequencies: ');
        %Normalising frequency for BandStop/BandPass
        Wc_sp=2*(fn/fs);
    end
    
    switch n
        case 1
    
            %calculation of filter coefficients
            lowpass_b=fir1(O,Wc_lh,'low');
            %plotting the filter response, returns the frequency response at n sample points
            freqz(lowpass_b,1,N,fs);
            title('Magnitude and Phase response of FIR Lowpass Filter');
        
        case 2
            %calculation of filter coefficients
            highpass_b=fir1(O,Wc_lh,'high');
            %plotting the filter response, returns the frequency response at n sample points
            freqz(highpass_b,1,N,fs);
            title('Magnitude and Phase response of FIR Highpass Filter');
    
        case 3
            %calculation of filter coefficients
            bandpass_b=fir1(O,Wc_sp,'bandpass');
            %plotting the filter response, returns the frequency response at n sample points
            freqz(bandpass_b,1,N,fs);
            title('Magnitude and Phase response of FIR Bandpass Filter');
    
        case 4
            %calculation of filter coefficients
            bandstop_b=fir1(O,Wc_sp,'stop');
            freqz(bandstop_b,1,N,fs);
            title('Magnitude and Phase response of FIR BandStop Filter');
        case 5
            break;
    
        otherwise
            disp('Wrong Option')
    end
end