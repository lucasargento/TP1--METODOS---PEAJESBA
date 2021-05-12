# TP NUMERO 1 -- PEAJES


# PUNTO A: load data 
data = load('dataset/FlujoVehicular2019.dat');

# mapeo nombres - columnas del dataset

mes = 1;
diames = 2;
hora = 3;
diasemana = 4;
estacion = 5;
sentido = 6;
tipovehiculo = 7;
formapago = 8;
cantidadpasos = 9;
cantidad_de_filas = rows(data);

# PUNTO I
# Realizar una serie diaria anual de pasos pagados segun las modalidades efectivo y telepase. 
# por cada dia en un año queiro tener un vector que tenga la cantidad de efectivos, telepases, y uno que sea la suma de ambos
# Guardamos los datos de efectivo, telepase y totales en tres matrices de 31x12 que tendran como columnas meses y como filas los dias del año

matriz_efectivo = [1,2,3,4,5,6,7,8,9,10,11,12;zeros(31,12)];
matriz_telepase = [1,2,3,4,5,6,7,8,9,10,11,12;zeros(31,12)];
matriz_totales = [1,2,3,4,5,6,7,8,9,10,11,12;zeros(31,12)];

for fila = 1:cantidad_de_filas
  if(data(fila, formapago)==101)
  # si pago en efectivo
    mes_actual = data(fila,mes);
    dia_actual = data(fila,diames);
    if(mes_actual != 0 && dia_actual != 0)
      matriz_efectivo(dia_actual+1, mes_actual) = matriz_efectivo(dia_actual+1, mes_actual) + data(fila, cantidadpasos);
      matriz_totales(dia_actual+1, mes_actual) = matriz_efectivo(dia_actual+1, mes_actual) + matriz_telepase(dia_actual+1, mes_actual);
    endif
  elseif(data(fila, formapago)==106)
  # si pago con telepase
    mes_actual = data(fila,mes);
    dia_actual = data(fila,diames);
    if(mes_actual != 0 && dia_actual != 0)
      matriz_telepase(dia_actual+1, mes_actual) = matriz_telepase(dia_actual+1, mes_actual) + data(fila, cantidadpasos);
      matriz_totales(dia_actual+1, mes_actual) = matriz_efectivo(dia_actual+1, mes_actual) + matriz_telepase(dia_actual+1, mes_actual);
    endif
  endif
endfor

disp('serie anual- pagos en efectivo');
disp(matriz_efectivo);

disp('serie anual- pagos con telepase');
disp(matriz_telepase);

disp('serie anual- pagos con telepase +  pagos con efectivo');
disp(matriz_totales);

# creo las series temporales sumando cada una de las columnas de la matriz menos la primera fila.

serie_temporal_efectivo = [];
serie_temporal_telepase = [];
serie_temporal_totales = [];

for col = 1:12
  serie_temporal_efectivo = [serie_temporal_efectivo;matriz_efectivo(2:32,col)];
  serie_temporal_telepase = [serie_temporal_telepase;matriz_telepase(2:32,col)];
  serie_temporal_totales = [serie_temporal_totales;matriz_totales(2:32,col)];
endfor

disp('Serie temporal efectivo');
disp(serie_temporal_efectivo);
disp('Serie temporal telepase');
disp(serie_temporal_telepase);
disp('Serie temporal totales');
disp(serie_temporal_totales);
disp(rows(serie_temporal_efectivo));

plot(nonzeros(serie_temporal_efectivo));
title ('SERIE TEMPORAL EFECTIVO');
set(gca,'fontsize',10);
xlim ([1 365]);
xlabel ("DIA");
ylabel ("Cantidad de pagos");
print -djpg graficos/puntoI/Grafico_serie_temporal_efectivo.jpg
 
plot(nonzeros(serie_temporal_telepase));
title ('SERIE TEMPORAL TELEPASE');
set(gca,'fontsize',10);
xlim ([1 365]);
xlabel ("DIA");
ylabel ("Cantidad de pagos");
print -djpg graficos/puntoI/Grafico_serie_temporal_telepase.jpg 

plot(nonzeros(serie_temporal_totales));
title ('SERIE TEMPORAL EFECTIVO + TELEPASE');
set(gca,'fontsize',10);
xlim ([1 365]);
xlabel ("DIA");
ylabel ("Cantidad de pagos");
print -djpg graficos/puntoI/Grafico_serie_temporal_totales.jpg 
