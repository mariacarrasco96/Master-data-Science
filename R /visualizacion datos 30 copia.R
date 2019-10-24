library(tidyverse)
mpg
data#solo aparace la funcion ene l workspace
mpg
help(mpg)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x=drv, y=cyl, color=class)) + #se ejecuta ahora sin el facet grid:traccion central es el q mas tiene cuatro tipos de cilindros
  facet_grid(drv~cyl)


ggplot(data = mpg) + 
  geom_point(mapping = aes(x=drv, y=cyl, color=class)) + #se ejecuta ahora sin el facet grid:traccion central es el q mas tiene cuatro tipos de cilindros
  facet_grid(drv~.)#este te lo pone por filas, para poner la ondita es opt+ñ


ggplot(data = mpg) + 
  geom_point(mapping = aes(x=drv, y=cyl, color=class)) + #se ejecuta ahora sin el facet grid:traccion central es el q mas tiene cuatro tipos de cilindros
  facet_grid(.~drv)#este te lo pone por columnas

#se hace lo mismo con los cilindros como no hay 7 cilindros el 7 se lo salta y se categoriza por los valores de esa varibale como si fuera un factor no es numerico sino un valor enumerado: clase cinco, clase seis..

ggplot(data = mpg) + 
  geom_point(mapping = aes(x=drv, y=cyl, color=class)) + #se ejecuta ahora sin el facet grid:traccion central es el q mas tiene cuatro tipos de cilindros
  facet_grid(cyl~.)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x=drv, y=cyl, color=class)) + #se ejecuta ahora sin el facet grid:traccion central es el q mas tiene cuatro tipos de cilindros
  facet_grid(.~cyl)#ahora salen por columnas

ggplot(data = mpg)+
  geom_smooth(mapping = aes(x=displ, y=hwy, linetype=drv))

ggplot(data = mpg)+
  geom_smooth(mapping = aes(x=displ, y=hwy, color=class))#diferencia entre la variabilidad, en la linea roja la banda es mas ancha que en la verde?

ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+
  geom_point(mapping = aes(color = class)) + 
  geom_smooth() #los cohes rojos q son los ultimos puntos de la grafica, son coches muy escasos y lo que hacen es 

tibble
flights
data(flights)
flights

filter(flights,month==1,day==1)
jan1<-filter(flights,month==1,day==1)
filter(flights, month==11 | month==12)
nov_dec<- filter(flights, month==11 | month==12)
filter(flights, !(arr_delay> 120 |dep_delay>120))
#falta la otra que son dos fromas de decir lo mismo

NA=NA


#Exercise 14:# los datos estan por minutos#jordi pagina web#libreria nos tenemos que adaptar a las funciones de la libreria

#A
filter(flights, arr_delay>=120)

#B
filter(flights, dest=="IAH" | dest=="HOU")

#C
help(flights)

#D:
filter(flights, month>=7 & month<=9)

#E
filter(flights, arr_delay>=120, dep_delay<=0)

#F
filter(flights, dep_delay>=60, dep_delay-arr_delay>30)

#G
filter(flights, dep_time>=2400 | dep_time>=000,dep_time<=600)

#2
filter(flights, between(dep_time, 000, 600))

#3
is.na(flights$dep_time)
sum(is.na(flights$dep_time))

#4
na|TRUE#true es el conjunto total , la union entre el conjunto universal sigues teniendo conjunto universal#al todo unir algo mas
FALSE&NA#false es como si fuera el conjunto vacio y la y es la interseccion#intersecar a la anda algo mas pues da nada
NA^0#regla matematica cualquier numero elevado a 0 es 1
#tambien se usa -inf y +inf pero el prgrama no lo puede procesar
NA*0#contralogica de lo anterior


flights_sml<-select(flights,year:day,ends_with("delay"),distance,air_time)
mutate(flights_sml,gain=arr_delay-dep_delay,speed=distance/air_time*60)

(flights$air_time-(flights$arr_time-flights$dep_time))#ejercicio 2 de data transformation#si estan en la misma unidad de medida lo normal es que nos salieran pequeños, pero estan en distintas unidades de medida unos en minutos otros en segundos.. no merece la pena hacerlo



  