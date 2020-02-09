clc
clear all
close all

% load handel
% scalestart=3;
% scalesend=8;
% instrument='handel';
% tr_piano=16; % record time in seconds
% y=audioread('music1.wav'); Fs=length(y)/tr_piano;
scalestart=4;
scalesend=9;
% instrument='piano'
% 
tr_rec=14; % record time in seconds
y=audioread('music2.wav'); Fs=length(y)/tr_rec;
% scalestart=8;
% scalesend=10;
instrument='recorder'

v = y'/2;

nsamples=length(v);
nbins=nsamples;
t=(1:length(v))/Fs; % this is our T
dt=t(2)-t(1);
termtime=nsamples*dt;

% number of increments
gt2=linspace(0,max(t),nsamples+1); gt=gt2(1:nsamples); 
df = Fs/nbins;
k = (0:df:(Fs-df)) - (Fs-mod(nsamples,2)*df)/2; %<- stack exchange
% gt=gt(1:end-1);1

ks=fftshift(k);

for w=1:4;
sizes=[nsamples/64];%, nsamples/128, nsamples/256, nsamples/512];
% sizes=[nsamples/32, nsamples/64, nsamples/128];% nsamples/256, nsamples/(2*256)];

for size=1:length(sizes)
    sffttot=[];
   
increment=sizes(size)

for SR=1:3;
    if SR==1;
gtslice=gt(1:increment:end); % sampled
samplerate='reg';
    end
    if SR==2;
gtslice=gt(1:increment*2:end); % undersampled
samplerate='und'
    end
    if SR==3;
gtslice=gt(1:increment/2:end); % oversampled
samplerate='ovs'
    end 
    
sffttot=[];

for i=1:length(gtslice);
 
wavelet

sfft=fft(g.*v);

sfftfilt=(sfft).*1;

sffttot=[sffttot;abs(fftshift(sfft)/max(abs(sfft)))];
% [maxval,ind]=max(abs(fftshift(sfftfilt)));
[maxval,ind]=max(sfftfilt((end-1)/2 : end));

currentnote(i)=ks(ind);

end
f=figure("Visible",false);

pcolor(gtslice,k,sffttot'); hold on

spvec

axis([-2 max(t) min(hzvec) max(hzvec)])
colormap jet

% colormap spring
% colormap([0 0 0])
shading interp
set(gca, 'YScale', 'log')
xlabel('Time (s)')
ylabel('Frequency (hz)')
title(wavename)
print(wavename+string(termtime*2*pi/increment)+instrument+samplerate+'.jpg','-djpeg')
close(f)
end

end
end
