%% ===== Czesc I =====
% Wartosci indeksu:
I1 = 2;
I2 = 4;

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
fp = fkN/(cpp * rop * (TkzN - TwewN));
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

%% --------------------------
% Stan równowagi:
%Temperatura rownowagi wnetrza
Twew0 = (Cp * Tkz0 + k1 * Tzew0 + k2 * kp * Tg0 / (k2 + kp)) / (Cp + k1 + kp - kp * kp / (k2 + kp));
%Temperatura rownowagi piwnicy
Tp0   = (kp * Twew0 + k2 * Tg0) / (k2 + kp);

%% ==== SYMULACJA ====
% Ustawienia zaklocen:
dt = 200;           %Czas wystapienia zaklocen

dTzew = -10;        %Zaklocenie temperatury zewnetrznej
dTg = -5;           %Zaklocenie temperatury gruntu
dTkz = 0;           %Zaklocenie temperatury dostarczanego powietrza
dfp = 0;            %Zaklocenie przeplywu powietrza

%% --------------------------
% Start symulacji:
sim('SimScript.slx');

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
plot(TimeOut,Tp);
grid minor;
hold on;
xlabel('Czas [s]');
ylabel('Temperatura [{\circ} C]');
title('Temperatura piwnicy');