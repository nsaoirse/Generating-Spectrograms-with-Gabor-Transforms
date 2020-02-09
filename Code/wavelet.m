
sig=nbins/(8*increment);

if w==1;
g=exp(-sig^2*(t-gtslice(i)).^2); % gaussian
wavename='Gaussian Window';
end
if w==2;
% % % mexican hat wavelet
wavename='Mexican Hat Window';
g=(1-(t-gtslice(i)).^2).*exp((sig^2)*-(t-gtslice(i)).^1.982); 
end
if w==3;
% % Square gabor window
wavename='Shannon Window';
g=exp(-((t-gtslice(i)).*sig).^40).*sig; % shannon
g=g./max(g);
end
% plot(t,g)
if w==4;
% % haar wavelet
wavename='Haar Window';
g=exp(-((t-gtslice(i)).*sig).^40).*sig; % gaussian
g=-g./max(g);
g((i*increment) - increment+1:end)=-g((i*increment) - increment+1:end);
end
% plot(t,g)



