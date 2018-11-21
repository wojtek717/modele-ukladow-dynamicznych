clear; close; clc;

k1 = 1;
k2 = 1;
k3 = 8;
k4 = 8;
k5 = 4;
k6 = 1;

t0 = 0;
u0 = 0;
du = 1;

omega = k5;
b= omega^2;
Ksi = [2,-2,0,8/10,-8/10];
kolor = 'kcbgr';

figure;
hold on;
grid on;

for i=1:length(Ksi)
    ksi = Ksi(i);
    
    l1 = omega * ((-1 * ksi) + sqrt(ksi^2 - 1));
    l2 = omega * ((-1 * ksi) - sqrt(ksi^2 - 1));
    
    sim('simu5.slx');
    
    subplot(5,2,(2*i - 1));
    plot(real(l1), imag(l1), 'r*', real(l2), imag(l2), 'b*');
    xlabel('Re');
    ylabel('Im');
    
    subplot(5,2,(2*i));
    plot(simt, simx, 'LineWidth', 2);
    title(['ksi = ' num2str(ksi)]);
    xlabel('Czas [s]');
end


figure;
hold on;
grid on;

Ksi = 0 : 0.25 : 1;
for i=1:length(Ksi)
    ksi = Ksi(i);
    
    l1 = omega * ((-1 * ksi) + sqrt(ksi^2 - 1));
    l2 = omega * ((-1 * ksi) - sqrt(ksi^2 - 1));
    
    txt = ['ksi = ',num2str(ksi), ' omega = ' num2str(omega)];
    
    sim('simu5.slx');
    
    subplot(2,1,1);
    hold on;
    plot(simt,simx, kolor(i),'LineWidth', 3, 'DisplayName',txt);
        grid minor;
    xlabel('Czas [s]');
    legend show;
    set(gca, 'FontSize',17);
    
    subplot(2,1,2);
    hold on;
    plot(real(l1), imag(l1), [kolor(i) '*'], real(l2), imag(l2), [kolor(i) '*'],'LineWidth', 2);
        grid minor;
    xlabel('Re');
    ylabel('Im');
    set(gca, 'FontSize',17);
end


figure;
hold on;
grid on;

Omega = 2 : 0.25 : 3;
for i=1:length(Omega)
    omega = Omega(i);
    ksi = 0.25;
    
    l1 = omega * ((-1 * ksi) + sqrt(ksi^2 - 1));
    l2 = omega * ((-1 * ksi) - sqrt(ksi^2 - 1));
    
    txt = ['ksi = ',num2str(ksi), ' omega = ' num2str(omega)];
    
    sim('simu5.slx');
    
    subplot(2,1,1);
    hold on;
    plot(simt,simx, kolor(i), 'LineWidth', 3, 'DisplayName',txt);
        grid minor;
    xlabel('Czas [s]');
    legend show;
    set(gca, 'FontSize',17);
    
    subplot(2,1,2);
    hold on;
    plot(real(l1), imag(l1), [kolor(i) '*'], real(l2), imag(l2), [kolor(i) '*'], 'LineWidth', 2);
        grid minor;
    xlabel('Re');
    ylabel('Im');
    set(gca, 'FontSize',17);
end


figure;
hold on;
grid on;
for i=1:5
    ksi = 1/(i+1);
    omega = 1/ksi;
    
    txt = ['ksi = ',num2str(ksi), ' omega = ' num2str(omega)];
    
    l1 = omega * ((-1 * ksi) + sqrt(ksi^2 - 1));
    l2 = omega * ((-1 * ksi) - sqrt(ksi^2 - 1));
    
    sim('simu5.slx');
    
    subplot(2,1,1);
    hold on;
    plot(simt,simx, kolor(i), 'DisplayName',txt, 'LineWidth', 3);
    grid minor;
    xlabel('Czas [s]');
    legend show;
    set(gca, 'FontSize',17);
    
    subplot(2,1,2);
    hold on;
    plot(real(l1), imag(l1), [kolor(i) '*'], real(l2), imag(l2), [kolor(i) '*'],'LineWidth', 2);
    grid minor;
    xlabel('Re');
    ylabel('Im');
    set(gca, 'FontSize',17);
end
