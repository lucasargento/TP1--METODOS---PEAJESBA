# TP NUMERO 1 -- PEAJES -- Puntos A, B y C


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


# PUNTO B: Balances

# balance de ingresos y egresos totales segun horario las 24hs del dia

# vector contador de ingresos x horario
vector_ingresos_hora = zeros (24,1);

# vector contador de egresos x horario
vector_egresos_hora = zeros (24,1);

cantidad_de_filas = rows(data);
disp(cantidad_de_filas);

# Opero sobre el data set para realizar el conteo x horarios
for fila = 1:cantidad_de_filas
  # guardo la hora de la fila analizada
  hora_actual = data(fila, hora) +1;
  # analizo ingreso / egreso y sumo cantidades al contador correspondiente
  if(data(fila, sentido) == 1)
    vector_ingresos_hora(hora_actual) = vector_ingresos_hora(hora_actual) + data(fila, cantidadpasos);
  else
    vector_egresos_hora(hora_actual) = vector_egresos_hora(hora_actual) + data(fila, cantidadpasos);
  endif
endfor


disp('vector de ingresos:');
disp(vector_ingresos_hora);
disp('vector de egresos:');
disp(vector_egresos_hora);

# Graficamos los ingresos por hora
plot(vector_ingresos_hora, 'color', 'g')
title ("CANTIDAD DE INGRESOS TOTALES POR HORA");
set(gca,'fontsize',12);
set(gca,'XTick',1:24);
xlabel ("HORA");
ylabel ("Cantidad de pasos");
print -djpg graficos/puntoB/Grafico_Ingresos_Totales_x_Hora.jpg 

#Graficamos los egresos por hora
plot(vector_egresos_hora, 'color', 'r')
title ("CANTIDAD DE EGRESOS TOTALES POR HORA");
set(gca,'fontsize',12);
set(gca,'XTick',1:24);
xlabel ("HORA");
ylabel ("Cantidad de pasos");
print -djpg graficos/puntoB/Grafico_Egresos_Totales_x_Hora.jpg 


#Punto C:
#Pasos totales por estación.

vector_pasostot_por_estacion = zeros(8,1);

#lee por cada fila la estación que se analiza y suma los pasos a un vector.
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
# guardo la hora de la fila analizada
  if (data(fila, estacion) == estacion_max)
    hora_actual_est_max = data(fila, hora) +1;
# analizo ingreso / egreso y sumo cantidades al contador correspondiente
    if(data(fila, sentido) == 1)
      vector_est_max_ingresos(hora_actual_est_max) = vector_est_max_ingresos(hora_actual_est_max) + data(fila, cantidadpasos);
    else
      vector_est_max_egresos(hora_actual_est_max) = vector_est_max_egresos(hora_actual_est_max) + data(fila, cantidadpasos);
    endif
  endif
endfor

# Graficamos los ingresos y egresos para la estacion con maxima cantidad de pasos
disp("La estacion con mayor cantidad de pasos totales es:");
disp(estacion_max);

matriz_balance = [vector_est_max_ingresos,vector_est_max_egresos];
bar(matriz_balance)
title ("PASOS POR HORA EN LA ESTACION CON MAXIMA CANTIDAD DE PASOS ");
legend("Ingresos","Egresos",'location','northwest')
set(gca,'fontsize',10);
set(gca,'XTick',1:24);
xticklabels(1:24)
xlabel ("HORAS");
ylabel ("Cantidad de pasos");
print -djpg graficos/puntoC/Pasos_x_hora_estacion_maxima.jpg 