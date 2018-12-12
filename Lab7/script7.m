%To jest ten dobry skrypt!!!

clear; close; clc;

k1 = 8;
k3 = 4;
k4 = 3;

A1 = k1;
A2 = k1;

Aw1 = k1 * 0.1;
Aw2 = k1 * 0.1;

h1max = k3;
h2max = k4;

g = 9.81;

fwe1max = Aw1 * sqrt(2 * g * (h1max - h2max))
fwe2max = Aw2 * sqrt(2 * g * h2max) - Aw1 * sqrt(2 * g * (h1max - h2max));

fwe10 = [0, 0.5 * fwe1max, 0.9 * fwe1max]
fwe20 = [0, 0.5 * fwe2max, 0.9 * fwe2max];

dfwe1 = 0.1 * fwe1max;
dfwe2 = 0;
dt = 20;

for i=1:3
    fwe1=fwe10(i);
    fwe2 = 0.1 * fwe2max;
    
    h20 = 1/(2 * g * Aw2 * Aw2) * (fwe1 + fwe2) * (fwe1 + fwe2);
    h10 = (fwe1 * fwe1)/(2 * g * Aw1 * Aw1) + h20;

    sim('simu7new')

    figure(1)
    hold on;
    grid on;
    plot(simt,h1,'LineWidth',3);
   
    figure(2)
    hold on;
    grid on;
    plot(simt,h2,'LineWidth',3);
end

dfwe2 = 0.1 * fwe2max;
dfwe1 = 0;

for i=1:3
    fwe2=fwe20(i);
    fwe1 = 0.3 * fwe1max;
    
    h20 = 1/(2 * g * Aw2 * Aw2) * (fwe1 + fwe2) * (fwe1 + fwe2);
    h10 = (fwe1 * fwe1)/(2 * g * Aw1 * Aw1) + h20;

    sim('simu7new')

    figure(3)
    hold on;
    grid on;
    plot(simt,h1,'LineWidth',3);
   
    figure(4)
    hold on;
    grid on;
    plot(simt,h2,'LineWidth',3);
end

figure(1)
xlabel('Czas [s]');
ylabel('Wysokość słupa cieczy h1 ');
title('Zbiornik pierwszy - Zmienne Fwe1');
leg1 = strcat('fwe1=',num2str(fwe10(1)));
leg2 = strcat('fwe1=',num2str(fwe10(2)));
leg3 = strcat('fwe1=',num2str(fwe10(3)));
legend(leg1, leg2, leg3, 'Location', 'northwest');
set(gca, 'FontSize',17);


figure(2)
xlabel('Czas [s]');
ylabel('Wysokość słupa cieczy h2 ');
title('Zbiornik drugi - Zmienne Fwe1');
leg1 = strcat('fwe1=',num2str(fwe10(1)));
leg2 = strcat('fwe1=',num2str(fwe10(2)));
leg3 = strcat('fwe1=',num2str(fwe10(3)));
legend(leg1, leg2, leg3, 'Location', 'northwest');
set(gca, 'FontSize',17);

figure(3)
xlabel('Czas [s]');
ylabel('Wysokość słupa cieczy h1 ');
title('Zbiornik pierwszy - Zmienne Fwe2');
leg1 = strcat('fwe1=',num2str(fwe20(1)));
leg2 = strcat('fwe1=',num2str(fwe20(2)));
leg3 = strcat('fwe1=',num2str(fwe20(3)));
legend(leg1, leg2, leg3, 'Location', 'northwest');
set(gca, 'FontSize',17);

figure(4)
xlabel('Czas [s]');
ylabel('Wysokość słupa cieczy h2 ');
title('Zbiornik drugi - Zmienne Fwe2');
leg1 = strcat('fwe1=',num2str(fwe20(1)));
leg2 = strcat('fwe1=',num2str(fwe20(2)));
leg3 = strcat('fwe1=',num2str(fwe20(3)));
legend(leg1, leg2, leg3, 'Location', 'northwest');
set(gca, 'FontSize',17);

%%%
%fwe1 = fwe10;
%fwe2 = fwe20;

%h20 = 1/(2 * g * Aw2 * Aw2) * (fwe1 + fwe2) * (fwe1 + fwe2);
%h10 = (fwe1 * fwe1)/(2 * g * Aw1 * Aw1) + h20;

%sim('simu7new')

    %figure(1)
    %hold on;
   % grid on;
   % plot(simt,h1,'LineWidth',3);
   
    %figure(2)
    %hold on;
    %grid on;
    %plot(simt,h2,'LineWidth',3);