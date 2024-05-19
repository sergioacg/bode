clc
clear
close all

load('Data_PRBS.mat')

Ts = 0.05;
datos = iddata(y, u, Ts);

% Estimar la función de transferencia (IDENT)
sys1c = tfest(datos, 1, 0, NaN)

%Comparar
compare(datos, sys1c)

figure
sys2c = tfest(datos, 2, 1, NaN)

%Comparar
compare(datos, sys2c)