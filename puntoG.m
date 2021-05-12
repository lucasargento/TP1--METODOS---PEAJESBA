# TP NUMERO 1 -- PEAJES -- Punto G
#load data 
data = load('dataset/FlujoVehicular2019.dat');

function [vector_ingresos_totales_x_mes,vector_egresos_totales_x_mes] = pasos_prom_estacion (data,estacion_obs)
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
  #creo los vectores totales vacios
  vector_ingresos_totales_x_mes = zeros (12,1);
  vector_egresos_totales_x_mes = zeros (12,1);
  for fila = 1:cantidad_de_filas
    mes_obs = data(fila, mes);
    if ((data(fila,estacion)== estacion_obs) && (data(fila,sentido) == 1))
      vector_ingresos_totales_x_mes (mes_obs) = vector_ingresos_totales_x_mes (mes_obs) + data(fila,cantidadpasos);
    elseif ((data(fila,estacion)== estacion_obs) && (data(fila,sentido) == 2))
      vector_egresos_totales_x_mes(mes_obs) = vector_egresos_totales_x_mes (mes_obs) + data(fila,cantidadpasos);
    endif
  endfor
endfunction
#Llamados a la funcion, resultados y grafico cada estacion
#estacion 1 
[vector_ingresos_prom_x_mes_estacion_1,vector_egresos_prom_x_mes_estacion_1] = pasos_prom_estacion (data,1)
matriz_1 = [vector_ingresos_prom_x_mes_estacion_1,vector_egresos_prom_x_mes_estacion_1]
bar(matriz_1)
title ("CANTIDAD DE PASOS PROMEDIO POR MES EN LA ESTACION 1");
legend("Ingresos","Egresos",'location','northwest')
set(gca,'fontsize',10);
set(gca,'XTick',1:12);
xticklabels({'Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'})
xlabel ("MESES");
ylabel ("Cantidad de pasos promedio");
print -djpg graficos/puntoG/Grafico_pasos_prom_x_mes_01.jpg 

#estacion 2 
[vector_ingresos_prom_x_mes_estacion_2,vector_egresos_prom_x_mes_estacion_2] = pasos_prom_estacion (data,2)
matriz_2 = [vector_ingresos_prom_x_mes_estacion_2,vector_egresos_prom_x_mes_estacion_2]
bar(matriz_2)
title ("CANTIDAD DE PASOS PROMEDIO POR MES EN LA ESTACION 2");
legend("Ingresos","Egresos",'location','northwest')
set(gca,'fontsize',10);
set(gca,'XTick',1:12);
xticklabels({'Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'})
xlabel ("MESES");
ylabel ("Cantidad de pasos promedio");
print -djpg graficos/puntoG/Grafico_pasos_prom_x_mes_02.jpg 

#estacion 3 
[vector_ingresos_prom_x_mes_estacion_3,vector_egresos_prom_x_mes_estacion_3] = pasos_prom_estacion (data,3)
matriz_3 = [vector_ingresos_prom_x_mes_estacion_3,vector_egresos_prom_x_mes_estacion_3]
bar(matriz_3)
title ("CANTIDAD DE PASOS PROMEDIO POR MES EN LA ESTACION 3");
legend("Ingresos","Egresos",'location','northwest')
set(gca,'fontsize',10);
set(gca,'XTick',1:12);
xticklabels({'Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'})
xlabel ("MESES");
ylabel ("Cantidad de pasos promedio");
print -djpg graficos/puntoG/Grafico_pasos_prom_x_mes_03.jpg 

#estacion 4
[vector_ingresos_prom_x_mes_estacion_4,vector_egresos_prom_x_mes_estacion_4] = pasos_prom_estacion (data,4)
matriz_4 = [vector_ingresos_prom_x_mes_estacion_4,vector_egresos_prom_x_mes_estacion_4]
bar(matriz_4)
title ("CANTIDAD DE PASOS PROMEDIO POR MES EN LA ESTACION 4");
legend("Ingresos","Egresos",'location','northwest')
set(gca,'fontsize',10);
set(gca,'XTick',1:12);
xticklabels({'Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'})
xlabel ("MESES");
ylabel ("Cantidad de pasos promedio");
print -djpg graficos/puntoG/Grafico_pasos_prom_x_mes_04.jpg 

#estacion 5
[vector_ingresos_prom_x_mes_estacion_5,vector_egresos_prom_x_mes_estacion_5] = pasos_prom_estacion (data,5)
matriz_5 = [vector_ingresos_prom_x_mes_estacion_2,vector_egresos_prom_x_mes_estacion_5]
bar(matriz_5)
title ("CANTIDAD DE PASOS PROMEDIO POR MES EN LA ESTACION 5");
legend("Ingresos","Egresos",'location','northwest')
set(gca,'fontsize',10);
set(gca,'XTick',1:12);
xticklabels({'Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'})
xlabel ("MESES");
ylabel ("Cantidad de pasos promedio");
print -djpg graficos/puntoG/Grafico_pasos_prom_x_mes_05.jpg 

#estacion 6 
[vector_ingresos_prom_x_mes_estacion_6,vector_egresos_prom_x_mes_estacion_6] = pasos_prom_estacion (data,6)
matriz_6 = [vector_ingresos_prom_x_mes_estacion_6,vector_egresos_prom_x_mes_estacion_6]
bar(matriz_6)
title ("CANTIDAD DE PASOS PROMEDIO POR MES EN LA ESTACION 6");
legend("Ingresos","Egresos",'location','northwest')
set(gca,'fontsize',10);
set(gca,'XTick',1:12);
xticklabels({'Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'})
xlabel ("MESES");
ylabel ("Cantidad de pasos promedio");
print -djpg graficos/puntoG/Grafico_pasos_prom_x_mes_06.jpg 

#estacion 7 
[vector_ingresos_prom_x_mes_estacion_7,vector_egresos_prom_x_mes_estacion_7] = pasos_prom_estacion (data,7)
matriz_7 = [vector_ingresos_prom_x_mes_estacion_7,vector_egresos_prom_x_mes_estacion_7]
bar(matriz_7)
title ("CANTIDAD DE PASOS PROMEDIO POR MES EN LA ESTACION 7");
legend("Ingresos","Egresos",'location','northwest')
set(gca,'fontsize',10);
set(gca,'XTick',1:12);
xticklabels({'Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'})
xlabel ("MESES");
ylabel ("Cantidad de pasos promedio");
print -djpg graficos/puntoG/Grafico_pasos_prom_x_mes_07.jpg 

#estacion 8
[vector_ingresos_prom_x_mes_estacion_8,vector_egresos_prom_x_mes_estacion_8] = pasos_prom_estacion (data,8)
matriz_8 = [vector_ingresos_prom_x_mes_estacion_8,vector_egresos_prom_x_mes_estacion_8]
bar(matriz_8)
title ("CANTIDAD DE PASOS PROMEDIO POR MES EN LA ESTACION 8");
legend("Ingresos","Egresos",'location','northwest')
set(gca,'fontsize',10);
set(gca,'XTick',1:12);
xticklabels({'Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'})
xlabel ("MESES");
ylabel ("Cantidad de pasos promedio");
print -djpg graficos/puntoG/Grafico_pasos_prom_x_mes_08.jpg 