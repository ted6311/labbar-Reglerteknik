V = [2; 3; 4; 5; 6; 7];
H = [0.5; 1.5; 3.8; 6.5; 9.1; 12.2];
M = [0.33; 0.9; 2.14; 3.64; 5.11; 6.9];

P = polyfit(M,H,1);

Tvarsnitssarea = pi*3.2^2; % cm2
volume = Tvarsnitssarea*12; %cm3
volymflode = volume/11.05;
R = 8;

Kreg = [1; 5; 10; 15; 20];
Hreg = [6.96; 7.72; 7.85; 7.86; 7.92];
Sreg = [0.022; 0.092; 0.16; 0.26; 0.40];

E = 8 - Hreg;

subplot(2,1,1)
plot(m1(:,1),m1(:,2)); grid on;
subplot(2,1,2)
plot(Kreg,E);
