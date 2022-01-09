while true
    disp('    Magnitude and Phase response of IIR Filters');
    disp('    -------------------------------------------');
    fprintf('\n') 
    disp('1 - IIR Butterworth Lowpass filter');
    disp('2 - IIR Butterworth Highpass filter');
    disp('3 - IIR Chebyshev Lowpass filter');
    disp('4 - IIR Chebyshev Highpass filter');
    disp('5 - Exit')
    n = input('Choose an option: ');
    
    % IIR filter using MATLAB
    
    clc;
    if (n~=5)
    kp = input('Enter the passband ripple: ');
    ks = input('Enter the stop attenuation: ');
    fs = input('Enter the sampling frequency: ');
    end

    % Normalising filter
    wp = fp/(fs/2);
    % Normalising filter
    ws = Fs/(fs/2);

    if (n==1) || (n==2)
        fp = input('Enter the passband frequency: ');
        %To determine the filter order and cut-off frequency
        [N, wc] = buttord(wp, ws, kp, ks);
    elseif (n==3) || (n==4)
        Fs = input('Enter the stopband frequency: ');
        %To determine the filter order and cut-off frequency
        [N, wc] = cheb1ord(wp, ws, kp, ks);   
    end
    
    switch n
        case 1 % Butterworth Filters 
            [den, num] = butter(N, wc, 'low')% To normalise the cut-off frequency wc
            freqz(den, num, 1000, fs);%plot the response
            title('Magnitude and Phase response of IIR Butterworth Lowpass filter');
    
        case 2 % Butterworth Filters
            [b, a] = butter(N, wc, 'high')
            freqz(b, a, 1000, fs); %plot the response
            title('Magnitude and Phase response of IIR Butterworth Highpass filter');
            
        case 3 %Chebyshev Filter
            [b, a] = cheby1(N, kp, wc, 'low')   
            freqz(b, a, 1000, fs)    %plot the response
            title('Magnitude and Phase response of IIR Chebyshev Lowpass filter');
    
        case 4 %Chebyshev Filter
            [b, a] = cheby1(N, kp, wc, 'high')   
            freqz(b, a, 1000, fs)    %plot the response
            title('Magnitude and Phase response of IIR Chebyshev Highpass filter');
          
        case 5
            break;
    
        otherwise
            disp('Wrong Option')
    end
end