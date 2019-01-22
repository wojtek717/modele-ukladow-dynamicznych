s=tf('s');

K = 2;

T1 = 10;
T2 = [0, T1/10, T1/2, 0.95*T1];

for i=1:4
        figure(1);
        grid minor;
    
    k1 = K/((T1*s + 1)*(T2(i)*s + 1));
    step(k1);
    
    hold on;
    legend('T2=0', 'T2=T1/10', 'T2=T1/2', 'T2=0.95T1');
    
end


Ti = 12;
T2 = [0, Ti/100, Ti/10, 0.95*Ti, 10*Ti];

for i=1:5
    figure(2)
    grid minor;
    
    k2 = K/(Ti*s*(T2(i)*s + 1));
    step(k2);
    
    hold on;
    axis([0 100  0   10]);
    legend('T2=0', 'T2=Ti/100', 'T2=Ti/10', 'T2=0.95Ti', '10Ti');
end


Td = 4;
T2 = [0.00001, Td/100, Td/10, 0.95*Td, 10*Td];

for i=1:5
   figure(3)
   grid minor;
   
   k3 = (Td*s)/(T2(i)*s + 1);
   step(k3);
   
   hold on;
   axis([0 12  0   2]);
   legend('T2=0', 'T2=Td/100', 'T2=Td/10', 'T2=0.95Td', '10Td');
    
end

figure(4)
grid minor;
    
    T2 = 0.95 * T1;
   
    k1 = K/((T1*s + 1)*(T2*s + 1));
    hold on;
    step(k1);
    
    
    t0=1.71;
    t=31.6;
    t3 = t-t0;
    
    KUPF=K/(t3*s + 1)*exp(-s*t0);
    step(KUPF);
    
    legend('Model badany', 'Model Küpfmüllera');
    set(gca, 'FontSize',14);
