library(tidyverse)
data("diamonds")
library(hexbin)
ggplot(diamonds,aes(carat,price))+ #sirve para pintar cosas con la base de datos que hayamos cargadgeom_hex()
geom_hex() 
ggsave("diamonds.jpg") #se puede guardar en pdf o jpg
write_csv(diamonds, "diamonds.csv")

#ejercicio
minota <- function(a,p,e) {
 nota<- a*.1 + p*4 + e*.5
 if(e<5)
   return(min(4,nota))
 else
   return(nota)
}
minota(10,10,10)
minota(10,10,4)
minota(5,5,5)
minota(5,5,4)
minota(p=7,e=5)
minota(0,7,5)

nombres<-c("Maria", "Marta", "Javier","Alvaro", "Beltrán") 
  nota_calculada<-c(4.5, 6, 7.3, 2.5, 5.6)
  nota_definitiva<-c(4, 4, 7.3, 2.5, 4)
  notas_alumnos<-data.frame(nombres,nota_calculada,nota_definitiva)
  
  #mal
  
  no_superan<-function(notas_alumnos){
    p=0#se pone el copntador a 0 y a pàrtir de ahi creamos nuestro bucle
    for(a in 1: length)(notas_alumnos(nombres)) { #desde el principio se empieza, 1, dentro del data framde vamos a los nombres
      if (nota_calculada[i]!=nota_definitiva[i]) p=p+1
    }
  }
  
  #bien
     
  no_superan<-function(notas_alumnos){ #hecho bien
    p=0
    for(i in 1:as.integer(length(notas_alumnos$nombres))){#para esta lista...
    if(nota_calculada[i]!=nota_definitiva[i]|nota_definitiva[i]<5){ #condicion | es o
    p<-p+1
    print(notas_alumnos$nombres[i])  
    }
    }
  }
no_superan(notas_alumnos)
  
  
  
       
