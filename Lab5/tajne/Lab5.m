%% Kod: MaAd1567

%%
close; clear; clc;

%%
Wn = 4;
Xi = [8 -7 0 0.5 -0.1];
figure(1);
for i = 1 : length(Xi)
% Odpowiedü
    Delta = sqrt(Xi(i)*Xi(i) - 1);
    L1 = Wn*(-Xi(i) + Delta);
    L2 = Wn*(-Xi(i) - Delta);
    xi = Xi(i);
    
    sim('Lab5simu.slx');
    
    subplot(5,2,(i-1)*2 + 1);
    plot(Time,X);
    grid minor;
    title(['Xi = ' num2str(xi)]);
    xlabel('Czas [s]');

% Bieguny
    subplot(5,2,2*i);
    grid minor;
    hold on;
    
    plot(real(L1),imag(L1),'*');
    plot(real(L2),imag(L2),'*');
   
    xlabel('Real');
    ylabel('Imag');
end

%%
Xi = 0 : 0.25 : 1;
figure(2);
kolor = 'kwbgr';
for i = 1 : length(Xi)
% Odpowiedü
    Delta = sqrt(Xi(i)*Xi(i) - 1);
    L1 = Wn*(-Xi(i) + Delta);
    L2 = Wn*(-Xi(i) - Delta);
    xi = Xi(i);
    
    sim('Lab5simu.slx');
    
    subplot(2,1,1);
    hold on;
    plot(Time(1:3000),X(1:3000), kolor(i));
    grid minor;
        
    xlabel('Czas [s]');
 % Bieguny
    subplot(2,1,2);
    grid minor;
    hold on;
    
    plot(real(L1),imag(L1),[kolor(i) '*']);
    plot(real(L2),imag(L2),[kolor(i) '*']);
   
    xlabel('Real');
    ylabel('Imag');
end