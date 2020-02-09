
%%

hold on
dt=floor((length(t)-1)/(termtime*2));
for i=1:dt:length(t);

plot([t(i),t(i)],[0.0001,max(hzvec)],'g'); 

end
