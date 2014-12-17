% m = wavread(    );
% cas = length(m)/44100
% plot(m);
% sound(m,44100)
clear all;
close all;
clc;    
[x,fs] = audioread('C:\Users\Josef\OneDrive\Documents\MATLAB\Horn_sound.wav');
%%Plot the hole signal
plot(x)
xlabel('Sample Number')
ylabel('Amplitude')
%% Plot the part of signal
title('\bf Part of emergency sound')
horn = x(1:0.73e5);
tb = (0:1/fs:(length(horn)-1)/fs);%time base
figure()
plot(tb,horn)
xlim([0 tb(end)]);
xlabel('Time (seconds)')
ylabel('Amplitude')
%% Double side FFT Bins
title('\bf Double-side Amplitude  Almost Bins')
N = length(horn);
f_Bins = [0 : N-1]; % Window length
Y=(abs(fft(horn)));
figure()
plot(f_Bins,Y);
axis tight;
% n = pow2(nextpow2(m)); % Transform length
% Y = fft(horn,n)/m;
% f = fs/2*linspace(0,1,n/2+1);

%% Plot single-sided amplitude spectrum.
% plot(f,2*abs(Y(1:n/2+1)));
N_2 = N/2;
f = f_Bins * fs/N;
figure()
plot(f(1:N_2+1),(Y(1:N_2+1)))
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Hz');
ylabel('|Y(f)|');
axis([0 70 0 400])
%%Single side amplitude spectrum with normalized frequency
% f_norm = (f_Bins*fs/N)/(fs/2);
% plot(f_norm(1:N_2+1),Y(1:N_2+1))
% title('Single-Sided Normalized Amplitude Spectrum of y(t)')
% xlabel('Normalized frequency Hz')
% ylabel('|Y(f)|')
% axis tight

%% Magnitude spectrum in dB
% plot(f,2*abs(Y(1:n/2+1)));
N_2 = N/2;
f = f_Bins * fs/N;
figure()
plot(f(1:N_2+1),20*log10(Y(1:N_2+1)))
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Hz');
ylabel('dB');
axis([0 8000 0 70])



%set(gca,'XTick',[1 500 1000 3000] ); %This are going to be the only values affected.
% f = (0:m-1)*(fs/n);  % Frequency range
% y = fft(horn,m);
% p = y.*conj(y)/n;
% figure()
% plot(f(1:floor(n/2)),p(1:floor(n/2)))
% 
% xlabel('Frequency (Hz)')
% ylabel('Power')


