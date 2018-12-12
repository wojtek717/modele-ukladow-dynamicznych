%% Nag��wek
% MaAd1567

close; clear; clc;
%% ===============================================
%%             PARAMETRY SYMULACJI
%% ===============================================
%% Warto�ci nominalne
Indeks = [2, 4, 1, 5, 6, 7];

TzewN = -20; % Temperatura zewnetrzna
TwewN = 20; % Temperatura wewnetrzna
TpN   = 10; % Temperatura piwnicy
TkzN  = 35; % Temperatura powietrza grzewczego
TgN   = -5; % Temperatura gruntu

Cp    = 1000; % Ciep�o w�aciwe powietrza
Rp    = 1.2; % Gesto�� powietrza w temp. 20 C

%% Objeto�ci pomieszcze�
Vw    = Indeks(1)*Indeks(2)*2.5; % Objetosc wewnetrzna
Vp    = 0.8 * Vw; % Objetosc piwnicy

%% Parametry statyczne
Pr  = 0.6; % Procent energii przekazywanej na ogrzanie piwnicy
FkN = Vw / (2 * 60 * 60); % Ilo�� wpompowywanego powietrza 

kp  = Pr * Cp * Rp * FkN * (TkzN - TwewN) / (TwewN - TpN);
k1  = (Cp * Rp * FkN * (TkzN - TwewN) - kp * (TwewN - TpN)) / (TwewN - TzewN);
k2  = kp * (TwewN - TpN) / (TpN - TgN);


%% Paramtery dynamiczne
Cvw = Cp * Rp * Vw; % Pojemno�� cieplna wewn�trzna
Cvp = Cp * Rp * Vp; % Pojemno�� cieplna piwnicy

%% Warunki poczatkowe
Tzew0 = TzewN; % Pocz�towa temperatura zewn�trzna,m.
Tkz0  = TkzN; % Pocz�tkowa temperatura wpompowywanego powietrza
Tg0   = TgN; % Pocz�tkowa temperatura gruntu
Fk0   = FkN; % Pocz�tkowa warto�� wpomopowywanego powietrza

%% Stan r�wnowagi
Twew0 = (Cp * Rp * Fk0 * Tkz0 + k1 * Tzew0 + k2 * kp * Tg0 / (k2 + kp)) / (Cp * Rp * Fk0 + k1 + kp - kp * kp / (k2 + kp)) % Temperatura wewn�trzna podczas r�wnowagi
Tp0   = (kp * Twew0 + k2 * Tg0) / (k2 + kp) % Temperatura piwnicy podczas r�wnowadgi

%% ===============================================
%%                   SYMULACJA
%% ===============================================
% Ustawienia zak��ce�
Czas      = 50000; % Czas symulacji
Czas_skok = 5000; % Czas wyst�pienaia zak��ce�

dTzew     = -10; % Zak��cenie temperatury zewnetrznej
dTg       = -4; % Zak��cenie temperatury gruntu
dTkz      = 0; % Zak��cenie temperatury grzewczej
dFk       = 0; % Zak��cenie ilo�ci wypomopowywanego powietrza

% Rozpocz�cie symulacji
sim('ProjektSim.slx');

% Wy�wietalnie wynik�w
figure(1);

subplot(2,1,1);
grid minor;
hold on;
plot(Czas,Twew);
xlabel('Czas [s]');
ylabel('Temperatura [{\circ} C]');
title('Temperatura pokoju');

subplot(2,1,2);
plot(Czas,Tp);
grid minor;
hold on;
xlabel('Czas [s]');
ylabel('Temperatura [{\circ} C]');
title('Temperatura piwnicy');
