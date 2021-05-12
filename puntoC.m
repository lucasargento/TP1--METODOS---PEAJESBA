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

#Punto C:
#Pasos totales por estaci�n.

vector_pasostot_por_estacion = zeros(8,1);
cantidad_de_filas = rows(data);

#lee por cada fila la estaci�n que se analiza y suma los pasos a un vector.
for fila = 1:cantidad_de_filas
  estacion_analizada = data(fila, estacion);
  vector_pasostot_por_estacion(estacion_analizada) = vector_pasostot_por_estacion(estacion_analizada) + data(fila, cantidadpasos);
endfor

#analizo cual es el mayor valor y obtengo su posicion en el vector que coincide con el numero de estacion.
maximo = -1;
repetidos = zeros (1,1);
for fila_de_vector = 1:8
  if vector_pasostot_por_estacion(fila_de_vector, 1 ) > maximo
    maximo = vector_pasostot_por_estacion(fila_de_vector, 1 );
    estacion_max = fila_de_vector;
  elseif vector_pasostot_por_estacion(fila_de_vector, 1 ) == maximo
    estacion_max_rep = fila_de_vector;
  endif
endfor

#analizo el balance de la estacion con maxima cantida de pasos.
vector_est_max_ingresos = zeros (24,1);
vector_est_max_egresos = zeros (24,1);

for fila = 1:cantidad_de_filas
  #guardo la hora de la fila analizada
  if (data(fila, estacion) == estacion_max)
    hora_actual_est_max = data(fila, hora) +1;
    #analizo ingreso / egreso y sumo cantidades al contador correspondiente
    if(data(fila, sentido) == 1)
      vector_est_max_ingresos(hora_actual_est_max) = vector_est_max_ingresos(hora_actual_est_max) + data(fila, cantidadpasos);
    else
      vector_est_max_egresos(hora_actual_est_max) = vector_est_max_egresos(hora_actual_est_max) + data(fila, cantidadpasos);
    endif
  endif
endfor

# Graficamos los ingresos y egresos
disp("La estacion con mayor cantidad de pasos totales es:");
disp(estacion_max);

plot(vector_est_max_ingresos, 'color', 'g')
title ("CANTIDAD DE INGRESOS POR HORA EN LA ESTACION CON MAXIMA CANTIDAD DE PASOS");
set(gca,'fontsize',12);
set(gca,'XTick',1:24);
xlabel ("HORA");
ylabel ("Cantidad de pasos");
print -djpg graficos/puntoC/cantidad_ingresos_estacionmax.jpg

plot(vector_egresos_hora, 'color', 'r',";CANTIDAD DE EGRESOS POR HORA;")
xlabel ("HORA");
ylabel ("Cantidad de pasos");
title ("CANTIDAD DE EGRESOS POR HORA");
set(gca,'fontsize',12);
print -djpg graficos/puntoC/cantidad_egresos_estacionmax.jpg
