N=100000;
x=1:N;
% w = pulsation
% frequence f = w*pi
Fe=44100;
f=440;
y=sin(f*x/Fe*2*pi);
audiowrite('440sample.wav',y,Fe);
% plot(y)
sound(y,Fe)
y2=fftshift(fft(y));
plot(abs(y2))
[~,P]=max(abs(y2));
[~,P2]=max(abs(y2(N/2:end)))
P=N/2-P
R=(P/N*Fe+P2/N*Fe)/2
