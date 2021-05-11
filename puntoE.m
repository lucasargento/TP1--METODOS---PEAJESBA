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
#punto E

#Se crean las matrices vacias que tendran por cada fila numero de estacion y 

matriz_livianos_por_estacion = zeros (8,2);
matriz_pesados_por_estacion = zeros (8,2);

#lee por cada fila del archivo la estación que se analiza, se fija si es liviano y suma los pasos a en la 2da columna los pasos.
#mientras que en la primera fija la posicion de la estacion.
for fila = 1:cantidad_de_filas
  estacion_analizada_E = data(fila, estacion);
  matriz_livianos_por_estacion(estacion_analizada_E,1) = estacion_analizada_E;
  matriz_pesados_por_estacion (estacion_analizada_E,1) = estacion_analizada_E;
  if (data(fila,tipovehiculo) == 1)
    matriz_livianos_por_estacion (estacion_analizada_E,2) = matriz_livianos_por_estacion(estacion_analizada_E,2) + data(fila, cantidadpasos);
  else
    matriz_pesados_por_estacion (estacion_analizada_E,2) = matriz_pesados_por_estacion(estacion_analizada_E,2) + data(fila, cantidadpasos);
  endif
endfor
#ordena las matrices respecto de la 2da columna, de esta manera nos queda en la segunda columna en forma ascendente
#la estacion con menor cantidad de pasos, y su respectiva cantidad de pasos.
matriz_livianos_por_estacion_ordenada = sortrows(matriz_livianos_por_estacion, -2);
matriz_pesados_por_estacion_ordenada = sortrows(matriz_pesados_por_estacion, -2);

disp('   Estacion  Pasos de Vehiculos Livianos')
disp(matriz_livianos_por_estacion_ordenada);
disp(' ');
disp('  Estacion  Pasos de Vehiculos Pesados')
disp(matriz_pesados_por_estacion_ordenada);