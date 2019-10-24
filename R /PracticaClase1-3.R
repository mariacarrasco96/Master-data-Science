# Individual work with  DATA FRAME

#1. Creating a new data frame
edad <- c(22, 34, 29, 25, 30, 33, 31, 27, 25, 25) #Se asignan valores a la variable edad
tiempo <- c(14.21, 10.36, 11.89, 13.81, 12.03, 10.99, 12.48, 13.37, 12.29, 11.92)#Se asignan valores a la variable tiempo
sexo <- c("M","H","H","M","M","H","M","M","H","H")#Se asignan valores a la variable sexo.
misDatos <- data.frame(edad,tiempo,sexo)#Se crea mediante una tabla bidimensional un registro de datos de cada variable.
misDatos#Se ejecuta directamente la tabla creada anteriormente.
rm(list=c("edad","tiempo","sexo"))#Sirve para eliminar los valores creados anteriormente para trabajar con mis datos, de esta manera no perdemos memoria.
str(misDatos)    # Estructura de 'misDatos'
names(misDatos)  # Nombre de las variables contenidas en 'misDatos'
#2. Checking variables and data within the data frame
misDatos[3:6,]#Muestra los datos creados mediante mis datos del alumno 3 al 6.
misDatos[,1] #Muestra los datos de la primera columna que se corresponde con edad.
misDatos$edad#Muestra los datos de la primera columna la cual se denomina edad. Se pueden observar los mismos datos que en la fila 13, pero se ejecuta de distinta manera.
misDatos[,"edad"]#Muestra los datos de la columna edad la cual se corresponde con la 1. Se observan los mismos datos que en la columna 13 y 14 pero se ejecutan de distinta manera.

#3. Some operations 
mean(misDatos[,1])#Calcula la media de la primera columna la cual es edad.
mean(misDatos$edad)
mean(misDatos[,"edad"])#
mean(misDatos[["edad"]])
#4. Functions ATTACH and DETACH
attach(misDatos)#Trabaja con los valores creados en un primer lugar en el workspace sin embargo al haber creado mis datos, trabaja directamente con estos.
table(tiempo)# Muestra las frecuencias absolutas de tiempo.
table(sexo)#Muestra las frecuencias absolutas de sexo.  
table(edad)#Muestra las frecuencias absolutas de edad.
table(sexo,edad)#Muestra las frecuencias absolutas de sexo,edad.
mean(edad[sexo=="M"])#Muestra la media de la edad de las mujeres.
mean(edad[sexo=="H"])#Muestra la media de la edad de los hombres.
detach(misDatos)#A partir de ahora hay que especificar a que datos nos referimos en las instrucciones

#5. New dataframe 'currencies' store some currencies
currencies <- data.frame(amount=c(1,2),currency=c("Dolar", "Euro"), exchange=c(1, 0.9))#Se crea el dataframe de currencies
currencies#Se ejecuta directamente la tabla creada mediante data.frame.
Countries<-data.frame(names=c("UK","Spain","Russia"),currency=c("Pound", "Euro", "Rublo"), exchange=c(1.2, 1, 0.02))#Se crea el dataframe de countries.
attach(currencies) #Al realizar attach currencies mira directamente los valores en currencies. 
currency#Aparece la currency del data frame currencies los cuales son euro y dolar.          
attach(Countries)  #  'detach' to  'currencies' in common fields
currency          # from Countries
exchange #Muestra el exchange del dataframe de countries al haber realizado attach countries.         
amount   # from currencies

detach(Countries)  #Se elimina el attach de countries y a partir de ahora tendremos que especificar de donde obtener los valores del dataframe. 
currency          # from currencies
detach(currencies) # Se elimina el attach de currencies y a partir de ahora tendremos que especificar de donde coger los valores del dataframe.
#currency          # error

#6. In short
longitud<-c(12,10,11,13,14,17)#Creamos el objeto longitud
medidas<-data.frame(longitud=c(6,4,7), peso=c(240,326,315), diametro=c(8,9,9))#Se crea el dataframe de medidas en el workspace
mean(longitud)#Se calcula la media del objeto longitud.
mean(medidas$longitud)#Se calcula la media de longitud en mi dataframe de medidas.
mean(medidas$peso)#Se calcula la media de peso en mi data frame de medidas.
mean(medidas$diametro)#Se calcula la media de diametro en mi dataframe de diametro.

attach(medidas)#Se enmascara el objeto longitud y se utilizan los valores de las variables incorporadas en el dataframe de medidas.
mean(peso)#Se obtiene la media de la variable peso en el dataframe medidas.
mean(diametro)#Se obtiene la media de la variable diametro del dataframe medidas.
mean(longitud)#Como no hemos eliminado la variable longitud de valores, primero hace la media en valores, si la hubiesemos quitado la habria hecho del dataframe medidas.
detach(medidas)#Se elimina el attach medidas y tendremos que especificar de donde coger los valores del dataframe.

# 7. Function WITH
with(medidas,{ #Creamos variables para calcular algo mostramos el rdo pero luego no lo guardamos en el workspace, lo creamos para trabajar sobr4e la marcha.
  vol=longitud*pi*(diametro/2)^2  # volume#Se crea una variable local
  dens=peso/vol               # density#Se crea una variable pero es una variable local.
  dens       # local variable                     # 
}) #Se calculan los valores de Las tres variables creadas

medidas#Ejecuta el dataframe medidas sin tener en cuenta las varibales creadas con with ya que son variables locales.
medidas$dens<-with(medidas,{ #Esta variable que no existia la creo con with
  vol=longitud*pi*(diametro/2)^2  # volume
  dens=peso/vol               #  density
  dens                          # 
})
medidas # 

#8. SUBSET#Se coge un subconjunto de mis datos del dataframe
hombres=subset(misDatos,sexo=="H")#Se crea un subconjunto de datos de los hombres.
hombres#Se ejecuta la tabla del dataframe hombres
mujeres=subset(misDatos,sexo=="M")#Se crea un subconjunto de datos de las mujeres
mujeres#Se ejecuta la tabla del dataframe de muejres

mayores=subset(misDatos,sexo=="H" & edad>30) #Se crea un subconjunto de datos con dOS RESTRICCIONES QUE SEAN HOMBRES Y A LA VEZ QUE SEAN MAYORES DE 30
mayores#Se ejecuta la tabla del dataframe de mayores

jov_habladores=subset(misDatos,sexo=="H" & edad<30 & tiempo>12)#Se crea un subconjunto de datos de jovenes habladores con la restriccion de que sean hombres menores de 30 años y con un tiempo inferior a 12.
jov_habladores

extremos=subset(misDatos,edad<25|edad>30)#Quiero el subconjunto de aquellos que tengan una edad menor de 25 o bien tengan mas de 30 años
extremos

hombres=subset(misDatos,sexo=="H", select=c(edad, tiempo))#Quiero el conjunto de los hombres y solo quiero seleccionar las variables edad y tiempo
hombres#Se ejecuta la tabla del dataframe con hombres y solo se selecciona la edad y el tiempo.


# 9. MERGE - RBIND#solo merge Muestra los datos repetidos tantas evces como aparezcan

animales1 = data.frame(animal=c("vaca","perro","rana","lagarto","mosca","jilguero"), 
                       clase=c("mamífero","mamífero","anfibio","reptil","insecto","ave"))#Se crea un dataframe de animales1
animales1#Se ejecuta la tabla del dataframe de animales
animales2 = data.frame(animal=c("atún", "cocodrilo", "gato","rana"), clase=c("pez", "reptil", "mamífero","anfibio"))#Se ejecuta el dataframe con animales 2
animales2#Se ejecuta la tabla del dataframe de animales 2
animales3 = rbind(animales1,animales2)#Junta las dos tablas de animales 1 y 2
animales3#Ejecuta dicha tabla
animales4=merge(animales1,animales2)#Muestra los datos repetidos tantas veces como aparezcan repetidos
animales4
animales5=merge(animales1,animales2,all=TRUE)#Muestra todos los datos suprimiendo las filas repetidas
animales5
superficieAnimales=data.frame(animal=c("perro","tortuga","jilguero", 
                                       "cocodrilo","vaca","lagarto","sardina"),#Nuevo dataframe
                              superficie=c("pelo","placas óseas","plumas",
                                           "escamas","pelo","escamas","escamas"))#Se crea el objeto llamado superficie
superficieAnimales
merge(animales3,superficieAnimales) # Muestra sólo los animales comunes a ambos dataframes
merge(animales3,superficieAnimales, all.x=TRUE) # Muestra todos los animales del primer dataframe.
merge(animales3,superficieAnimales, all.y=TRUE) # Muestra todos los animales del segundo dataframe.
merge(animales3,superficieAnimales, all=TRUE) # Muestra todos los animales de ambos dataframes.

# 10. sorting DATAFRAMES
ordenacion=order(animales1$animal)#Se utiliza como indices es decir para ponerlos entre corchetes. En vez de dar el orden te da las posiciones, los indices.
ordenacion  # Posiciones dentro del dataframe 'animales1' de los animales ordenados alfabéticamente
animales1=animales1[ordenacion,]  # Se reordenan las filas del dataframe animales1
animales1#Muestra la tabla anterior
animales1=animales1[order(animales1$animal),] #Cmbia el orden del objeto animales 1 
misDatos=misDatos[order(misDatos$edad,misDatos$tiempo),]#cambia el orden del objeto a misdatos
misDatos#eJECUTA O MUESTRA LA TABLA
