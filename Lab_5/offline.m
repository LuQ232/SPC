clear all;
close all;

%STALE
b = [1,2,3];

%WYJSCIA
Y=ones(1,50);


%Phi
Phi=ones(50,3);
Phi(1,:)=[rand(),0,0];
Phi(2,:)=[rand(),rand(),0];;


% I ITERACJA
u=[rand(),0,0];
z=randn();
Y(1)=u(1)*b(1)+u(2)*b(2)+u(3)*b(3)+z;
Phi(1,:)=u;

% II ITERACJA
u=[rand(),rand(),0];
z=randn();
Y(1)=u(1)*b(1)+u(2)*b(2)+u(3)*b(3)+z;
Phi(2,:)=u;


% ITERACJE od 3 do 50

for i=1:48
    u=rand(1,3);
    z=randn();
    Y(i+2)=u(1)*b(1)+u(2)*b(2)+u(3)*b(3)+z;
    Phi(i+2,:)=u;
end


%WZOR 
estymator=inv(transpose(Phi)*Phi)*transpose(Phi)*transpose(Y);

for i=1:50
    estymator_2=inv(transpose(Phi(1:i,:))*Phi(1:i,:))*transpose(Phi(1:i,:))*transpose(Y(1:i));
    norma(i)=norm(estymator_2-b);
end


figure(1);
grid on;
hold on;
xlabel("Ilość badań");
ylabel("|b_{n}^{off} - b|");
%WYKRES
for i=1:48
    plot(i+2,norma(i+2),"go");
end