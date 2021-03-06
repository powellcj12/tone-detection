% DFT_Impact.m
% N-point DFT Computation
s1 = [1 1 1 1 1 1];
S1 = fft(s1);
S2 = fft(s1, 12);
S3 = fft(s1, 120);
figure;
subplot(3, 1, 1);
stem(1:length(S1), S1);
title('S1');
xlabel('k (where \omega = 2\pik/N)');
subplot(3, 1, 2);
stem(1:length(S2), S2);
title('S2');
xlabel('k (where \omega = 2\pik/N)');
subplot(3, 1, 3);
stem(1:length(S3), S3);
title('S3');
xlabel('k (where \omega = 2\pik/N)');
% Periodic, Circular, and Linear convolution comparison
s4 = ifft(fft(s1,12).*fft(s1,12));
s5 = [s1 zeros(1, 3)];
S5 = fft(s5);
s6 = ifft(S5.*S5);
s7 = [s1 zeros(1, 6)];
S7 = fft(s7);
s8 = ifft(S7.*S7);
s9 = [s1 zeros(1, 12)];
S9 = fft(s9);
s10 = ifft(S9.*S9);
figure;
subplot(4, 1, 1);
stem(1:length(s4), s4);
title('s4');
xlabel('n');
subplot(4, 1, 2);
stem(1:length(s6), s6);
title('s6');
xlabel('n');
subplot(4, 1, 3);
stem(1:length(s8), s8);
title('s8');
xlabel('n');
subplot(4, 1, 4);
stem(1:length(s10), s10);
title('s10');
xlabel('n');