function tone = generate_DTMF(key)
% num = is a character representing the num, 'c'
% tone = the output tone generated

num = sscanf(key, '%u');
N = 8192;

if num == 0
    omegaLow = 941;
    omegaHigh = 1336;
elseif num == 1
    omegaLow = 697;
    omegaHigh = 1209;
elseif num == 2
    omegaLow = 697;
    omegaHigh = 1336;
elseif num == 3
    omegaLow = 697;
    omegaHigh = 1477;
elseif num == 4
    omegaLow = 770;
    omegaHigh = 1209;
elseif num == 5
    omegaLow = 770;
    omegaHigh = 1336;
elseif num == 6
    omegaLow = 770;
    omegaHigh = 1477;
elseif num == 7
    omegaLow = 852;
    omegaHigh = 1209;
elseif num == 8
    omegaLow = 852;
    omegaHigh = 1336;
elseif num == 9
    omegaLow = 852;
    omegaHigh = 1477;
end

n=0:999;
tone = sin(omegaLow*2*pi/N*n) + sin(omegaHigh*2*pi/N*n);

end

