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

FWe10 = [0, 0, 0];
FWe20 = [0, 0.1*FW2max, 0.9*FW2max];

a1 = Aw1 * sqrt( 2 * g * H1max ) / H1max;
a2 = Aw2 * sqrt( 2 * g * H2max ) / H2max;

for i = 1:3
    Fw1 = FWe10(i);
    Fw2 = FWe20(i);
    
    H20NL = ((Fw1 + Fw2)^2) / (2*(Aw2^2)*g);
    H10NL = Fw1^2/(2*Aw1^2*g) + H20NL
    
    H20L = (Fw1 + Fw2) / a2;
    H10L = (Fw1 / a1) + H20L;
 
 %% Liniowe
    sim('Lab6SL.slx');

    subplot(2,2,1);
    hold on;
    grid minor;
    plot(T, h1);
    title('Wysokoœæ zbiornika nr 1');
    xlabel('czas [s]');
    ylabel('wysokoœæ');
  
    subplot(2,2,3);
    hold on;
    grid minor;
    plot(T, h2);
    title('Wysokoœæ zbiornika nr 2');
    xlabel('czas [s]');
    ylabel('wysokoœæ');
    
 %% Nieliniowe
    sim('Lab6SNL.slx');

    subplot(2,2,3);
    hold on;
    grid minor;
    plot(T, h1);
    title('Wysokoœæ zbiornika nr 1');
    xlabel('czas [s]');
    ylabel('wysokoœæ');
  
    subplot(2,2,4);
    hold on;
    grid minor;
    plot(T, h2);
    title('Wysokoœæ zbiornika nr 2');
    xlabel('czas [s]');
    ylabel('wysokoœæ');
end
