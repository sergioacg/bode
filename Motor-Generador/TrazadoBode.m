close all
clc

Exp = xlsread('ExpData');

%Frecuencia Fundamental
w = Exp(:,1);

%Convierto la ganancia a decibelios
Gdb = 20*log10(Exp(:,2));

%Convierto la fase de radianes a grados
Fdeg = rad2deg(Exp(:,3));

% Modelo de Primer Orden Motor Generador
k = 0.8536;
tau = 0.9479;
L = 0.1;
G = tf(k,[tau 1],'iodelay', L);
[MAG,PHASE,W] = bode(G);
len = length(W);
MAG = 20*log10(reshape(MAG,len,1));
PHASE = reshape(PHASE,len,1);

%Grafico el Bode Experimental
figure(1)
subplot(211)
 semilogx(W,MAG,'linewidth',2),hold on
semilogx(w,Gdb,'--','linewidth',2),grid
ylabel('Magnitude(db)')
subplot(212)
semilogx(W,PHASE,'linewidth',2),hold on
semilogx(w,Fdeg,'--','linewidth',2),grid
ylabel('Phase(deg)')
xlabel('Frequency (rad/s)')