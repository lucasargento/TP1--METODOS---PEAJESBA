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

# PUNTO D
# IDENTIFICAR LAS DOS FRANJAS DE TRES HORAS CADA UNA, SIN SOLAPARSE QUE PRESENTAN MAYOR MOVILIDAD. CONTABILIZARLAS PARA TODAS LAS UNIDADES DE PEAJES TANTO INGRESOS COMO EGRESOS. GRAFICAR.

# defino un vector donde voy a ir guardando las franjas horarias.
vector_franjas_horarias = [-1 -1 -1 -1];

# calculo las franjas horarias posibles. para cada una de las horas, le sumo 2 para obtener las dos siguientes y guardo ese trio de horarios en el vector

for hora_numero = 0:21
  vector_franjas_horarias = [vector_franjas_horarias; hora_numero hora_numero + 1 hora_numero + 2 0];
endfor

# Recuento cantidad de ingresos + egresos para cada franja horaria, los voy a contar en la cuarta columna de la matriz que cree arriba vector_franjas_horarias

for fila_data = 1:cantidad_de_filas
  # para cada una de las franjas horarias que tengo analizo mi data.
  for franja = 1:rows(vector_franjas_horarias)
    if(franja != 1)
      if (data(fila_data,hora) == vector_franjas_horarias(franja, 1) || data(fila_data,hora) == vector_franjas_horarias(franja, 2)|| data(fila_data,hora) == vector_franjas_horarias(franja, 3))
        vector_franjas_horarias(franja, 4) = vector_franjas_horarias(franja, 4) + data(fila_data,cantidadpasos);
      endif
    endif
  endfor
endfor

disp("cantidad de pasos por cada franja horaria de 3 horas:");
# obtengo ordenadas las franjas horarias y sus ingresos para saber cuales son las dos con mayor cantidad de pasos.
disp(sortrows(vector_franjas_horarias,4));

# Grafico la cantidad de pasos por cada una de las franjas horarias. 
bar(vector_franjas_horarias(:,4));