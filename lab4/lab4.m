clear;


a0 = 1;
a1 = 1;
b = 8;
k5 = 4;

u0 = 8;
du = 0;
t0 = 0;

A1 = 0;
l = -1;
xwt = b * u0;

t = [0:0.1:10];
tmp = ones(101);

%1
x0 = b * u0 / a0;

xs = A1 * exp(l * t);
xw = xwt * tmp(1,:);
x = xs + xw;

sim('simu');

figure;
hold on;
grid on;
%title('Wykres rozwiązania swobodnego, wymuszonego i ogólnego dla x(t)');
xlabel('t [s]');
ylabel('x(t)'); 
set(gca, 'FontSize',17);

plot(t,x,'LineWidth',3)
plot(t,xs,'LineWidth',3)
plot(t,xw,':', 'LineWidth',3)
legend('Rozwiązanie ogólne','Rozwiązanie swobodne','Rozwiązanie wymuszone','Location','southeast')
saveas(gcf,'Fig1.png');

figure;
hold on;
grid on;
%title('Wykres rozwiązania ogólnego - Simulink')
xlabel('t [s]');
ylabel('x(t)');
set(gca, 'FontSize',17);

plot(simt,simx,'LineWidth',3);
legend('Rozwiązanie ogólne', 'Location','southeast');
saveas(gcf,'Fig1Simu.png');

%%%%%%%%%% 2
x0 = (b * u0 - a1 * k5 - a1 * a0)/a0;
A1 = -5;

xs = A1 * exp(l * t);
xw = xwt * tmp(1,:);
x = xs + xw;

sim('simu');

figure;
hold on;
grid on;
%title('Wykres rozwiązania swobodnego, wymuszonego i ogólnego dla x(t)');
xlabel('t [s]');
ylabel('x(t)'); 
set(gca, 'FontSize',17);

plot(t,x,'LineWidth',3)
plot(t,xs,'LineWidth',3)
plot(t,xw,'LineWidth',3)
legend('Rozwiązanie ogólne','Rozwiązanie swobodne','Rozwiązanie wymuszone','Location','southeast')
saveas(gcf,'Fig2.png');

figure;
hold on;
grid on;
%title('Wykres rozwiązania ogólnego - Simulink')
xlabel('t [s]');
ylabel('x(t)');
set(gca, 'FontSize',17);

plot(simt,simx,'LineWidth',3);
legend('Rozwiązanie ogólne', 'Location','southeast');
saveas(gcf,'Fig2Simu.png');

%%%%%%%%%% 3

x0 = 0;
A1 = -64;

xs = A1 * exp(l * t);
xw = xwt * tmp(1,:);
x = xs + xw;

sim('simu');

figure;
hold on;
grid on;
%title('Wykres rozwiązania swobodnego, wymuszonego i ogólnego dla x(t)');
xlabel('t [s]');
ylabel('x(t)'); 
set(gca, 'FontSize',17);

plot(t,x,'LineWidth',3)
plot(t,xs,'LineWidth',3)
plot(t,xw,'LineWidth',3)
legend('Rozwiązanie ogólne','Rozwiązanie swobodne','Rozwiązanie wymuszone','Location','southeast')
saveas(gcf,'Fig3.png');

figure;
hold on;
grid on;
%title('Wykres rozwiązania ogólnego - Simulink')
xlabel('t [s]');
ylabel('x(t)');
set(gca, 'FontSize',17);

plot(simt,simx,'LineWidth',3);
legend('Rozwiązanie ogólne', 'Location','southeast');
saveas(gcf,'Fig3Simu.png');

%%%%%%%%%% 4

x0 = 2;
A1 = -62;

xs = A1 * exp(l * t);
xw = xwt * tmp(1,:);
x = xs + xw;

sim('simu');

figure;
hold on;
grid on;
%title('Wykres rozwiązania swobodnego, wymuszonego i ogólnego dla x(t)');
xlabel('t [s]');
ylabel('x(t)'); 
set(gca, 'FontSize',17);

plot(t,x,'LineWidth',3)
plot(t,xs,'LineWidth',3)
plot(t,xw,'LineWidth',3)
legend('Rozwiązanie ogólne','Rozwiązanie swobodne','Rozwiązanie wymuszone','Location','southeast')
saveas(gcf,'Fig4.png');

figure;
hold on;
grid on;
%title('Wykres rozwiązania ogólnego x(t) - Simulink')
xlabel('t [s]');
ylabel('x(t)');
set(gca, 'FontSize',17);

plot(simt,simx,'LineWidth',3);
legend('Rozwiązanie ogólne', 'Location','southeast');
saveas(gcf,'Fig4Simu.png');







