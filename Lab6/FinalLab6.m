%%
%Kod: WoKo1488
%Data: 14.11.2018
%Grupa: śr 15:15

%%
clear; close; clc;

k1 = 8;
k3 = 4;
k4 = 1;

A1 = k1;
A2 = k1;

Aw1 = k1 * 0.1;
Aw2 = k1 * 0.1;

h1max = k3;
h2max = k4;

g = 9.81;

a1 = Aw1*sqrt(2*g*h1max)/h1max;
a2 = Aw2*sqrt(2*g*h2max)/h2max;

fwe1max = Aw1 * sqrt(2*g*(h1max - h2max));

fwe10 = [0, 0.5 * fwe1max, 0.9 * fwe1max];
fwe20 = 0;
dfwe1 = 0.1 * fwe1max;
%dfwe1 = 0; %Sprawdzenie czy uklad jest dobry
dt = 20;

for i=1:3
    fwe1=fwe10(i);
    %fwe2 = 0.4 * fwe1max;
    fwe2 = 0;
    
    h20 = (fwe1 + fwe2)/a2;
    h10 = (fwe1 / a1) + h20;
    
    sim('FinalSimuLab6');
    
    figure(1)
    hold on;
    grid on;
    plot(simt,h1,'LineWidth',3);
   
    figure(2)
    hold on;
    grid on;
    plot(simt,h2,'LineWidth',3);
end

figure(1)
xlabel('Czas [s]');
ylabel('Wysokość słupa cieczy h1 ');
title('h1');

figure(2)
xlabel('Czas [s]');
ylabel('Wysokość słupa cieczy h2 ');
title('h2');

%%