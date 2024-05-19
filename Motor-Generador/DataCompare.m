
uiopen
len = length(Data);
ini = floor(len/2);
y = Data(ini:end,1); %Salida
u = Data(ini:end,2); %Entrada
offset = Data(ini:end,3);
t = time(ini:end);

media = mean(y); %Punto medio

%Grafica

plot(t,offset-3,t,u-3,t,y-media,'linewidth',2),grid
