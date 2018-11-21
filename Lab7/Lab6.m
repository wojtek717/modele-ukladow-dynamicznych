%% Nag³ówek
% Kod: MaAd1567
% Data: 14.11.2018
% Grupa: œr 15.15

%%
close; clear; clc;

%%
k = [2, 4, 1, 5, 6, 7];
g = 9.81;
delay = 10;

A1 = k(1);
A2 = k(1);

Aw1 = 0.1 * k(1);
Aw2 = 0.1 * k(1);

H1max = max(k(3) ,k(4));
H2max = min(k(3), k(4));

FW1max = Aw1 * sqrt( 2 * g * ( H1max - H2max ) );
FW2max = Aw2 * sqrt( 2 * g * H2max ) - 0; % 0 -> FWe20

FWe10 = [0, 0.5*FW1max, 0.9*FW1max];
FWe20 = [0, 0, 0, 0, 0];

a1 = Aw1 * sqrt( 2 * g * H1max ) / H1max;
a2 = Aw2 * sqrt( 2 * g * H2max ) / H2max;
LEG = [num2str(FWe10(1)), num2str(FWe10(2)), num2str(FWe10(3))];

for i = 1:3
    Fw1 = FWe10(i);
    Fw2 = FWe20(i);
    
    H20 = ((Fw1 + Fw2)^2) / (2*(Aw2^2)*g);
    H10 = Fw1^2/(2*Aw1^2*g) + H20;
    
    sim('Lab6S.slx');

    subplot(2,1,1);
    hold on;
    grid minor;
    plot(T, h1);
    title('Wysokoœæ zbiornika nr 1');
    xlabel('czas [s]');
    ylabel('wysokoœæ');
    legend(['Fwe1: ', num2str(FWe10(1))], num2str(FWe10(2)), num2str(FWe10(3)));
    
    subplot(2,1,2);
    hold on;
    grid minor;
    plot(T, h2);
    title('Wysokoœæ zbiornika nr 2');
    xlabel('czas [s]');
    ylabel('wysokoœæ');
    legend(num2str(FWe10(1)), num2str(FWe10(2)), num2str(FWe10(3)));
end
