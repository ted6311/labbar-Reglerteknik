
clear; clc; 


% 1) 
%Transfer function
GP = tf(0.6, [10, 1]);


% 3) 
T1 = 2.5;
K = 20; 
GR = tf([K*T1, K], [T1, 0]);


% 5) 
GK = GP*GR;  
G_TOT = feedback(GK, 1); 