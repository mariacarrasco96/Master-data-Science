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









  