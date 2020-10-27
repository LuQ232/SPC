clear all;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                               %
% Autor: Piotr Bednarek                         %
% Indeks: 249472                                %
%                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%CZŁON PROPORCJONALNY

a=0; b=-1; c=0; d=0; e=1; 
M=[c d e];
K_s1=tf([a,b] , [c,d,e])
z1=roots(M);
[Step1,t1]=step(K_s1);
[Impulse1,t2]=impulse(K_s1);

a=0; b=1; c=0; d=0; e=1; 
M=[c d e];
K_s2=tf([a,b] , [c,d,e])
z2=roots(M);
[Step2,tt1]=step(K_s2);
[Impulse2,tt2]=impulse(K_s2);


a=0; b=3; c=0; d=0; e=1; 
M=[c d e];
K_s3=tf([a,b] , [c,d,e])
z3=roots(M);
[Step3,ttt1]=step(K_s3);
[Impulse3,ttt2]=impulse(K_s3);


a=0; b=4; c=0; d=0; e=1; 
M=[c d e];
K_s4=tf([a,b] , [c,d,e])
z4=roots(M);
[Step4,tttt1]=step(K_s4);
[Impulse4,tttt2]=impulse(K_s4);
%%%%%%%%RYSOWANIE%%%%%%%%
figure(1);
subplot(3,1,1);
grid on;
hold on;
plot(t1,Step1,'b');
plot(tt1,Step2,'r');
plot(ttt1,Step3,'g');
plot(tttt1,Step4,'m');
title("Odpowiedz skokowa członu proporcjonalnego");
xlabel("t [s]");
ylabel("\lambda (t)");
legend("b=-1","b=1","b=3","b=4");



subplot(3,1,2);
grid on;
hold on;
plot(t2,Impulse1,'b');
plot(tt2,Impulse2,'r');
plot(ttt2,Impulse3,'g');
plot(tttt2,Impulse4,'m');
title("Odpowiedz impulsowa członu proporcjonalnego");
xlabel("t [s]");
ylabel("k(t)");
legend("b=-1","b=1","b=3","b=4");

subplot(3,1,3);
grid on;
hold on;
plot([-1 1] , [0 0], 'k');
plot([0 0],[-1 1],'k');
plot(real(z1),imag(z1),'bo','LineWidth',1.5);
plot(real(z2),imag(z2),'ro','LineWidth',1.5);
plot(real(z3),imag(z3),'go','LineWidth',1.5);
plot(real(z4),imag(z4),'mo','LineWidth',1.5);

title("Miejsca zerowe wielomianu M(s)");
xlabel("RE(Z)"); 
ylabel("IM(Z)");
legend("OX","OY","b=-1","b=1","b=3","b=4");
%}

%CZŁON INERCYJNY I RZEDU -> K/TS+1 (zmienna d)

a=0; b=1; c=0; d=2; e=1; 
M=[c d e];
K_s1=tf([a,b] , [c,d,e])
z1=roots(M);
[Step1,t1]=step(K_s1,40);
[Impulse1,t2]=impulse(K_s1,40);



a=0; b=1; c=0; d=4; e=1; 
M=[c d e];
K_s2=tf([a,b] , [c,d,e])
z2=roots(M);
[Step2,tt1]=step(K_s2,40);
[Impulse2,tt2]=impulse(K_s2,40);


a=0; b=1; c=0; d=6; e=1; 
M=[c d e];
K_s3=tf([a,b] , [c,d,e])
z3=roots(M);
[Step3,ttt1]=step(K_s3,40);
[Impulse3,ttt2]=impulse(K_s3,40);


a=0; b=1; c=0; d=8; e=1; 
M=[c d e];
K_s4=tf([a,b] , [c,d,e])
z4=roots(M);
[Step4,tttt1]=step(K_s4,40);
[Impulse4,tttt2]=impulse(K_s4,40);

%%%%%%%%RYSOWANIE%%%%%%%%
figure(2);
subplot(3,1,1);
grid on;
hold on;
plot(t1,Step1,'b');
plot(tt1,Step2,'r');
plot(ttt1,Step3,'g');
plot(tttt1,Step4,'m');
title("Odpowiedz skokowa członu inercyjnego I rzędu");
xlabel("t [s]");
ylabel("\lambda (t)");
legend("d=2","d=4","d=6","d=8");



subplot(3,1,2);
grid on;
hold on;
plot(t2,Impulse1,'b');
plot(tt2,Impulse2,'r');
plot(ttt2,Impulse3,'g');
plot(tttt2,Impulse4,'m');
title("Odpowiedz impulsowa członu inercyjnego I rzędu");
xlabel("t [s]");
ylabel("k(t)");
legend("d=2","d=4","d=6","d=8");

subplot(3,1,3);
grid on;
hold on;
plot([-1 1] , [0 0], 'k');
plot([0 0],[-1 1],'k');
plot(real(z1),imag(z1),'bo','LineWidth',1.5);
plot(real(z2),imag(z2),'ro','LineWidth',1.5);
plot(real(z3),imag(z3),'go','LineWidth',1.5);
plot(real(z4),imag(z4),'mo','LineWidth',1.5);

title("Miejsca zerowe wielomianu M(s)");
xlabel("RE(Z)"); 
ylabel("IM(Z)");
legend("OX","OY","d=2","d=4","d=6","d=8");
%}

%CZŁON INERCYJNY II RZEDU DELTA >=0 ZAWSZE!! -> K/aS^2+bS+c (zmienna d)

T1=2;T2=3;
a=0; b=2; c=T1*T2; d=T1+T2; e=1; 
M=[c d e];
K_s1=tf([a,b] , [c,d,e])
z1=roots(M);
[Step1,t1]=step(K_s1,100);
[Impulse1,t2]=impulse(K_s1,100);

T1=4;T2=6;
a=0; b=2; c=T1*T2; d=T1+T2; e=1; 
M=[c d e];
K_s2=tf([a,b] , [c,d,e])
z2=roots(M);
[Step2,tt1]=step(K_s2,100);
[Impulse2,tt2]=impulse(K_s2,100);


T1=8;T2=12;
a=0; b=2; c=T1*T2; d=T1+T2; e=1; 
M=[c d e];
K_s3=tf([a,b] , [c,d,e])
z3=roots(M);
[Step3,ttt1]=step(K_s3,100);
[Impulse3,ttt2]=impulse(K_s3,100);

T1=10;T2=15;
a=0; b=2; c=T1*T2; d=T1+T2; e=1; 
M=[c d e];
K_s4=tf([a,b] , [c,d,e])
z4=roots(M);
[Step4,tttt1]=step(K_s4,100);
[Impulse4,tttt2]=impulse(K_s4,100);



%%%%%%%%RYSOWANIE%%%%%%%%
figure(3);
subplot(3,1,1);
grid on;
hold on;
plot(t1,Step1,'b');
plot(tt1,Step2,'r');
plot(ttt1,Step3,'g');
plot(tttt1,Step4,'m');
title("Odpowiedz skokowa członu inercyjnego II rzędu");
xlabel("t [s]");
ylabel("\lambda (t)");
legend("T1=2 T2=3","T1=4 T2=6","T1=8 T2=12","T1=10 T2=15");



subplot(3,1,2);
grid on;
hold on;
plot(t2,Impulse1,'b');
plot(tt2,Impulse2,'r');
plot(ttt2,Impulse3,'g');
plot(tttt2,Impulse4,'m');
title("Odpowiedz impulsowa członu inercyjnego II rzędu");
xlabel("t [s]");
ylabel("k(t)");
legend("T1=2 T2=3","T1=4 T2=6","T1=8 T2=12","T1=10 T2=15");

subplot(3,1,3);
grid on;
hold on;
plot([-1 1] , [0 0], 'k');
plot([0 0],[-1 1],'k');
plot(real(z1),imag(z1),'bo','LineWidth',1.5);
plot(real(z2),imag(z2),'ro','LineWidth',1.5);
plot(real(z3),imag(z3),'go','LineWidth',1.5);
plot(real(z4),imag(z4),'mo','LineWidth',1.5);

title("Miejsca zerowe wielomianu M(s)");
xlabel("RE(Z)"); 
ylabel("IM(Z)");
legend("OX","OY","T1=2 T2=3","T1=4 T2=6","T1=8 T2=12","T1=10 T2=15");
%}

%CZŁON OSCYLACYJNY (Ksi nalezy (0,1) STABILNY Z OSCYLACJAMI  -> w^2/S^2+2EwS+w^2    pamietaj w>0

E=0.2;W=0.2;
a=0; b=W^2; c=1; d=2*E*W; e=W^2; 
M=[c d e];
K_s1=tf([a,b] , [c,d,e])
z1=roots(M);
[Step1,t1]=step(K_s1,100);
[Impulse1,t2]=impulse(K_s1,100);

E=0.2;W=0.7;
a=0; b=W^2; c=1; d=2*E*W; e=W^2; 
M=[c d e];
K_s2=tf([a,b] , [c,d,e])
z2=roots(M);
[Step2,tt1]=step(K_s2,100);
[Impulse2,tt2]=impulse(K_s2,100);


E=0.7;W=0.7;
a=0; b=W^2; c=1; d=2*E*W; e=W^2; 
M=[c d e];
K_s3=tf([a,b] , [c,d,e])
z3=roots(M);
[Step3,ttt1]=step(K_s3,100);
[Impulse3,ttt2]=impulse(K_s3,100);

E=0.7;W=0.2;
a=0; b=W^2; c=1; d=2*E*W; e=W^2; 
M=[c d e];
K_s4=tf([a,b] , [c,d,e])
z4=roots(M);
[Step4,tttt1]=step(K_s4,100);
[Impulse4,tttt2]=impulse(K_s4,100);



%%%%%%%%RYSOWANIE%%%%%%%%
figure(4);
subplot(3,1,1);
grid on;
hold on;
plot(t1,Step1,'b');
plot(tt1,Step2,'r');
plot(ttt1,Step3,'g');
plot(tttt1,Step4,'m');
title("Odpowiedz skokowa członu oscylacyjnego, gdzie \xi \in (0,1) - STABILNY Z OSCYLACJAMI");
xlabel("t [s]");
ylabel("\lambda (t)");
legend("\omega=0.2 \xi=0.2 ","\omega=0.2 \xi=0.7 ","\omega=0.7 \xi=0.7 ","\omega=0.7 \xi=0.2 ");



subplot(3,1,2);
grid on;
hold on;
plot(t2,Impulse1,'b');
plot(tt2,Impulse2,'r');
plot(ttt2,Impulse3,'g');
plot(tttt2,Impulse4,'m');
title("Odpowiedz impulsowa członu oscylacyjnego, gdzie \xi \in (0,1) - STABILNY Z OSCYLACJAMI");
xlabel("t [s]");
ylabel("k(t)");
legend("\omega=0.2 \xi=0.2 ","\omega=0.2 \xi=0.7 ","\omega=0.7 \xi=0.7 ","\omega=0.7 \xi=0.2 ");

subplot(3,1,3);
grid on;
hold on;
plot([-1 1] , [0 0], 'k');
plot([0 0],[-1 1],'k');
plot(real(z1),imag(z1),'bo','LineWidth',1.5);
plot(real(z2),imag(z2),'ro','LineWidth',1.5);
plot(real(z3),imag(z3),'go','LineWidth',1.5);
plot(real(z4),imag(z4),'mo','LineWidth',1.5);

title("Miejsca zerowe wielomianu M(s)");
xlabel("RE(Z)"); 
ylabel("IM(Z)");
legend("OX","OY","\omega=0.2 \xi=0.2 ","\omega=0.2 \xi=0.7 ","\omega=0.7 \xi=0.7 ","\omega=0.7 \xi=0.2 ");
%}

%CZŁON OSCYLACYJNY (Ksi nalezy (-1,0) NIESTABILNY Z OSCYLACJAMI  -> w^2/S^2+2EwS+w^2    pamietaj w>0

E=-0.2;W=0.2;
a=0; b=W^2; c=1; d=2*E*W; e=W^2; 
M=[c d e];
K_s1=tf([a,b] , [c,d,e])
z1=roots(M);
[Step1,t1]=step(K_s1);
[Impulse1,t2]=impulse(K_s1);

E=-0.2;W=0.7;
a=0; b=W^2; c=1; d=2*E*W; e=W^2; 
M=[c d e];
K_s2=tf([a,b] , [c,d,e])
z2=roots(M);
[Step2,tt1]=step(K_s2);
[Impulse2,tt2]=impulse(K_s2);


E=-0.7;W=0.7;
a=0; b=W^2; c=1; d=2*E*W; e=W^2; 
M=[c d e];
K_s3=tf([a,b] , [c,d,e])
z3=roots(M);
[Step3,ttt1]=step(K_s3);
[Impulse3,ttt2]=impulse(K_s3);

E=-0.7;W=0.2;
a=0; b=W^2; c=1; d=2*E*W; e=W^2; 
M=[c d e];
K_s4=tf([a,b] , [c,d,e])
z4=roots(M);
[Step4,tttt1]=step(K_s4);
[Impulse4,tttt2]=impulse(K_s4);



%%%%%%%%RYSOWANIE%%%%%%%%
figure(5);
subplot(3,1,1);
grid on;
hold on;
plot(t1,Step1,'b');
plot(tt1,Step2,'r');
plot(ttt1,Step3,'g');
plot(tttt1,Step4,'m');
title("Odpowiedz skokowa członu oscylacyjnego, gdzie \xi \in (-1,0) - NIESTABILNY Z OSCYLACJAMI");
xlabel("t [s]");
ylabel("\lambda (t)");
legend("\omega=0.2 \xi=-0.2 ","\omega=0.2 \xi=-0.7 ","\omega=0.7 \xi=-0.7 ","\omega=0.7 \xi=-0.2 ");



subplot(3,1,2);
grid on;
hold on;
plot(t2,Impulse1,'b');
plot(tt2,Impulse2,'r');
plot(ttt2,Impulse3,'g');
plot(tttt2,Impulse4,'m');
title("Odpowiedz impulsowa członu oscylacyjnego, gdzie \xi \in (-1,0) - NIESTABILNY Z OSCYLACJAMI");
xlabel("t [s]");
ylabel("k(t)");
legend("\omega=0.2 \xi=-0.2 ","\omega=0.2 \xi=-0.7 ","\omega=0.7 \xi=-0.7 ","\omega=0.7 \xi=-0.2 ");

subplot(3,1,3);
grid on;
hold on;
plot([-1 1] , [0 0], 'k');
plot([0 0],[-1 1],'k');
plot(real(z1),imag(z1),'bo','LineWidth',1.5);
plot(real(z2),imag(z2),'ro','LineWidth',1.5);
plot(real(z3),imag(z3),'go','LineWidth',1.5);
plot(real(z4),imag(z4),'mo','LineWidth',1.5);

title("Miejsca zerowe wielomianu M(s)");
xlabel("RE(Z)"); 
ylabel("IM(Z)");
legend("OX","OY","\omega=0.2 \xi=-0.2 ","\omega=0.2 \xi=-0.7 ","\omega=0.7 \xi=-0.7 ","\omega=0.7 \xi=-0.2 ");
%}

%CZŁON OSCYLACYJNY (Ksi >=1  STAB BEZ OSCYLACJI-> w^2/S^2+2EwS+w^2    pamietaj w>0

E=1;W=2;
a=0; b=W^2; c=1; d=2*E*W; e=W^2; 
M=[c d e];
K_s1=tf([a,b] , [c,d,e])
z1=roots(M);
[Step1,t1]=step(K_s1,20);
[Impulse1,t2]=impulse(K_s1,20);

E=2;W=3;
a=0; b=W^2; c=1; d=2*E*W; e=W^2; 
M=[c d e];
K_s2=tf([a,b] , [c,d,e])
z2=roots(M);
[Step2,tt1]=step(K_s2,20);
[Impulse2,tt2]=impulse(K_s2,20);


E=4;W=4;
a=0; b=W^2; c=1; d=2*E*W; e=W^2; 
M=[c d e];
K_s3=tf([a,b] , [c,d,e])
z3=roots(M);
[Step3,ttt1]=step(K_s3,20);
[Impulse3,ttt2]=impulse(K_s3,20);

E=7;W=5;
a=0; b=W^2; c=1; d=2*E*W; e=W^2; 
M=[c d e];
K_s4=tf([a,b] , [c,d,e])
z4=roots(M);
[Step4,tttt1]=step(K_s4,20);
[Impulse4,tttt2]=impulse(K_s4,20);



%%%%%%%%RYSOWANIE%%%%%%%%
figure(6);
subplot(3,1,1);
grid on;
hold on;
plot(t1,Step1,'b');
plot(tt1,Step2,'r');
plot(ttt1,Step3,'g');
plot(tttt1,Step4,'m');
title("Odpowiedz skokowa członu oscylacyjnego, gdzie \xi \geq 1 - STABILNY BEZ OSCYLACJI");
xlabel("t [s]");
ylabel("\lambda (t)");

legend("\omega=2 \xi=1 ","\omega=3 \xi=2 ","\omega=4 \xi=4 ","\omega=5 \xi=7 ");



subplot(3,1,2);
grid on;
hold on;
plot(t2,Impulse1,'b');
plot(tt2,Impulse2,'r');
plot(ttt2,Impulse3,'g');
plot(tttt2,Impulse4,'m');
title("Odpowiedz impulsowa członu oscylacyjnego, gdzie \xi \geq 1 - STABILNY BEZ OSCYLACJI");
xlabel("t [s]");
ylabel("k(t)");
legend("\omega=2 \xi=1 ","\omega=3 \xi=2 ","\omega=4 \xi=4 ","\omega=5 \xi=7 ");

subplot(3,1,3);
grid on;
hold on;
plot([-1 1] , [0 0], 'k');
plot([0 0],[-1 1],'k');
plot(real(z1),imag(z1),'bo','LineWidth',1.5);
plot(real(z2),imag(z2),'ro','LineWidth',1.5);
plot(real(z3),imag(z3),'go','LineWidth',1.5);
plot(real(z4),imag(z4),'mo','LineWidth',1.5);

title("Miejsca zerowe wielomianu M(s)");
xlabel("RE(Z)"); 
ylabel("IM(Z)");
legend("OX","OY","\omega=2 \xi=1 ","\omega=3 \xi=2 ","\omega=4 \xi=4 ","\omega=5 \xi=7 ");
%}

%CZŁON OSCYLACYJNY (Ksi <= -1  NIESTAB BEZ OSCYLACJI-> w^2/S^2+2EwS+w^2    pamietaj w>0

E=-1;W=2;
a=0; b=W^2; c=1; d=2*E*W; e=W^2; 
M=[c d e];
K_s1=tf([a,b] , [c,d,e])
z1=roots(M);
[Step1,t1]=step(K_s1,30);
[Impulse1,t2]=impulse(K_s1,30);

E=-2;W=3;
a=0; b=W^2; c=1; d=2*E*W; e=W^2; 
M=[c d e];
K_s2=tf([a,b] , [c,d,e])
z2=roots(M);
[Step2,tt1]=step(K_s2,30);
[Impulse2,tt2]=impulse(K_s2,30);


E=-4;W=4;
a=0; b=W^2; c=1; d=2*E*W; e=W^2; 
M=[c d e];
K_s3=tf([a,b] , [c,d,e])
z3=roots(M);
[Step3,ttt1]=step(K_s3,30);
[Impulse3,ttt2]=impulse(K_s3,30);

E=-7;W=5;
a=0; b=W^2; c=1; d=2*E*W; e=W^2; 
M=[c d e];
K_s4=tf([a,b] , [c,d,e])
z4=roots(M);
[Step4,tttt1]=step(K_s4,30);
[Impulse4,tttt2]=impulse(K_s4,30);

%%%%%%%%RYSOWANIE%%%%%%%%
figure(7);
subplot(3,1,1);
grid on;
hold on;
plot(t1,Step1,'b');
plot(tt1,Step2,'r');
plot(ttt1,Step3,'g');
plot(tttt1,Step4,'m');
title("Odpowiedz skokowa członu oscylacyjnego, gdzie \xi \leq -1 - NIESTABILNY BEZ OSCYLACJI");
xlabel("t [s]");
ylabel("\lambda (t)");

legend("\omega=2 \xi=-1 ","\omega=3 \xi=-2 ","\omega=4 \xi=-4 ","\omega=5 \xi=-7 ");



subplot(3,1,2);
grid on;
hold on;
plot(t2,Impulse1,'b');
plot(tt2,Impulse2,'r');
plot(ttt2,Impulse3,'g');
plot(tttt2,Impulse4,'m');
title("Odpowiedz impulsowa członu oscylacyjnego, gdzie \xi \leq -1 - NIESTABILNY BEZ OSCYLACJI");
xlabel("t [s]");
ylabel("k(t)");
legend("\omega=2 \xi=-1 ","\omega=3 \xi=-2 ","\omega=4 \xi=-4 ","\omega=5 \xi=-7 ");

subplot(3,1,3);
grid on;
hold on;
plot([-1 1] , [0 0], 'k');
plot([0 0],[-1 1],'k');
plot(real(z1),imag(z1),'bo','LineWidth',1.5);
plot(real(z2),imag(z2),'ro','LineWidth',1.5);
plot(real(z3),imag(z3),'go','LineWidth',1.5);
plot(real(z4),imag(z4),'mo','LineWidth',1.5);

title("Miejsca zerowe wielomianu M(s)");
xlabel("RE(Z)"); 
ylabel("IM(Z)");
legend("OX","OY","\omega=2 \xi=1 ","\omega=3 \xi=2 ","\omega=4 \xi=4 ","\omega=5 \xi=7 ");
%}

%CZŁON CAŁKUJĄCY IDEALNY  -> 1/dS (zmienna d)

a=0; b=1; c=0; d=2; e=0; 
M=[c d e];
K_s1=tf([a,b] , [c,d,e])
z1=roots(M);
[Step1,t1]=step(K_s1);
[Impulse1,t2]=impulse(K_s1);

a=0; b=1; c=0; d=4; e=0; 
M=[c d e];
K_s2=tf([a,b] , [c,d,e])
z2=roots(M);
[Step2,tt1]=step(K_s2);
[Impulse2,tt2]=impulse(K_s2);


a=0; b=1; c=0; d=6; e=0; 
M=[c d e];
K_s3=tf([a,b] , [c,d,e])
z3=roots(M);
[Step3,ttt1]=step(K_s3);
[Impulse3,ttt2]=impulse(K_s3);


a=0; b=1; c=0; d=8; e=0; 
M=[c d e];
K_s4=tf([a,b] , [c,d,e])
z4=roots(M);
[Step4,tttt1]=step(K_s4);
[Impulse4,tttt2]=impulse(K_s4);

%%%%%%%%RYSOWANIE%%%%%%%%
figure(8);
subplot(3,1,1);
grid on;
hold on;
plot(t1,Step1,'b');
plot(tt1,Step2,'r');
plot(ttt1,Step3,'g');
plot(tttt1,Step4,'m');
title("Odpowiedz skokowa członu całkującego idealnego");
xlabel("t [s]");
ylabel("\lambda (t)");
legend("d=2","d=4","d=6","d=8");



subplot(3,1,2);
grid on;
hold on;
plot(t2,Impulse1,'b');
plot(tt2,Impulse2,'r');
plot(ttt2,Impulse3,'g');
plot(tttt2,Impulse4,'m');
title("Odpowiedz impulsowa członu całkującego idealnego");
xlabel("t [s]");
ylabel("k(t)");
legend("d=2","d=4","d=6","d=8");

subplot(3,1,3);
grid on;
hold on;
plot([-1 1] , [0 0], 'k');
plot([0 0],[-1 1],'k');
plot(z1,0,'bo','LineWidth',1.5);
plot(z2,0,'ro','LineWidth',1.5);
plot(z3,0,'go','LineWidth',1.5);
plot(z4,0,'mo','LineWidth',1.5);

title("Miejsca zerowe wielomianu M(s)");
xlabel("RE(Z)"); 
ylabel("IM(Z)");
legend("OX","OY","d=2","d=4","d=6","d=8");
%}

%CZŁON RÓŻNICZKUJĄCY z inercja (rzeczywisty)  -> aS/ds+1

a=-2; b=0; c=0; d=1; e=1; 
M=[c d e];
K_s1=tf([a,b] , [c,d,e])
z1=roots(M);
[Step1,t1]=step(K_s1);
[Impulse1,t2]=impulse(K_s1);

a=1; b=0; c=0; d=1; e=1; 
M=[c d e];
K_s2=tf([a,b] , [c,d,e])
z2=roots(M);
[Step2,tt1]=step(K_s2);
[Impulse2,tt2]=impulse(K_s2);


a=2; b=0; c=0; d=1; e=1; 
M=[c d e];
K_s3=tf([a,b] , [c,d,e])
z3=roots(M);
[Step3,ttt1]=step(K_s3);
[Impulse3,ttt2]=impulse(K_s3);


a=4; b=0; c=0; d=1; e=1; 
M=[c d e];
K_s4=tf([a,b] , [c,d,e])
z4=roots(M);
[Step4,tttt1]=step(K_s4);
[Impulse4,tttt2]=impulse(K_s4);
%%%%%%%%RYSOWANIE%%%%%%%%
figure(9);
subplot(3,1,1);
grid on;
hold on;
plot(t1,Step1,'b');
plot(tt1,Step2,'r');
plot(ttt1,Step3,'g');
plot(tttt1,Step4,'m');
title("Odpowiedz skokowa członu różniczkującego z inercją (człon rzeczywisty)  (d=1)");
xlabel("t [s]");
ylabel("\lambda (t)");
legend("a=-2","a=1","a=2","a=4");



subplot(3,1,2);
grid on;
hold on;
plot(t2,Impulse1,'b');
plot(tt2,Impulse2,'r');
plot(ttt2,Impulse3,'g');
plot(tttt2,Impulse4,'m');
title("Odpowiedz skokowa członu różniczkującego z inercją (człon rzeczywisty)  (d=1)");
xlabel("t [s]");
ylabel("k(t)");
legend("a=-2","a=1","a=2","a=4");

subplot(3,1,3);
grid on;
hold on;
plot([-2 2] , [0 0], 'k');
plot([0 0],[-1 1],'k');
plot(real(z1),imag(z1),'bo','LineWidth',1.5);
plot(real(z2),imag(z2),'ro','LineWidth',1.5);
plot(real(z3),imag(z3),'go','LineWidth',1.5);
plot(real(z4),imag(z4),'mo','LineWidth',1.5);

title("Miejsca zerowe wielomianu M(s)");
xlabel("RE(Z)"); 
ylabel("IM(Z)");
legend("OX","OY","a=-2","a=1","a=2","a=4");

%}

%CZŁON CAŁKUJĄCY Z INERCJĄ (RZECZYWISTY) -> k/cS^2+s

a=0; b=1; c=1; d=1; e=0; 
M=[c d e];
K_s1=tf([a,b] , [c,d,e])
z1=roots(M);
[Step1,t1]=step(K_s1);
[Impulse1,t2]=impulse(K_s1,20);

a=0; b=1; c=2; d=1; e=0; 
M=[c d e];
K_s2=tf([a,b] , [c,d,e])
z2=roots(M);
[Step2,tt1]=step(K_s2);
[Impulse2,tt2]=impulse(K_s2,20);


a=0; b=1; c=3; d=1; e=0; 
M=[c d e];
K_s3=tf([a,b] , [c,d,e])
z3=roots(M);
[Step3,ttt1]=step(K_s3);
[Impulse3,ttt2]=impulse(K_s3,20);


a=0; b=1; c=4; d=1; e=0; 
M=[c d e];
K_s4=tf([a,b] , [c,d,e])
z4=roots(M);
[Step4,tttt1]=step(K_s4);
[Impulse4,tttt2]=impulse(K_s4,20);
%%%%%%%%RYSOWANIE%%%%%%%%
figure(10);
subplot(3,1,1);
grid on;
hold on;
plot(t1,Step1,'b');
plot(tt1,Step2,'r');
plot(ttt1,Step3,'g');
plot(tttt1,Step4,'m');
axis([0 3 0 3]);
title("Odpowiedz skokowa członu całkującego z inercją (człon rzeczywisty) (b=1 i d=1)");
xlabel("t [s]");
ylabel("\lambda (t)");
legend("c=1","c=2","c=3","c=4");



subplot(3,1,2);
grid on;
hold on;
plot(t2,Impulse1,'b');
plot(tt2,Impulse2,'r');
plot(ttt2,Impulse3,'g');
plot(tttt2,Impulse4,'m');
title("Odpowiedz impulsowa członu całkującego z inercją (człon rzeczywisty) (b=1) i (d=1)");
xlabel("t [s]");
ylabel("k(t)");
legend("c=1","c=2","c=3","c=4");

subplot(3,1,3);
grid on;
hold on;
plot([-1 1] , [0 0], 'k');
plot([0 0],[-1 1],'k');
plot(real(z1),imag(z1),'bo','LineWidth',1.5);
plot(real(z2),imag(z2),'ro','LineWidth',1.5);
plot(real(z3),imag(z3),'go','LineWidth',1.5);
plot(real(z4),imag(z4),'mo','LineWidth',1.5);

title("Miejsca zerowe wielomianu M(s)");
xlabel("RE(Z)"); 
ylabel("IM(Z)");
legend("OX","OY","c=-1","c=1","c=3","c=4");
%}