# 1. Crear un nuevo proyecto denominado practica 4.

# 2. Mediante la libreria readr, o mediante los menus de RStudio, leer los datasets sleep.csv  y activities.csv
# ambos archivos deben estar previamente en la carpeta del proyecto creado

#mediante la libreria(readr) y con el comando read_csv creamos los dataframes

library(readr)#en la libreria de readr hay q escribirlo con barra baja
sleep<-read_csv("~/Desktop/R/practica 4/sleep.csv")
activities<-read_csv("~/Desktop/R/practica 4/activities.csv")

# 3.Comprobar el contenido  con View y contar cuantos NAs hay en la columna GPS del dataset activities

#se visualizan ambos dataframes
View(sleep)
View(activities)


#establecemos un contador que nos cuente el número total de NAs contendios en activities
t<-0
for(i in activities$GPS){
 if(is.na(i==NA)){
   t<-t+1;
 } 
}

print(t)

# 4. Crear un objeto R denominado act_new que contenga solo las variables   #select
# siguientes: 1,2,5-6

library(dplyr)
act_new<-select(activities, 1,2,5:6)

# 5. Renombrar la variable 'Activity type' con el nombre 'tipo' y la variable 'Time zone' como 'ciudad'

#mediante el comando names, observamos como se denominan las columnas del dataframe para más tarde renombrarlas con rename

names(act_new)
act_new<-rename(act_new, tipo="Activity type", ciudad="Timezone")

# 6. Realizar un recuento de tipo de actividad con summary. Para ello 
# debes transformar previamente la variable tipo a factor con as.factor.
# Crea un grafico de barras con dicha variable par visualizar las frecuencias.
# Haz lo mismo para la variable ciudad

act_new_tipo<-as.factor(act_new$tipo)#transformación
summary(act_new_tipo)#resumen de cuantos deportes hay de cada tipo
plot(act_new_tipo, main="activities")#gráfica con frecuencias

act_new_ciudad<- as.factor(act_new$ciudad)
summary(act_new_ciudad)
plot(act_new_ciudad, main="ciudad")

#7. Filtrar los registros de act_new que correspondan con ciudad Amsterdam en otro objeto
# y lo mismo con Madrid. Con esos nuevos objetos determina los deportes que 
# no se practican en Amsterdam y s? en Madrid y viceversa. Genera graficos para visualizar los resultados



#Una manera de hacerlo con el bucle for
ciudad_amsterdam<-filter(act_new, ciudad=="Europe/Amsterdam")
ciudad_madrid<-filter(act_new, ciudad=="Europe/Madrid")

dep_madrid<-ciudad_madrid$tipo
dep_ams<-ciudad_amsterdam$tipo

n<-length(dep_madrid)
m<-length(dep_ams)

mad<-unique(dep_madrid)
ams<-unique(dep_ams)

imprimir_dep_mad_ams<-function(ams, mad){
  
  for(i in 1:length(mad)){
  enc<-FALSE#lo primero tiene que estar en no encontrado para que cuando se encuentre lo cambie
   for(j in 1:length(ams)){
    if( ams[j]==mad[i])
      {enc<-TRUE }
     
     
   } 
    if(!enc)print(mad[i])
  }
  

  
}
imprimir_dep_mad_ams(ams,mad)
imprimir_dep_mad_ams(mad,ams)


#otra manera de hacerlo en la que las funciones setdiff nos muestran directamente los deportes que hay en una ciudad y no en la otra
ciudad_amsterdam<-filter(act_new, ciudad=="Europe/Amsterdam")
ciudad_madrid<-filter(act_new, ciudad=="Europe/Madrid")

resumen_amsterdam<-summary(ciudad_amsterdam$tipo)
resumen_madrid<-summary(ciudad_madrid$tipo)

setdiff(ciudad_amsterdam$tipo, ciudad_madrid$tipo)#deportes que se practican en Amsterdam y no en Madrid
setdiff(ciudad_madrid$tipo, ciudad_amsterdam$tipo)#deportes que se practican en Mdrid y no en Amsterdam


#Graficos
plot(ciudad_amsterdam$tipo, main = "Amsterdam") 
plot(ciudad_madrid$tipo, main = "Madrid") 



#8. Encontrar las fechas en las que se ha practicado bicicleta o pilates en Amsterdam en el año 2019
#usar filter 

fechas_amsterdam<-filter(ciudad_amsterdam, tipo=="Cycling" | tipo=="Pilates")
 
 
 
#9. Crear una nueva variable dif con los minutos de realizaci?n de cada actividad en Amsterdam
# y realizar una representaci?n gr?fica de los resultados con plot y determinar que deporte o deportes
# se han practicado durante dos horas o mas
#usar filter

ciudad_amsterdam<-mutate(ciudad_amsterdam, dif=a-de)#con mutate añadimos informacion a nuestro dataframe incluyendo los minutos
ciudad_madrid<-mutate(ciudad_madrid, dif=a-de)

minutos_amsterdam<-ciudad_amsterdam%>% #se concatenan instrucciones y se agrupan por tipo de actividad
  group_by(tipo) %>%
  summarize(tiempo=as.integer(sum(dif)))# y se suman todos los minutos de cada tipo

#Grafico de barras.
library(ggplot2)
ggplot(minutos_amsterdam, aes(x=tipo, y=tiempo))+ #mediante este grafico vemos la relacion entre el tiempo y el deporte, y se observa que la actividad mas representativa es walking
  geom_bar(stat="identity")+
  xlab("Deporte")+
  ylab("Tiempo")




#10. Guardar el nuevo dataset en un archivo llamado  "act_new.csv"

write.csv(ciudad_amsterdam, file="ciudad_amsterdam.csv")#guardamos en csv
write.csv(ciudad_madrid, file="ciudad_madrid.csv")


#-------------------------------
#-----SEGUNDA PARTE-------------
# 11. Cargar el dataset sleep en un objeto llamado sleep


sleep<-read_csv("~/Desktop/R/practica 4/sleep.csv")


#12. crear un nuevo data set llamado sleep_new que contenga solo las variables
#que contengan informaci?n, que no sean todo cero.

sleep_new<-select(sleep, 1,2,3,4,6,7,8,9)#eliminamos las columns que contienen 0




#13. Renombrar las variables de sleep_new a nombres cortos:

names(sleep_new)
sleep_new<-rename(sleep_new, "ligero"="ligero (s)", "profundo"="profundo (s)", "despierto"="despierto (s)","DTS"="Duration to sleep (s)","DTWU"="Duration to wake up (s)")

#14. Eliminar todas las filas que contengan alg?n NA#lo hacemos porque vamos a categorizar estos datos como datos atipicos, si hay un NA nos cargamos el registro entero da ogual donde este

sleep_new_2 <-na.omit(sleep_new)#eliminamos los NA



# 15. Calcular cuanto tiempo en total se ha dormido cada noche: ligero+profundo

sleep_new_2<-mutate(sleep_new_2, total= ligero+profundo)#añadimos informacion a nuestro dataframe añadiendo la columan de total


# 16. Visualizacion de la relacion ligero-profundo-total#tres graficos: ligero-profundo,ligero-total,profundo-total
ggplot(sleep_new_2, aes(x=profundo, y=ligero))+
  geom_bar(stat="identity")+
  xlab("Profundo")+
  ylab("Ligero")



ggplot(sleep_new_2, aes(x=total, y=ligero))+
  geom_bar(stat="identity")+
  xlab("Total")+
  ylab("Ligero")




ggplot(sleep_new_2, aes(x=total, y=profundo))+
  geom_bar(stat="identity")+
  xlab("Total")+
  ylab("Profundo")




# A la vista de los resultados, que tipo de sue?o es mas relevante?#si suele dormir mas tiempo profundo o mas tiempo ligero

#Basandonos en la relacion con respecto al total podemos apreciar como el sueño profundo es mas representativo.


# 17. Realizar un analisis de diferencias entre los dos tipos de sue?o e interpretar los resultados
# usar la funci?n ICalpha o el 'One sample t-test' de TeachingDemos: t.test()#ejecutando estas fiunciones nos va adevolver un intervalo de la confianza para las emdias si nos devuelve un 0 es que no hay diferencias entre        

library(TeachingDemos)
t.test(x = ((sleep_new_2$profundo) - (sleep_new_2$ligero)), mu=0) #acepta la hipotesis alternativa ya que el p-valor es menor que el nivel de significacion por tanto si existen diferencias

#18. Crear una nueva variable 'ciudad' en sleep_new con la informacion de act_new.#un for que recorra toda la columna de sleep coja la fecha y que detecte si está y coincide con activities y si es así que return la ciudad

sleep_new_2$ciudad<-NA #se crea en el dataframe de sleep_new una nueva columna con el nombre de ciudad
activities$a<- as.Date(activities$a) #convertimos a fecha los datos de "a" en cada caso para deshacernos de las horas minutos y segundos
sleep_new_2$a <- as.Date(sleep_new_2$a)
for(i in 1:length(sleep_new_2$a)){  #y hacemos el bucle que nos recorra las fechas de actividades para que cuando coincida con la fecha de sleep, copie el dato de ciudad y lo incorpore en la columna de ciudad de sleep 
  for (j in 1:length(activities$a)) {
    if (sleep_new_2$a[i] == activities$a [j]){
      sleep_new_2$ciudad[i]<-activities$Timezone [j]
    } 
  }}




#19. Representar la relaci?n totalsleep y profundo usando como facetas el factor ciudad#asi veo en cada ciudad como es la relacion entre el sueño total y el sueño profundo

ggplot(data=sleep_new_2) + geom_point(mapping = aes(x= total, y = profundo, color = ciudad))




#20. Guardar el dataset sleep_new en un archivo "sleep_new.csv"

write.csv(sleep_new_2, file="sleep_new_2.csv")

#21. Guardar el proyecto completo. Subir la carpeta del proyecto al campus.







