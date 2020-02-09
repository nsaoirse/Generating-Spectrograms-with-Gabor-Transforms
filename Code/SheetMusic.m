clc
clear all
close all
% 
% tr_piano=16; % record time in seconds
% y=audioread('music1.wav'); Fs=length(y)/tr_piano;
% scalestart=3;
% scalesend=5;
% instrument='Piano'
% 
tr_rec=14; % record time in seconds
y=audioread('music2.wav'); Fs=length(y)/tr_rec;
scalestart=5;
scalesend=7;
instrument='Recorder'

v = y'/2;

nsamples=length(v);
nbins=nsamples/2;
t=(1:length(v))/Fs; % this is our T
dt=t(2)-t(1);
termtime=nsamples*dt;

% number of increments
gt2=linspace(0,max(t),nsamples+1); gt=gt2(1:nsamples); 
df = Fs/nbins;
k = (0:df:(Fs-df)) - (Fs-mod(nsamples,2)*df)/2; %<- stack exchange
% gt=gt(1:end-1);1

ks=fftshift(k);

w=2;
       
increment=[nsamples/64];

gtslice=gt(1:increment:end); % sampled
samplerate='reg';
% gtslice=gt(1:increment*2:end); % undersampled
% gtslice=gt(1:increment/2:end); % oversampled

for i=1:length(gtslice);
 
wavelet

sfft=fft(g.*v);

% [maxval,ind]=max(abs(fftshift(sfftfilt)));
[maxval,ind]=max(sfft((end-1)/2 : end));
currentnote(i)=ks(ind)/2;

end

figure(2) 
ScalesPlot
% plot(fftshift(filt),k)
plot(gtslice,abs(currentnote),'o')
Time
ScalesPlot
% plot(ifftshift(filter),k(1:end-1))
xlabel('Time, seconds')
ylabel('Hertz & Note')
set(gca, 'YScale', 'log')
% % %     
title([instrument,' Music Score'])
axis([-2 max(t) min(hzvec) max(hzvec)])

