function key = detect_tone(toneSignal)
% Returns an array of the digits represented in toneSignal
% toneSignal = the input signal
% key = the touchtone key associate with tone

p = .018;

for l = 1:10
    
N = 2048;
    
    % m represents the indices of the tone signal without the silence and
    % is used to construct the non-silent signal for each digit.
    m = (1100*(l-1))+1:(1000*l)+(100*(l-1));
    realTone = toneSignal(m);
    
    % Take the 2048-point FFT and normalize it for easy comparison.
    toneFreq0 = fft(realTone, N);
    toneFreq = toneFreq0/max(toneFreq0);
    
    % Calculate the energy for each frequency of the FFT.
    energy0 = abs(toneFreq(1:N)).^2;
    % Only look at the first half of the frequencies since they represent
    % the positive frequencies and the second half represents the negative
    % frequencies.
    energy = energy0(1:length(energy0)/2);
    
    % Determine one frequency with the highest energy.
    [maxEnergy1, index1] = max(energy);
    % Set the energy of that frequency to 0 to find the other frequency.
    energy(index1) = 0;
    % Determine the other frequency with the highest energy.
    [maxEnergy2, index2] = max(energy);
    
    % Determine which is the high frequency and which is the low frequency.
    % The frequency that has a lower index represents the lower frequency.
    % Both frequencies are converted to radians for comparison.
    if index1 <= index2
        omegaLow = 2*pi*index1/N;
        omegaHigh = 2*pi*index2/N;
    elseif index1 > index2
        omegaLow = 2*pi*index2/N;
        omegaHigh = 2*pi*index1/N;
    end

N = 8192;

    % Given omegaHigh and omegaLow, the appropriate digit is determined.
    % The variable p in the conversion represents the deviation from the
    % exact frequency the signal is allowed to be. Industry standard is
    % 1.8% but may be changed for this application.
    if omegaLow >= (697*2*pi/N-(697*2*pi/N*p)) && omegaLow <= (697*2*pi/N+(697*2*pi/N*p))
        if omegaHigh >= (1209*2*pi/N-(1209*2*pi/N*p)) && omegaHigh <= (1209*2*pi/N+(1209*2*pi/N*p))
            key(l) = 1;
        elseif omegaHigh >= (1336*2*pi/N-(1336*2*pi/N*p)) && omegaHigh <= (1336*2*pi/N+(1336*2*pi/N*p))
            key(l) = 2;
        elseif omegaHigh >= (1477*2*pi/N-(1477*2*pi/N*p)) && omegaHigh <= (1477*2*pi/N+(1477*2*pi/N*p))
            key(l) = 3;
        end        
    elseif omegaLow >= (770*2*pi/N-(770*2*pi/N*p)) && omegaLow <= (770*2*pi/N+(770*2*pi/N*p))
        if omegaHigh >= (1209*2*pi/N-(1209*2*pi/N*p)) && omegaHigh <= (1209*2*pi/N+(1209*2*pi/N*p))
            key(l) = 4;
        elseif omegaHigh >= (1336*2*pi/N-(1336*2*pi/N*p)) && omegaHigh <= (1336*2*pi/N+(1336*2*pi/N*p))
            key(l) = 5;
        elseif omegaHigh >= (1477*2*pi/N-(1477*2*pi/N*p)) && omegaHigh <= (1477*2*pi/N+(1477*2*pi/N*p))
            key(l) = 6;
        end      
    elseif omegaLow >= (852*2*pi/N-(852*2*pi/N*p)) && omegaLow <= (852*2*pi/N+(852*2*pi/N*p))
        if omegaHigh >= (1209*2*pi/N-(1209*2*pi/N*p)) && omegaHigh <= (1209*2*pi/N+(1209*2*pi/N*p))
            key(l) = 7;
        elseif omegaHigh >= (1336*2*pi/N-(1336*2*pi/N*p)) && omegaHigh <= (1336*2*pi/N+(1336*2*pi/N*p))
            key(l) = 8;
        elseif omegaHigh >= (1477*2*pi/N-(1477*2*pi/N*p)) && omegaHigh <= (1477*2*pi/N+(1477*2*pi/N*p))
            key(l) = 9;
        end        
    elseif omegaLow >= (941*2*pi/N-(941*2*pi/N*p)) && omegaLow <= (941*2*pi/N+(941*2*pi/N*p))
        key(l) = 0;
    end
    
end

end

