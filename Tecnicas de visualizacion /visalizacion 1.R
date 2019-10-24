#usar siempre standard UTF8, para las tildes etc standard de caracteres.#file-reopen with encoding

library(ggplot2)


mpg
mtcars

####ggplot2::####accedes a lo que quieras sin tener que cargar toda la libreria

#forma clasica ggplot: ggplot(datos, aes())


ggplot(mpg, aes(class)) + geom_bar()#geom_bar es para poner graficas, cosas geometricas
#el aes tiene un orden de parametros que si lo siogues no tienes por que poner el nombre
#el aesthetic es la relacion entre x e y
nlfunction <- function(calamar) (calamar + 2)

nlfunction(calamar=5)

ggplot(mpg, aes(class)) + geom_point()#te esta diciendo que te falta el eje y
ggplot(mpg, aes(x=class, y= displ)) + geom_point()

ggplot(mpg, aes(x=class, y= displ)) + geom_point()
ggplot(mpg, aes(x=cty, y=displ)) + geom_point(aes(colour = class, size= hwy))
ggplot(mpg, aes(x=cty, y=displ)) + geom_point(colour = "pink")


ggplot(mpg, aes(x=cty)) +   #pones los comunes, en la x hay elementos que son comunes a diferencia de la y
  geom_bar(fill="grey") +   #fill va fuera porque es una cte no va dentro del aes
  geom_point(aes(y = displ, color = class, size = hwy))

#facet divide la grafica en facetas

ggplot(mpg, aes(x=cty, y=displ)) +
  geom_point() +
  facet_grid(~year)
library(plotly)
migrafica <- ggplot(mpg, aes(x = cty)) +
  geom_bar(fill = "Grey") + 
  geom_point( aes (y = displ, color = class , size = hwy)) + 
  facet_grid(.~ year)

ggplotly(migrafica)

library(shiny)
#padre(hijo(), otrohijo(unnieto(unbiznieto(),....)))#para hermano pones otro hijo, a los hermanos los separan las comas
#padre(
#  hijo(
#    nieto(
      
#    ),
# )
#)

shinyUI(
fluidPage(
 titlePanel(),
 sidebarLayout(
   sidebarPanel(),
   mainPanel()
 )
  
  
  
   
)
  )
  
  
  




