clear all;
close all;


%%%%%OBIEKT nr 1%%%%%%%%%%% 1/(s^2+s+5)

a=1;b=1;c=5;

%%%%%ZMIENIAM Kp , KI STALE ROWNE 1
kp=0:0.2:30;

for i=1:1:length(kp)
    Y(i)=MISE(kp(i),1,a,b,c);
end
figure(1);
hold on;
grid on;
plot(kp,Y);
xlabel("Kp");
ylabel("MISE(Kp,1)");
title("MISE w zależności od zmiany Kp")

%%%%%%ZMIENIAM Kp , KI STALE ROWNE 1
ki=0:0.2:7.5;

for i=1:1:length(ki)
    Y_2(i)=MISE(1,ki(i),a,b,c);
end
figure(2);
grid on;
hold on;
plot(ki,Y_2);
xlabel("Ki");
ylabel("MISE(1,Ki)");
title("MISE w zależności od zmiany Ki")


kp=0:0.1:3;
ki=0:0.1:3;
for i=1:1:length(kp)
    for j=1:1:length(ki)
            M(i,j)=MISE(kp(i),ki(j),a,b,c);
    end
end

figure(3)
[X , Y_3]=meshgrid (kp,ki)
mesh(X,Y_3,M)
title("Wykres MISE w zależności od Ki oraz Kp");
xlabel("Kp");
ylabel("Ki");
zlabel("MISE");

uchwyt_funkcji=@(x)MISE(x(1),x(2),a,b,c);

x0=[0,0];
optymalne_wartosci_nastaw=fminsearch(uchwyt_funkcji,x0)





%%%%%OBIEKT nr 2%%%%%%%%%%% 1/(8s^2+4s+1)
a=8;b=4;c=1;




%%%%%ZMIENIAM Kp , KI STALE ROWNE 1

kp=0:0.2:30;

for i=1:1:length(kp)
    Y_4(i)=MISE(kp(i),1,a,b,c);
end
figure(4);
hold on;
grid on;
plot(kp,Y_4);
xlabel("Kp");
ylabel("MISE(Kp,1)");
title("MISE w zależności od zmiany Kp")

%%%%%%ZMIENIAM Kp , KI STALE ROWNE 1
ki=0:0.2:5.5;

for i=1:1:length(ki)
    Y_5(i)=MISE(1,ki(i),a,b,c);
end
figure(5);
grid on;
hold on;
plot(ki,Y_5);
xlabel("Ki");
ylabel("MISE(1,Ki)");
title("MISE w zależności od zmiany Ki")


kp=0:0.1:3;
ki=0:0.1:3;
for i=1:1:length(kp)
    for j=1:1:length(ki)
            M(i,j)=MISE(kp(i),ki(j),a,b,c);
    end
end

figure(6)
[X , Y_6]=meshgrid (kp,ki)
mesh(X,Y_6,M)
title("Wykres MISE w zależności od Ki oraz Kp");
xlabel("Kp");
ylabel("Ki");
zlabel("MISE");
uchwyt_funkcji=@(x)MISE(x(1),x(2),a,b,c);

x0=[0,0];
optymalne_wartosci_nastaw=fminsearch(uchwyt_funkcji,x0)

