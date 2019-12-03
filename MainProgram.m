% V - r�nica potencja��w mi�dzy wewn�trzn� a zewn�trzn� stron� membrany 
V = 60;
% bramka typu 'm'
m = 0.2;
% bramka typu 'n'
n = 0.3;
% bramka typu 'h'
h = 0.2;

% wektor czasu
t = 0:0.0001:10;
% wektor p sk�adaj�cy si� z czterech element�w: V, m, n oraz h
p=[V;m;n;h];


% funkcja do rowi�zywania r�wna� r�niczkowych
[k,w] = ode45(@equation,t,p);


% wygenerowanie wykresu napi�cia
figure,plot(k,w(:,1))
title('Napiecie [mV]')

% wygenerowanie wykresu bramek 
figure, plot(k,w(:,2))
hold on
plot(k,w(:,3))
hold on
plot(k,w(:,4))
title('Prawdopodobie�stwo otwarcia bramki')
legend('bramka m','bramka n ','bramka h')
