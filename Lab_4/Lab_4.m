clear all;
close all;

%%%%%OBIEKT
Kob=tf([1],[12,7,1,0]);
figure(5);
step(Kob);

%DOBRANE NASTAWY PID TUNE
N=35.1844; P=0.2897; I=0.0067727; D=2.0067;
KP_r=P; %PROPORCNOJALNY
KI_r=tf(I,[1, 0]);%CALKUJACY
KD_r=tf([D*N,0],[1,N]);%ROZNICZKUJACY
KR=KP_r+KI_r+KD_r; %TRANSMITANCJA REGUKLATORA

K_otw=Kob*KR;
K_z=K_otw/(1+K_otw);
K_E=1/(1+K_otw); % TRANSMITANCJA UCHYBOWA

figure(1);
step(K_z);

figure(2);
[e,czas]=step(K_E,10);
plot(czas,e);
step(K_E,100);

figure(3);
lsim(KR,e,czas);



%%%%%%%%%%%%%PRZEJSCIE Z CIAGLEGO NA DYSKRETNY!!!!%%%%

Ts1=0.01:0.005:0.3;

for i=1:1:length(Ts1)
    TS=Ts1(i);
    KR_d=c2d(KR,TS,'zoh');
    L=KR_d.Numerator{1, 1};
    M=KR_d.Denominator{1, 1};
    sim("Lab_4_sim.slx");
    tab(i)=ans.roznica(length(ans.roznica));
end

figure(4)
plot(Ts1,tab);
title("Różnica całek kwadratu uchybów");
xlabel("Czas próbkowania");ylabel("Różnica całki uchybu regulacji");

TS=0.1;
Kr_d=c2d(KR,TS,'zoh');
L=KR_d.Numerator{1, 1};
M=Kr_d.Denominator{1, 1};
sim("Lab_4_sim.slx");

