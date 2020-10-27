clear all;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                               %
% Autor: Piotr Bednarek                         %
% Indeks: 249472                                %
%                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%STABILNY SYSTEM

a=0; b=1; c=1; d=1; e=1; 
M=[c d e];
K_s1=tf([a,b] , [c,d,e])
z1=roots(M)
[Step1,t1]=step(K_s1,20);
[Impulse1,t2]=impulse(K_s1,20);

a=0; b=1; c=1; d=2; e=2; 
M=[c d e];
K_s2=tf([a,b] , [c,d,e])
z2=roots(M)
[Step2,tt1]=step(K_s2,20);
[Impulse2,tt2]=impulse(K_s2,20);


a=0; b=1; c=0; d=2; e=1; 
M=[c d e];
K_s3=tf([a,b] , [c,d,e])
z3=roots(M)
[Step3,ttt1]=step(K_s3,20);
[Impulse3,ttt2]=impulse(K_s3,20);


a=0; b=1; c=3; d=6; e=1; 
M=[c d e];
K_s4=tf([a,b] , [c,d,e])
z4=roots(M)
[Step4,tttt1]=step(K_s4,20);
[Impulse4,tttt2]=impulse(K_s4,20);

figure(1);
subplot(3,1,1);
grid on;
hold on;
plot(t1,Step1,'b');
plot(tt1,Step2,'r');
plot(ttt1,Step3,'g');
plot(tttt1,Step4,'m');
title("Odpowiedz skokowa - badanie zależności od zmiany biegunów");
xlabel("t [s]");
ylabel("\lambda (t)");
legend("c=1 d=1 e=1","c=1 d=2 e=2","c=0 d=2 e=1","c=3 d=6 e=1");



subplot(3,1,2);
grid on;
hold on;
plot(t2,Impulse1,'b');
plot(tt2,Impulse2,'r');
plot(ttt2,Impulse3,'g');
plot(tttt2,Impulse4,'m');
title("Odpowiedz impulsowa - badanie zależności od zmiany biegunów");
xlabel("t [s]");
ylabel("k(t)");
legend("c=1 d=1 e=1","c=1 d=2 e=2","c=0 d=2 e=1","c=3 d=6 e=1");

subplot(3,1,3);
grid on;
hold on;
plot([-2 2] , [0 0], 'k');
plot([0 0],[-2 2],'k');
plot(real(z1),imag(z1),'bo','LineWidth',1.5);
plot(real(z2),imag(z2),'ro','LineWidth',1.5);
plot(real(z3),imag(z3),'go','LineWidth',1.5);
plot(real(z4),imag(z4),'mo','LineWidth',1.5);

title("Miejsca zerowe wielomianu M(s)");
xlabel("RE(Z)"); 
ylabel("IM(Z)");
legend("OX","OY","c=1 d=1 e=1   s1=-0.5+0.8660i , s2=-0.5-0.8660i","c=1 d=2 e=2   s1=-1+i , s2=-1-i","c=0 d=2 e=1   s1=-0.5","c=3 d=6 e=1   s1=-1.8165 , s2=-0.1835");


%SYSTEM NA GRANICY STABILNOSCI

a=0; b=1; c=3; d=0; e=3; 
M=[c d e];
K_s1=tf([a,b] , [c,d,e])
z1=roots(M)
[Step1,t1]=step(K_s1,20);
[Impulse1,t2]=impulse(K_s1,20);

a=0; b=1; c=3; d=3; e=0; 
M=[c d e];
K_s2=tf([a,b] , [c,d,e])
z2=roots(M)
[Step2,tt1]=step(K_s2,20);
[Impulse2,tt2]=impulse(K_s2,20);


a=0; b=1; c=5; d=0; e=5; 
M=[c d e];
K_s3=tf([a,b] , [c,d,e])
z3=roots(M)
[Step3,ttt1]=step(K_s3,20);
[Impulse3,ttt2]=impulse(K_s3,20);


a=0; b=1; c=5; d=5; e=0; 
M=[c d e];
K_s4=tf([a,b] , [c,d,e])
z4=roots(M)
[Step4,tttt1]=step(K_s4,20);
[Impulse4,tttt2]=impulse(K_s4,20);

figure(2);
subplot(3,1,1);
grid on;
hold on;
plot(t1,Step1,'b');
plot(tt1,Step2,'r');
plot(ttt1,Step3,'g');
plot(tttt1,Step4,'m');
title("Odpowiedz skokowa - badanie zależności od zmiany biegunów");
xlabel("t [s]");
ylabel("\lambda (t)");
legend("c=3 d=0 e=3","c=3 d=3 e=0","c=5 d=0 e=5","c=5 d=5 e=0");



subplot(3,1,2);
grid on;
hold on;
plot(t2,Impulse1,'b');
plot(tt2,Impulse2,'r');
plot(ttt2,Impulse3,'g');
plot(tttt2,Impulse4,'m');
title("Odpowiedz impulsowa - badanie zależności od zmiany biegunów");
legend("c=3 d=0 e=3","c=3 d=3 e=0","c=5 d=0 e=5","c=5 d=5 e=0");

subplot(3,1,3);
grid on;
hold on;
plot([-5 5] , [0 0], 'k');
plot([0 0],[-5 5],'k');
plot(real(z1),imag(z1),'bo','LineWidth',1.5);
plot(real(z2),imag(z2),'ro','LineWidth',1.5);
plot(real(z3),imag(z3),'go','LineWidth',1.5);
plot(real(z4),imag(z4),'mo','LineWidth',1.5);

title("Miejsca zerowe wielomianu M(s)");
xlabel("RE(Z)"); 
ylabel("IM(Z)");
legend("OX","OY","c=3 d=0 e=3   s1=i, s2=-i","c=3 d=3 e=0   s1=0, s2=-1","c=5 d=0 e=5 s1=i, s2=-i","c=5 d=5 e=0   s1=0, s2=-1");


%SYSTEM NIESTABILNY

a=0; b=1; c=1; d=-1; e=2; 
M=[c d e];
K_s1=tf([a,b] , [c,d,e])
z1=roots(M)
[Step1,t1]=step(K_s1,20);
[Impulse1,t2]=impulse(K_s1,20);

a=0; b=1; c=1; d=0; e=-1; 
M=[c d e];
K_s2=tf([a,b] , [c,d,e])
z2=roots(M)
[Step2,tt1]=step(K_s2,20);
[Impulse2,tt2]=impulse(K_s2,20);


figure(3);


subplot(3,2,3);
grid on;
hold on;
plot(t1,Step1,'b');
title("Odpowiedz skokowa - badanie zależności od zmiany biegunów");
xlabel("t [s]");
ylabel("\lambda (t)");
legend("c=1 d=-1 e=2");



subplot(3,2,1);
grid on;
hold on;
plot(t2,Impulse1,'b');
title("Odpowiedz impulsowa - badanie zależności od zmiany biegunów");
legend("c=1 d=-1 e=2");

subplot(3,2,2);
grid on;
hold on;
plot(tt2,Impulse2,'r');
title("Odpowiedz impulsowa - badanie zależności od zmiany biegunów");
legend("c=1 d=0 e=-1");


subplot(3,2,4);
grid on;
hold on;
plot(tt1,Step2,'r');
title("Odpowiedz skokowa - badanie zależności od zmiany biegunów");
xlabel("t [s]");
ylabel("\lambda (t)");
legend("c=1 d=0 e=-1");



subplot(3,1,3);
grid on;
hold on;
plot([-5 5] , [0 0], 'k');
plot([0 0],[-5 5],'k');
plot(real(z1),imag(z1),'bo','LineWidth',1.5);
plot(real(z2),imag(z2),'ro','LineWidth',1.5);

title("Miejsca zerowe wielomianu M(s)");
xlabel("RE(Z)"); 
ylabel("IM(Z)");
legend("OX","OY","c=1 d=0 e=-1","c=1 d=-1 e=2");



%W ZALEZNOSCI OD ZER!!!!

a=1; b=0; c=1; d=2; e=1; 
L=[a b];
M=[c d e];
K_s1=tf([a,b] , [c,d,e])
z1=roots(L)
[Step1,t1]=step(K_s1,20);
[Impulse1,t2]=impulse(K_s1,20);

a=1; b=2; c=1; d=2; e=1; 
L=[a b];
M=[c d e];
K_s2=tf([a,b] , [c,d,e])
z2=roots(L)
[Step2,tt1]=step(K_s2,20);
[Impulse2,tt2]=impulse(K_s2,20);


a=1; b=-2; c=1; d=2; e=1; 
L=[a b];
M=[c d e];
K_s3=tf([a,b] , [c,d,e])
z3=roots(L)
[Step3,ttt1]=step(K_s3,20);
[Impulse3,ttt2]=impulse(K_s3,20);


a=1; b=4; c=1; d=2; e=1; 
L=[a b];
M=[c d e];
K_s4=tf([a,b] , [c,d,e])
z4=roots(L)
[Step4,tttt1]=step(K_s4,20);
[Impulse4,tttt2]=impulse(K_s4,20);

figure(4);
subplot(3,1,1);
grid on;
hold on;
plot(t1,Step1,'b');
plot(tt1,Step2,'r');
plot(ttt1,Step3,'g');
plot(tttt1,Step4,'m');
title("Odpowiedz skokowa - badanie zależności od zmiany biegunów");
xlabel("t [s]");
ylabel("\lambda (t)");
legend("a=1, b=0","a=1, b=2","a=1, b=-2","a=1, b=4");



subplot(3,1,2);
grid on;
hold on;
plot(t2,Impulse1,'b');
plot(tt2,Impulse2,'r');
plot(ttt2,Impulse3,'g');
plot(tttt2,Impulse4,'m');
title("Odpowiedz impulsowa - badanie zależności od zmiany biegunów");
xlabel("t [s]");
ylabel("k(t)");
legend("a=1, b=0","a=1, b=2","a=1, b=-2","a=1, b=4");

subplot(3,1,3);
grid on;
hold on;
plot([-5 5] , [0 0], 'k');
plot([0 0],[-5 5],'k');
plot(real(z1),imag(z1),'bo','LineWidth',1.5);
plot(real(z2),imag(z2),'ro','LineWidth',1.5);
plot(real(z3),imag(z3),'go','LineWidth',1.5);
plot(real(z4),imag(z4),'mo','LineWidth',1.5);

title("Miejsca zerowe wielomianu L(s)");
xlabel("RE(Z)"); 
ylabel("IM(Z)");
legend("OX","OY","a=1, b=0","a=1, b=2","a=1, b=-2","a=1, b=4");


%SZUMY!
u=rand(1000,1);
a=0;b=8;c=0;d=2;e=1;
K_s1=tf([a,b],[c,d,e]);
t=0:0.1:99.99;
figure(5);
subplot(2,1,1);
lsim(K_s1,u,t);
subplot(2,1,2);
step(K_s1);

u=rand(10000,1);
a=0;b=0.2;c=1;d=0.08;e=0.04;
K_s1=tf([a,b],[c,d,e]);
t=0:0.1:999.9;
figure(6);
subplot(2,1,1);
lsim(K_s1,u,t);
subplot(2,1,2);
step(K_s1);

