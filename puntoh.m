# TP NUMERO 1 -- PEAJES -- punto H


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

#Punto C:
#Pasos totales por estación.

vector_pasostot_por_estacion = zeros(8,1);
cantidad_de_filas = rows(data);


# PUNTO H

# formas de pago
efectivo = 101;
exento = 102;
infraccion = 103;
no_cobrado = 104;
discapacidad = 105;
telepase = 106;

# me interesa saber la cantidad de NO COBRADOS por cada una de las horas del dia y ademas la cantidad de TIPOS de no cobrados totales para la hora con mayor cantidad de no cobrados.

# vector contador de no cobrados x hora del dia
vector_no_cobrados_hora = zeros (24,1);
# creo una matriz que va a contar la cantidad de cada tipo de no cobrados (columnas) por cada una de las horas del dia (filas). la ultima columna de la matrix va a contener los totales de no cobrados para ese horario
matriz_contador_tipos_hora = [102, 103, 104, 105, -1; zeros(24,5)];

# Opero sobre el data set para realizar el conteo x horarios
for fila = 1:cantidad_de_filas
  # guardo la hora de la fila analizada
  hora_actual = data(fila, hora) +1;
  # analizo si el tipo de pago fue no cobrado:
  if(data(fila, formapago) != 101 && data(fila, formapago) != 106)
    # sumo totales en la ultima columna para la hora analizada
    matriz_contador_tipos_hora(hora_actual+1, 5) = matriz_contador_tipos_hora(hora_actual+1,5) + data(fila, cantidadpasos);
    # elijo la fila que voy a escribir segun el tipo de defecto
    if (data(fila, formapago) == 102)
      fila_a_escribir = 1;
    elseif (data(fila, formapago) == 103)
      fila_a_escribir = 2;
    elseif (data(fila, formapago) == 104)
      fila_a_escribir = 3;
    elseif (data(fila, formapago) == 105)
      fila_a_escribir = 4;
    endif
    # sumo el tipo de forma de pago para la hora analizada
    matriz_contador_tipos_hora(hora_actual +1, fila_a_escribir) = matriz_contador_tipos_hora(hora_actual +1, fila_a_escribir) + data(fila, cantidadpasos);
  endif
endfor

disp('---Cantidad de no cobrados x hora del dia:');
disp(matriz_contador_tipos_hora);

# analizo cual es la hora del dia con mayor cantidad de casos no pagos.
maximo = 0;
hora_del_maximo = -1;
for x = 1:rows(matriz_contador_tipos_hora)
  if(matriz_contador_tipos_hora(x,5) > maximo)
    maximo = matriz_contador_tipos_hora(x,5);
    hora_del_maximo = x;
  endif
endfor

# para todas las horas calculo el maximo de cada uno de los tipos
vector_totales_por_tipo = sum(matriz_contador_tipos_hora(2:24,1:4));
# analizo de los totales por tipo cual es el que mas incide 
maximo_total = 0;
tipo_del_maximo = -1;
for col = 1:4
  if(vector_totales_por_tipo(1,col) > maximo_total)
    maximo_total = vector_totales_por_tipo(1,col);
    tipo_del_maximo = col;
  endif
endfor
disp('---totales por tipo:');
disp(vector_totales_por_tipo);
disp('---Analizando la totalidad de datos, el tipo de no pago que mas incide es el de la columna: (el tipo con mas casos en total)');
disp(tipo_del_maximo);
disp('con un total de:');
disp(maximo_total);


disp('La hora con mayor cantidad de casos no pagos tiene un total de:');
disp(maximo);
disp('Y es la hora:');
disp(hora_del_maximo);

# grafico la cantidad de no pagados x hora
bar(matriz_contador_tipos_hora(2:24,5));
title ('CANTIDAD DE NO PAGADOS POR HORA');
set(gca,'fontsize',10);
set(gca,'xTick',0:23);
ylim ([0 800000]);
xlabel ("Horas");
ylabel ("Cantidad de no pagos");
print -djpg graficos/puntoH/Grafico_cantidad_no_pagados_por_hora.jpg 
# grafico los distintos tipos de codigos de no pagado para la hora con mayor cantidad de casos no pagos. (luego de saber cual es la hora del maximo)
bar(matriz_contador_tipos_hora(hora_del_maximo,1:4));
title ('CANTIDAD POR CADA TIPO PARA LA HORA MAXIMA');
set(gca,'fontsize',10);
set(gca,'xTick',1:4);
xticklabels({'Exento','Infraccion','No Cobrado','Discapacidad'})
xlabel ("Tipo de Incobrabilidad");
ylabel ("Cantidad de no pagos");
print -djpg graficos/puntoH/Grafico_distribucion_de_tipos_nopago_en_hora_del_maximo.jpg
# grafico los totales por tipo en la totalidad del tiempo
bar(vector_totales_por_tipo);
title ('CANTIDADES TOTALES POR CADA TIPO HISTORICO');
set(gca,'fontsize',10);
set(gca,'xTick',1:4);
xticklabels({'Exento','Infraccion','No Cobrado','Discapacidad'})
xlabel ("Tipo de Incobrabilidad");
ylabel ("Cantidad de no pagos");
print -djpg graficos/puntoH/Grafico_distribucion_de_tipos_nopago_historico.jpg
