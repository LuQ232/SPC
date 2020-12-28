clear all;
close all;

%STALE
b = [1,2,3];



P=diag([1000,1000,1000]);
estymator_online=[0,0,0];

%I ITERACJA


%WEJSCIA
u=[rand(),0,0];

%SZUM
z=randn();

%WYJSCIA 
y=u(1)*b(1)+u(2)*b(2)+u(3)*b(3)+z;

%TRANSPIZYCJA ESTYMATORA
estymator_online=transpose(estymator_online);

wektor_fi=transpose(u);

tmp=y-transpose(wektor_fi)*estymator_online;
P=P-((P*wektor_fi*transpose(wektor_fi)*P)/(1+transpose(wektor_fi)*P*wektor_fi));

estymator_online=estymator_online +P*wektor_fi*tmp;


%NORMA
norma(1)=norm(estymator_online-b);

%RYSOWANIE 
figure(1);
grid on;
hold on;
xlabel("Ilość badań");
ylabel("|b_{n}^{off} - b|");
plot(1,norma(1),"go");



%%%%% II ITERACJA

%WEJSCIA
u=[rand(),rand(),0];

%SZUM
z=randn();


y=u(1)*b(1)+u(2)*b(2)+u(3)*b(3)+z;

%TRANSPIZYCJA ESTYMATORA


wektor_fi=transpose(u);

tmp=y-transpose(wektor_fi) * estymator_online;
P=P-((P*wektor_fi*transpose(wektor_fi)*P)/(1+transpose(wektor_fi)*P*wektor_fi));

estymator_online=estymator_online +P*wektor_fi*tmp;


%NORMA
norma(2)=norm(estymator_online-b);
plot(2,norma(2),"go");



%%RESZTA POMIAROW

for i=1:48
    u=[rand(),rand(),rand()];
    z=randn();

    y=u(1)*b(1)+u(2)*b(2)+u(3)*b(3)+z;


    wektor_fi=transpose(u);

    tmp=y-transpose(wektor_fi)*estymator_online;
    P=P-((P*wektor_fi*transpose(wektor_fi)*P)/(1+transpose(wektor_fi)*P*wektor_fi));

    estymator_online=estymator_online +P*wektor_fi*tmp;
    
    norma(i+2)=norm(estymator_online-b);
    plot(i+2,norma(i+2),"go");
    
end
