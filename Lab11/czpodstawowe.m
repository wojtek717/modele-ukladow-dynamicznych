% Wziaść transmitancje z projektu(kartka) i zrobimy ch. czestotliwosciowa
%
% model = tf(L12, M)
% bode(model) --> ch. czestotliwosciowa
% rusujemy asymptoty  -> odczytujemy p. charakterystyczne (czestotliwosci)

clear all;

%% ===== Obliczenie parametrow =====
%% --------------------------
% Wartosci indeksu:
I1 = 2;
I2 = 4;

%% --------------------------
% Wartości nominalne:
TzewN = -20;   %Temperatura zewnetrzna
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
Cp = cpp * rop * fp;

k1 = (Cp * TkzN - Cp * TwewN) / ((TwewN - TzewN) + 1/4 * (TpN - TgN));
k2 = 1/4 * k1;
kp = 1/4 * k1 * (TpN - TgN) / (TwewN - TpN);

%% --------------------------
% Parametry dynamiczne:
CVw = cpp * rop * Vw;   %Pojemnosc cieplna wnetrza
CVp = cpp * rop * Vp;   %Pojemnosc cieplna piwnicy

%% --------------------------
% Warunki początkowe:
Tzew0 = TzewN;      %Poczatkawa temperetura zewnetrzna
Tkz0 = TkzN;        %Poczatkowa temperatura dostarczanego powietrza
Tg0 = TgN;          %Poczatkowa temperatura gruntu
fp0 = fp;

Cp0 = cpp * rop * fp0;


%% ===== Wyznaczenie modelu =====
%% --------------------------
% Transmitancja:
M = [CVw * CVp, CVw*kp + CVw*k2 + Cp0*CVp + CVp*k1 + CVp*kp, (kp+k2)*(Cp0) + k1*kp + k1*k2 + kp*k2];
L12 = [CVp*k1, k1*(k2+kp)]; 

%% --------------------------
% Parametry:
a = CVw * CVp;
b = CVw*kp + CVw*k2 + cpp*rop*fp0*CVp + CVp*k1 + CVp*kp;
c = cpp*rop*fp0*(kp+k2) + k1*kp + k1*k2 + kp*k2;

%% --------------------------
% Wyrysowanie:
hold on;

model = tf(L12, M);
bodemag(model);
grid on;

%% --------------------------
% Obliczenie parametrów członów:

delta = b^2 - 4*a*c;
sdelta = sqrt(delta);

x1 = ((-1 * b) - sdelta)/(2*a);
x2 = ((-1 * b) + sdelta)/(2*a);

T1 = (CVp*k1)/(k1*k2 + k1*kp);
T2 = 1/x1;
T3 = 1/x2;

omega1 = 1/T1
omega2 = x1
omega3 = x2






