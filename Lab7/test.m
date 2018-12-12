%% Nag��wek
% Kod: MaAd1567
% Data: 14.11.2018
% Grupa: �r 15.15

%%
close; clear; clc;

%%
k = [2, 4, 1, 5, 6, 7];
g = 9.81;
dt = 20;

A1 = k(1);
A2 = k(1);

Aw1 = 0.1 * k(1);
Aw2 = 0.1 * k(1);

h1max = max(k(3) ,k(4));
h2max = min(k(3), k(4));

fwe1max = Aw1 * sqrt( 2 * g * ( h1max - h2max ) );
fwe2max = Aw2 * sqrt( 2 * g * h2max );

fwe10 = [0, 0.1*fwe1max, 0.2*fwe1max];
fwe20 = [0, 0.3*fwe2max, 0.7*fwe2max];

dfwe1 = 0.2 * fwe1max;
dfwe2 = 0.1 * fwe2max;

for i = 1:3
    fwe1 = fwe10(i);
    fwe2 = fwe20(i);
    
    h20 = ((fwe1 + fwe2)^2) / (2*(Aw2^2)*g);
    h10 = fwe1^2/(2*Aw1^2*g) + h20;

    
 %% Nieliniowe
    sim('simu7new');

    figure(1)
    hold on;
    grid on;
    plot(simt,h1,'LineWidth',3);
   
    figure(2)
    hold on;
    grid on;
    plot(simt,h2,'LineWidth',3);
end
