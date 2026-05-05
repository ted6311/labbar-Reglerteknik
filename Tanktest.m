load alldata.mat
load alldataANDtime.mat
load tankdata.mat
load tankdatany6V.mat



%% Lab 1



%V = [2; 3; 4; 5; 6; 7];
%H = [0.5; 1.5; 3.8; 6.5; 9.1; 12.2];
%M = [0.33; 0.9; 2.14; 3.64; 5.11; 6.9];

%P = polyfit(M,H,1);

%Tvarsnitssarea = pi*3.2^2; % cm2
%volume = Tvarsnitssarea*12; %cm3
%volymflode = volume/11.05;
%R = 8;

%Kreg = [1; 5; 10; 15; 20];
%Hreg = [6.96; 7.72; 7.85; 7.86; 7.92];
%Sreg = [0.022; 0.092; 0.16; 0.26; 0.40];

%E = 8 - Hreg;

%subplot(2,1,1)
%plot(m1(:,1),m1(:,2)); grid on;
%subplot(2,1,2)
%plot(Kreg,E);

V = [2; 3; 4; 5; 6; 7];
H = [0.5; 1.5; 3.8; 6.5; 9.1; 12.2];
M = [0.33; 0.9; 2.14; 3.64; 5.11; 6.9];

figure(1)
plot(V,H)
xlabel('Spänning [V]');
ylabel('Tanknivå [cm]');
title('Tanknivå mot spänning');
grid on

P = polyfit(M,H,1);

figure(2)
plot(M,H,'o')
hold on
plot(M,polyval(P,M),'-')
xlabel('Mätsignal [V]')
ylabel('Tanknivå [cm]')
title('Tanknivå som funktion av mätsignal')
legend('Mätdata','Linjär anpassning','Location','best')
grid on

Tvarsnitssarea = pi*3.2^2; % cm2
volume = Tvarsnitssarea*12; %cm3
volymflode = volume/11.05;

R = 8;

Kreg = [1; 5; 10; 15; 20];
Hreg = [6.96; 7.72; 7.85; 7.86; 7.92];
Sreg = [0.022; 0.092; 0.16; 0.26; 0.40];

E = R - Hreg;

figure(3)
plot(Kreg, Sreg, 'o-');
xlabel('Regulatorförstärkning K');
ylabel('Styrsignalaktivitet  S_{reg}');
title('Styrsignalaktivitet som funktion av regulatorförstärkning');
grid on;

figure(4)
plot(Kreg,E,'o-')
xlabel('Regulatorförstärkning K')
ylabel('Reglerfel E')
title('Reglerfel som funktion av regulatorförstärkning')
grid on

figure(5)
subplot(2,1,1)
plot(m1(:,1),m1(:,2)); 
grid on;
subplot(2,1,2)
plot(Kreg,E);




% Plot Arvarde h1 vs tid 
sig = h1.getElement(1);   % hämta första signalen
y = sig.Values.Data;      % själva värdena
t = sig.Values.Time;      % tidsvektor
h1 = sig.Values.Data;
figure; 
plot(t, y)





%% Lab 2

u0 = 5.6;

% upg. 7
q0 = volymflode;
g = 982;
h_10 = 8;  
h_20 = 8;
a = q0/sqrt(2*g*h_10);

 
% Upg 8

q = a*sqrt(2*g*H);

A = Tvarsnitssarea;

q_val = q(5);
V_val = V(5);

% upg 9 

qDq =(q_val-q0)/(V_val-u0);

T = 2*Tvarsnitssarea/a*sqrt(h_10/(2*g));
K1 = 2*qDq/a*sqrt(h_10/(2*g));

alfa =a/(2*A)*sqrt(2*g/(h_10));

K12 = 1;

u = v - u0;

save('Tanktest.mat')