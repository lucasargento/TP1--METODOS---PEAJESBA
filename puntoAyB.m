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

# Graficamos los ingresos y egresos
plot(vector_ingresos_hora, 'color', 'g')
title ("CANTIDAD DE INGRESOS POR HORA");
set(gca,'fontsize',12);
set(gca,'XTick',1:24);
xlabel ("HORA");
ylabel ("Cantidad de pasos");
#plot(vector_egresos_hora, 'color', 'r',";CANTIDAD DE EGRESOS POR HORA;")
#xlabel ("HORA");
#ylabel ("Cantidad de pasos");
#title ("CANTIDAD DE EGRESOS POR HORA");
#set(gca,'fontsize',12);
