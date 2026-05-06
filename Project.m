clear; clc; 
load("Tanktest.mat")

K = K1; 
wc = 0.3; 

Kinf = 2; 
PM = 50; 


G = tf(K, [T^2 2*T 1]);

[mag, phase] = bode(G, wc);
mag = squeeze(mag);
phase = squeeze(phase);
u1 = Kinf*mag; 
phir = 50-180-phase; 


% Kontroll
kontroll = u1*cos(deg2rad(phir));

% Funkar ej, 
wc = 0.16;  
% PM = 40 på båda
% funkar för (wc=0.3, Kinf = 8 vilket ger kontroll = 1.0037) 
% och (wc = 0.14. Kinf = 3 vilket ger kontroll = 1.4878)

Kinf = 3; 
PM = 45; 
% wc = 0.16, Kinf = 3, PM = 45 ger Kontroll = 1.2175

G = tf(K, [T^2 2*T 1]);


[mag, phase] = bode(G, wc);
mag = squeeze(mag);
phase = squeeze(phase);
u1 = Kinf*mag; 
phir = PM-180-phase; 
phirrad = deg2rad(phir); 

% Kontroll
kontroll = u1*cos(deg2rad(phir));




% Regulatorparametrar
Td = (sqrt(u1*(u1-cos(phirrad)))+u1*sin(phirrad))/(2*wc*(u1*cos(phirrad)-1));
Ti = 4*Td;
Tf = (Td*cos(phirrad))/(u1+wc*Td*sin(phirrad));
Kc = Kinf*Tf/Td; 


G = tf(K, [T^2 2*T 1]);




s = tf('s');
% Regulator
GD = Kc*Td*s;
GPI = Kc*(1+1/(Ti*s));
GF = 1/(Tf*s+1);
GPID = GPI+GD;
D = GPID*GF;

figure;
L = D*G;
margin(L)

Tsys = feedback(L,1);

figure; 
step(Tsys)
grid on
stepinfo(Tsys)
