clear; clc;

%% ===== Czesc I =====
% Wartosci indeksu:
I1 = 2;
I2 = 4;

%% --------------------------
% Wartosci wejsciowe:
% Tzew, Tg, Tkz, fp

% Wartosci wyjsciowe:
% Twew, Tp


%% --------------------------
% Wartości nominalne:
TzewN = -20;    %Temperatura zewnetrzna
TwewN = 20;     %Temperatura wewnetrzna
TpN = 10;       %Temperatura piwnicy
TkzN = 35;      %Temperatura dostarczanego powietrza
TgN = -10;      %Temperatura gruntu

Vw = I1 * I2 * 2.5; %Objetosc wnetrza
Vp = 0.8 * Vw;      %Objetosc piwnicy

cpp = 1000;         %Cieplo wlasciwe powietrza
rop = 1.2;          %Gestosc powietrza
fkN = 20 * 1000;    %Strumien ciepla [W]

%% --------------------------
% Identyfikacja parametrow:
fp = fkN/(cpp * rop * (TkzN + 273.15));
%fp = 0.005;
Cp = cpp * rop * fp;

k1 = (Cp * TkzN - Cp * TwewN) / ((TwewN - TzewN) + 1/4 * (TpN - TgN));
k2 = 1/4 * k1;
kp = 1/4 * k1 * (TpN - TgN) / (TwewN - TpN);


%% --------------------------
% Parametry dynamiczne:
CVw = cpp * rop * Vw;   %Pojemnosc cieplna wnetrza
CVp = cpp * rop * Vp;   %Pojemnosc cieplna piwnicy


%% ===== Czesc II =====
% Warunki początkowe:
Tzew0 = TzewN;      %Poczatkawa temperetura zewnetrzna
Tkz0 = TkzN;        %Poczatkowa temperatura dostarczanego powietrza
Tg0 = TgN;          %Poczatkowa temperatura gruntu
fp0 = fp;

Cp0 = cpp * rop * fp0;

%% --------------------------
% Stan równowagi:
%Temperatura rownowagi wnetrza
Twew0 = (Cp0 * Tkz0 + k1 * Tzew0 + k2 * kp * Tg0 / (k2 + kp)) / (Cp0 + k1 + kp - kp * kp / (k2 + kp));
%Temperatura rownowagi piwnicy
Tp0   = (kp * Twew0 + k2 * Tg0) / (k2 + kp);

%% ==== TRANSMITANCJA ====
% Wartosci parametrow:
M = [CVw * CVp, CVw*kp + CVw*k2 + Cp0*CVp + CVp*k1 + CVp*kp, (kp+k2)*(Cp0) + k1*kp + k1*k2 + kp*k2];

%Pokoj
L11 = [Cp0*CVp, Cp0*(kp+k2)];   %Tkz
L12 = [CVp*k1, k1*(k2+kp)];     %Tzew
L13 = [k2*kp];               %Tg

%Piwnica
L21 = [Cp0*kp];              %Tkz
L22 = [k1*kp];               %Tzew
%L23 = [CVw*k2, k2*(Cp0+k1+k2)]; %Tg
L23 = [CVw*k2 (k2*Cp0+k1*k2+k2*kp)];


%% ==== SYMULACJA ====
% Ustawienia zaklocen:
dt = 500;           %Czas wystapienia zaklocen

dTzew = 0;          %Zaklocenie temperatury zewnetrznej
dTg = 0;            %Zaklocenie temperatury gruntu
dTkz = 0;           %Zaklocenie temperatury dostarczanego powietrza
dfp = 0.1;            %Zaklocenie przeplywu powietrza

%% --------------------------
% Start symulacji:
sim('SimScript.slx');
sim('Trans.slx');

%% --------------------------
% Wyswietlenie:
figure(1);

subplot(2,1,1);
grid minor;
hold on;
plot(TimeOut,Twew);
xlabel('Czas [s]');
ylabel('Temperatura [{\circ} C]');
title('Temperatura pokoju');

subplot(2,1,2);
hold on;
plot(TimeOut,Tp);
grid minor;
hold on;
xlabel('Czas [s]');
ylabel('Temperatura [{\circ} C]');
title('Temperatura piwnicy');

subplot(2,1,1);
grid minor;
hold on;
plot(TrTime,TrTwew, '--');


subplot(2,1,2);
grid minor;
hold on;
plot(TrTime,TrTp, '--');


subplot(2,1,1);
legend('Nieliniowo', 'Transmitancja');

subplot(2,1,2);
legend('Nieliniowo', 'Transmitancja');