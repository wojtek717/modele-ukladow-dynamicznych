%past2062
clear all;

% wartosci poczatkowe
A1=2; %pow. dna
A2=2;

Aw1=0.1*2; %
Aw2=0.1*2;

hm1=max(2,0); % wys. zbiornika
hm2=min(4,3);

g = 9.81; % przysp. ziemskie

a1=Aw1*sqrt(2*g*hm1)/hm1; %wsp. linearyzacji
a2=Aw2*sqrt(2*g*hm2)/hm2;

fwe1m=Aw1*sqrt(2*g*(hm2-hm1));
%fwe1m=a1*(hm2-hm1);
fwe10=[0 0.5*fwe1m 0.9*fwe1m];
dt=10;
%dfwe=0;
dfwe=0.1*fwe1m;
fwe2=0;


fwe1=0;
kolor='rgb';
for i=1:3                       
   fwe1=fwe10(i);
   
   h20=(fwe2+fwe1)/a2;
   h10=(fwe1+a1*h20)/a1;
   
   sim('lab06');
   
   figure(1)
   plot(t,h1, kolor(i)), hold on; grid on;
   title('h1(t)');
   
   figure(2)
   plot(t,h2, kolor(i)), hold on; grid on;
   title('h2(t)');
end