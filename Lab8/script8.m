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

a1 = Aw1*sqrt(2*g*h1max)/h1max;
a2 = Aw2*sqrt(2*g*h2max)/h2max;

fwe1max = Aw1 * sqrt(2*g*(h1max - h2max))

fwe10 = [0, 0.5 * fwe1max, 0.9 * fwe1max]
fwe20 = 0;
dfwe1 = 0.1 * fwe1max;
%dfwe1 = 0; %Sprawdzenie czy uklad jest dobry
dt = 20;

%% MACIERZOWO
for i=1:3
    fwe1=fwe10(i);
    %fwe2 = 0.05 * fwe1max;
    fwe2 = 0.2594;
    
    h20 = (fwe1 + fwe2)/a2;
    h10 = (fwe1 / a1) + h20;
    
    A=[-a1/A1 a1/A1;a1/A2 -1*(a1+a2)/A2];
    B=[1/A1 0;0 1/A2];
    C=[1 0;0 1];
    D=[0 0;0 0];
    H0=[h10; h20];
    
    M=[A1*A2 a1*A1+a2*A1+a1*A2 a1*a1+a1*a2];
    Lh2f2=[A1 a1];
    Lh2f1=[a1];
    Lh1f1=[A2 a1+a2];
    Lh1f2=[a1];
    
    
    sim('simMa');
    
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
leg1 = strcat('fwe1=',num2str(fwe10(1)));
leg2 = strcat('fwe1=',num2str(fwe10(2)));
leg3 = strcat('fwe1=',num2str(fwe10(3)));
legend(leg1, leg2, leg3, 'Location', 'northwest');
set(gca, 'FontSize',17);

figure(2)
xlabel('Czas [s]');
ylabel('Wysokość słupa cieczy h2 ');
title('h2');
leg1 = strcat('fwe1=',num2str(fwe10(1)));
leg2 = strcat('fwe1=',num2str(fwe10(2)));
leg3 = strcat('fwe1=',num2str(fwe10(3)));
legend(leg1, leg2, leg3, 'Location', 'northwest');
set(gca, 'FontSize',17);


%% TRANSMITACJA
for i=1:3
    fwe1=fwe10(i);
    %fwe2 = 0.05 * fwe1max;
    fwe2 = 0.2594;
    
    h20 = (fwe1 + fwe2)/a2;
    h10 = (fwe1 / a1) + h20;
    
    A=[-a1/A1 a1/A1;a1/A2 -1*(a1+a2)/A2];
    B=[1/A1 0;0 1/A2];
    C=[1 0;0 1];
    D=[0 0;0 0];
    H0=[h10; h20];
    
    M=[A1*A2 a1*A1+a2*A1+a1*A2 a1*a1+a1*a2];
    Lh2f2=[A1 a1];
    Lh2f1=[a1];
    Lh1f1=[A2 a1+a2];
    Lh1f2=[a1];
    
    
    sim('simTr');
    
    figure(3)
    hold on;
    grid on;
    plot(simt,h1,'LineWidth',3);
    
   
    figure(4)
    hold on;
    grid on;
    plot(simt,h2,'LineWidth',3);
end

figure(3)
xlabel('Czas [s]');
ylabel('Wysokość słupa cieczy h1 ');
title('h1');
leg1 = strcat('fwe1=',num2str(fwe10(1)));
leg2 = strcat('fwe1=',num2str(fwe10(2)));
leg3 = strcat('fwe1=',num2str(fwe10(3)));
legend(leg1, leg2, leg3, 'Location', 'northwest');
set(gca, 'FontSize',17);

figure(4)
xlabel('Czas [s]');
ylabel('Wysokość słupa cieczy h2 ');
title('h2');
leg1 = strcat('fwe1=',num2str(fwe10(1)));
leg2 = strcat('fwe1=',num2str(fwe10(2)));
leg3 = strcat('fwe1=',num2str(fwe10(3)));
legend(leg1, leg2, leg3, 'Location', 'northwest');
set(gca, 'FontSize',17);

%% MATLABOWO
%SS=ss(A,B,C,D);
%S2 = tf(SS);

%figure(5);
%step(SS);

%figure(6);
%step(S2);
