clear all;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                               %
% Autor: Piotr Bednarek                         %
% Indeks: 249472                                %
%                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%USTAWIENIA I rzedu
T1=3;  w=1;
K_s1=tf(1,[T1, 1])

L=1;
M=1+T1*w*j;
K_jw=L/M

A=abs(K_jw)
Y=angle(K_jw)

t=0:0.1:60;
signal=sin(w.*t);

skl_ustal=A*sin(w.*t+Y);

[k_t,t_2]=lsim(K_s1,signal,t);
%%%%%%%%RYSOWANIE%%%%%%%%
figure(1);
lsim(K_s1,signal,t);

figure(2);
hold on;
grid on;
plot(t,skl_ustal);
plot(t_2,k_t);

title("Odpowiedz systemu a składowa ustalona - inercyjny I rzędu");
xlabel("t [s]");
ylabel("Amplituda");
legend("y_{ustalone}(t)","k(t)");



%USTAWIENIA II rzedu
T1=1; T2=3; w=1;
K_s1=tf(1,[T1*T2, T1+T2, 1])

L=1;
M=(T1*w*j+1)*(T2*w*j+1);
K_jw=L/M

A=abs(K_jw)
Y=angle(K_jw)

t=0:0.1:60;
signal=sin(w.*t);

skl_ustal=A*sin(w.*t+Y);

[k_t,t_2]=lsim(K_s1,signal,t);
%%%%%%%%RYSOWANIE%%%%%%%%
figure(3);
lsim(K_s1,signal,t);

figure(4);
hold on;
grid on;
plot(t,skl_ustal);
plot(t_2,k_t);

title("Odpowiedz systemu a składowa ustalona - inercyjny II rzędu");
xlabel("t [s]");
ylabel("Amplituda");
legend("y_{ustalone}(t)","k(t)");

%%%%%%%%%%%%%%%%%PODPUNKT 2a%%%%%%%%%%%%%%%%%%%%%%%
w=0.0:0.01:30;
T1=3; T2=1; 
L=1;
M=(T1.*w*j+1).*(T2.*w*j+1);
K_jw=L./M;
R=real(K_jw);
I=imag(K_jw);

%%%%%%%%RYSOWANIE%%%%%%%%
figure(5);
plot3(R,I,w);
title("Charakterystyka amplitudowo-fazowa członu inercyjnego II rzędu");
xlabel("Re[K(jw)]");
ylabel("Im[K(jw)]");
zlabel("\omega");
legend("K(j\omega)");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%PODPUNKT 2b%%%%%%%%%%%%%%%%%%%%%%%
w=0.0:0.01:30;
T=3;
K_jw=exp(-1.*w.*T*j);
R=real(K_jw);
I=imag(K_jw);

%%%%%%%%RYSOWANIE%%%%%%%%
figure(6);
plot3(R,I,w);
title("Charakterystyka amplitudowo-fazowa członu opóźniającego");
xlabel("Re[K(jw)]");
ylabel("Im[K(jw)]");
zlabel("\omega");
legend("K(j\omega)");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%PODPUNKT 2c%%%%%%%%%%%%%%%%%%%%%%%
w=0.0:0.01:30;
T=3;
L=1;
M=1+(T*w.*j)
K_jw=L./M;
R=real(K_jw);
I=imag(K_jw);

%%%%%%%%RYSOWANIE%%%%%%%%
figure(7);
plot3(R,I,w);
title("Charakterystyka amplitudowo-fazowa członu inercyjnego I rzędu");
xlabel("Re[K(jw)]");
ylabel("Im[K(jw)]");
zlabel("\omega");
legend("K(j\omega)");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%PODPUNKT 3%%%%%%%%%%%%%%%%%%%%%%%
clear all;
T1=3; 
K_s1=tf(1,[T1,1]);
ltiview('nyquist',K_s1);


T1=3;  T2=1;
K_s2=tf(1,[T1*T2,T1+T2,1]);
ltiview('nyquist',K_s2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

