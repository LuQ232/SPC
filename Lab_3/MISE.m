function wart_koncowa = MISE(K_p,K_i,A,B,C)
if K_i >= 0
    %a=8;b=4;c=1;
    K_obiektu=tf(1,[A,B,C]);
    kp=tf(K_p);
    ki=tf(K_i,[1,0]);
    K_regulatora=kp+ki;
    K_otwarte=K_obiektu*K_regulatora;
    K_E=1/(1+K_otwarte);
    [a,t]=step(K_E,20);
    delta_t=t(2)-t(1);
    wart_koncowa = (delta_t.*sum(a.*a));
    %{
    plot(t,a.*a);
    grid on;
    xlabel("Time [s]");
    ylabel("e^2(t)");
    title("Wykres Kwadratu uchybu");
    %}
else
    wart_koncowa=300;
end

end