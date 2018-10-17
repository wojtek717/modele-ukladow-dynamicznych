%WoKo1488 

QgN=1000;
TzN=-20;
TwN=20;
TpN=10;
aN=0.4;
kolor = 'rgbcrgbcrgbcrgbcrgbcrgbc';

KcwN=QgN/(TwN - TzN + aN*(TwN-TpN))
KcpN=(aN*(TzN - TpN)*QgN)/((TpN-TzN)*(TwN*TzN + aN*(TwN-TpN)))


Tz=[-20:5:35];
Qg=[1000:100:2000];


q=1;
while q <= length(Qg)
    t=1;
    while t <= length(Tz)
        Tw(q,t)=(0.4*Qg(q)*KcwN + Qg(q)*KcpN + 0.4*KcwN*KcwN*Tz(t) + 1.4*KcwN*KcpN*Tz(t))/(0.4*KcwN*KcwN + 1.4*KcwN*KcpN)
        Tp(q,t)=(1.4*KcwN*KcpN*Tz(t) + 0.4*Qg(q)*KcwN + 0.4*KcwN*KcwN*Tz(t))/(0.4*KcwN*KcwN + 1.4*KcwN*KcpN)    
        t=t+1;
    end
    q=q+1;
end

r=1;
figure;
hold on;
grid on;
title('Wykres zaleznosci Twew od Tzew dla roznych Qg');
xlabel('Tzew');
ylabel('Twew'); 
while r <= length(Qg)
    plot(Tz,Tw(r,:))
    r=r+1;
end

r=1;
figure;
hold on;
grid on;
title('Wykres zaleznosci Tp od Tzew dla roznych Qg');
xlabel('Tzew');
ylabel('Tp');

while r <= length(Qg)
    plot(Tz,Tp(r,:), 'Color', kolor(r));
    
    s = ['Q = ' num2str(Qg(r))];
    text(Tz(length(Tz))+2,Tp(r,12), s, 'Color', kolor(r));
    
    r=r+1;
end