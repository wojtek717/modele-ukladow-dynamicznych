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
title('Wykres rozwiązania swobodnego, wymuszonego i ogólnego dla x(t)');
xlabel('t [s]');
ylabel('x(t)'); 

plot(t,x)
plot(t,xs,':')
plot(t,xw)
legend('Rozwiązanie ogólne','Rozwiązanie swobodne','Rozwiązanie wymuszone','Location','southeast')

figure;
hold on;
grid on;
title('Wykres rozwiązania ogólnego - Simulink')
xlabel('t [s]');
ylabel('x(t)');

plot(simt,simx);
legend('Rozwiązanie ogólne', 'Location','southeast');

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
title('Wykres rozwiązania swobodnego, wymuszonego i ogólnego dla x(t)');
xlabel('t [s]');
ylabel('x(t)'); 

plot(t,x)
plot(t,xs)
plot(t,xw)
legend('Rozwiązanie ogólne','Rozwiązanie swobodne','Rozwiązanie wymuszone','Location','southeast')

figure;
hold on;
grid on;
title('Wykres rozwiązania ogólnego - Simulink')
xlabel('t [s]');
ylabel('x(t)');

plot(simt,simx);
legend('Rozwiązanie ogólne', 'Location','southeast');

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
title('Wykres rozwiązania swobodnego, wymuszonego i ogólnego dla x(t)');
xlabel('t [s]');
ylabel('x(t)'); 

plot(t,x)
plot(t,xs)
plot(t,xw)
legend('Rozwiązanie ogólne','Rozwiązanie swobodne','Rozwiązanie wymuszone','Location','southeast')

figure;
hold on;
grid on;
title('Wykres rozwiązania ogólnego - Simulink')
xlabel('t [s]');
ylabel('x(t)');

plot(simt,simx);
legend('Rozwiązanie ogólne', 'Location','southeast');

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
title('Wykres rozwiązania swobodnego, wymuszonego i ogólnego dla x(t)');
xlabel('t [s]');
ylabel('x(t)'); 

plot(t,x)
plot(t,xs)
plot(t,xw)
legend('Rozwiązanie ogólne','Rozwiązanie swobodne','Rozwiązanie wymuszone','Location','southeast')

figure;
hold on;
grid on;
title('Wykres rozwiązania ogólnego x(t) - Simulink')
xlabel('t [s]');
ylabel('x(t)');

plot(simt,simx);
legend('Rozwiązanie ogólne', 'Location','southeast');







