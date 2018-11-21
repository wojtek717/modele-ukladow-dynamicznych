clear; close; clc;



A1 = 1;
A2 = 1;

Aw1 = A1 * 0.1;
Aw2 = A2 * 0.2;

h1max = 6;
h2max = 3;

g = 9.81;

fwe1max = Aw1 * sqrt(2 * g * (h1max - h2max));
%fwe2max = Aw2 * sqrt(2 * g * h2max) - Aw1 * sqrt(2 * g * (h1max - h2max));
fwe2max = Aw2 * sqrt(2 * g * h2max) - 0;

fwe10 = 0.5 * fwe1max;
%fwe20 = 0.5 * fwe2max;
fwe20 = 0;

dfwe1 = 0;
dfwe2 = 0;
dt = 20;


%%%
fwe1 = fwe10;
fwe2 = fwe20;

h20 = 1/(2 * g * Aw2 * Aw2) * (fwe1 - fwe2) * (fwe1 - fwe2);
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