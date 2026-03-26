% Indata till designalgoritm: Önskad
% * Överkorsningsfrekvens (wc [rad/s])
% * Fasmarginal (Phim [rad])
% * Högfrekvensförstärkning (K8)
% samt processens 
% * Förstärkning i wc (absGPwc)
% * Fasvridning i wc (phiGPwc [rad])

PhiR=-phiGPwc-pi+Phim;
my=K8*absGPwc;
Storre_an_1=my*cos(PhiR)
Td=(sqrt(my*(my-cos(PhiR)))+my*sin(PhiR))/(2*wc*(my*cos(PhiR)-1))
Tf=Td*cos(PhiR)/(my+wc*Td*sin(PhiR))
Ti=4*Td
k=K8*Tf/Td