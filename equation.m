
function implementationOfTheEquation = equation(t,p)

% I - ca�kowity pr�d 
I = 50;
% gNa - przewodno�� sodu
gNa = 120 %mS/cm2 +
% gK - przewodno�� potasu
gK = 36 %mS/cm2 + 
% gL - przewodno�� kana�u wycieku
GL = 0.3 %mS/cm2 +

% eNa - potencja� sodu 
eNa = 55 %mV + 
% eK - potencja� potasu
eK = -77 %mV + 
% eL - potencja� kana�u wycieku
eL = - 55.4 %mV + 

% pobranie warto�ci V, m, n oraz h
V = p(1);
m = p(2);
h = p(3);
n = p(4);

% kana� sodowy - przewodno�� jon�w sodu jest proporcjonalna do iloczynu mmmh:
GNa = gNa*(m^3)*h;
% kana� potasowy - przewodno�� jon�w potasu jest proporcjonalna do iloczynu nnnn:
GK = gK*(n^4);



% R�wnania dla alfa m,n,h oraz beta m,n,h
alfa_m = (0.1*(V+40))/(1-exp(-(V+40)/10));
beta_m = 4*exp(-(V+65)/18);

alfa_n = (0.01*(V+55)) / (1-exp(-(V+55)/10));
beta_n = (0.125*exp(-(V+65)/80));

alfa_h = 0.07*exp(-(V+65)/20);
beta_h = 1/(1+exp(-(V+35)/10));

% Implementacja r�wna�   
dV_dt = (I-(GNa*(V-eNa))-(GK*(V-eK))-(GL*(V-eL)));    
dm_dt = alfa_m*(1-m)-beta_m*m;
dh_dt = alfa_h*(1-h)-beta_h*h;
dn_dt = alfa_n*(1-n)-beta_n*n;

% Wektor wszystkich r�wna�
implementationOfTheEquation = [dV_dt;dm_dt;dh_dt;dn_dt];

end
  
  
 
 
 