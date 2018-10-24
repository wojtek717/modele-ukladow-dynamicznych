%Wojciech Konury
%241488
%sr15.15

tmp = ones(101);
A11 = -2/3;
A12 = 2;
l1 = -3;
l2 = -1;
u = 1;

t = [0:0.1:10];

figure;
hold on;
grid on;
title('Wykres rozwiązania swobodnego, wymuszonego i ogólnego dla x(t)');
xlabel('t [s]');
ylabel('x(t)'); 

x1 = A11 * exp(-3*t) + A12 * exp(-1*t) + 2/3;
x1s = A11 * exp(l1 * t) + A12 * exp(l2 * t);
x1w = tmp(1,:) * 2/3; 

plot(t,x1);
plot(t,x1s);
plot(t,x1w);
legend('x1(t)','x1s(t)','x1w(t)', 'Location', 'southeast');


figure;
hold on;
grid on;
title('Wykres rozwiązania swobodnego, wymuszonego i ogólnego dla x(t)');
xlabel('t [s]');
ylabel('x(t)'); 

A21 = -1/4;
A22 = 5/4;

x2 = A21 * exp(l1 * t) + A22 * exp(l2 * t) + 2/3;
x2s = A21 * exp(l1 * t) + A22 * exp(l2 * t);
x2w = tmp(1,:) * 2/3;

plot(t,x2);
plot(t,x2s);
plot(t,x2w);
legend('x2(t)','x2s(t)','x2w(t)', 'Location', 'southeast');


%3 wykres
figure;
hold on;
grid on;
title('Wykres rozwiązania swobodnego, wymuszonego i ogólnego dla x(t)');
xlabel('t [s]');
ylabel('x(t)');

xp = 0;
xk = 2/3;

A31 = (xp - xk)/(l1/l2 + 1);
A32 = -1 * l1/l2 * A31;

x3 = A31 * exp(l1 * t) + A32 * exp(l2 * t) + xk;
x3s = A31 * exp(l1 * t) + A32 * exp(l2 * t);
x3w = tmp(1,:) * xk;

plot(t,x3);
plot(t,x3s);
plot(t,x3w);
legend('x3(t)','x3s(t)','x3w(t)', 'Location', 'southeast');


%4 wykres
figure;
hold on;
grid on;
title('Wykres rozwiązania swobodnego, wymuszonego i ogólnego dla x(t)');
xlabel('t [s]');
ylabel('x(t)');

xpp = 0 + 1;
xkk = 2/3 + 1;

k = xkk * (l1*l2)/(l1 - l2) * (exp(l1 * t) - exp(l2 * t));
ks = (l1*l2)/(l1 - l2) * (exp(l1 * t) - exp(l2 * t));
kw = tmp(1,:) * xkk;

plot(t,k);
plot(t,ks);
plot(t,k);


