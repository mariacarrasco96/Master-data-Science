#Apartado A  #En este primer apartado, subimos la tabla para trabajar con ella desde el workspace. Tras esto, se calcula el total de alumnos y la media del examen de junio sin contar los presentados.

alumnos<-data.frame(calificaciones_ECO_2019_3)
alumnos_total<-length(alumnos$NOMBRE.ALUMNO) #para el total de alumnos
alumnos_total

mean(alumnos$Ex..JUNIO.12P,na.rm=TRUE)/100 #hay que dividir entre 100 para que de un resultado sobre 10


#Apartado B #se cogen solo los datos que queremos de la tabla que son los que hayan asistido a menos de un 50%de las clases y q hayan sacado mas de un 5 en el examen de junio
aprobadosasist<-alumnos[,c(1,7,8)]#se cogen las columnas 
aprobadosasist<-subset(aprobadosasist, aprobadosasist$Asistencia..1P<50&aprobadosasist$Ex..JUNIO.12P>=500)#subset hace un subconjunto con las condiciones impuestas
print(aprobadosasist)

#Apartado C #se ejecutan distintos bucles con sus respectivas restricciones y se completa la tabla alumnos
for(i in 1:length(alumnos$NOMBRE.ALUMNO)){
  if(alumnos$Nota_FINAL[i]>=500&alumnos$Nota_FINAL[i]<=699){
    alumnos$CALIFICACION[i]<-"Aprobado"
    
  }
  
} 

for(i in 1:length(alumnos$NOMBRE.ALUMNO)){
  if(alumnos$Nota_FINAL[i]>=700&alumnos$Nota_FINAL[i]<=899){
    alumnos$CALIFICACION[i]<-"Notable"
    
  }
  
}

for(i in 1:length(alumnos$NOMBRE.ALUMNO)){
  if(alumnos$Nota_FINAL[i]>=900&alumnos$Nota_FINAL[i]<=1000)
  alumnos$CALIFICACION[i]<-"Sobresaliente"
}

for(i in 1:length(alumnos$NOMBRE.ALUMNO)){ #este bucle se ejecuta para eliminar los NA de la tabla y que quede mas uniforme
  if(alumnos$Nota_FINAL[i]>=0&alumnos$Nota_FINAL[i]<=499)
    alumnos$CALIFICACION[i]<-"Suspenso"
}


alumnos$Nota_FINAL<- alumnos$Nota_FINAL/100#para tener la nota sobre 10 hay q dividir entre 100

#Apartado D

write.csv(alumnos, file =  "calificaciones ECO 2019-3.csv", row.names = FALSE)#se guardan todos los cambios realizadso en mi archivo csv

