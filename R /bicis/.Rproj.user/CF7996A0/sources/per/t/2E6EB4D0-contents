
babymales<-read.csv("~/Downloads/ontario_top_baby_names_male_1917-2016_english.csv" ,skip = 1)
getwd()
#rm(list="ontario_top_baby_names_male_1917_2016_english")
head(babymales)#muestra los valores de la tabla
tail (babymales)#muestra los últimos valores de la tabla
head(babymales,20)#muestra los 20 primeros registros
str(babymales)#nos indica la estructura de nuestros datos
max(babymales$Year)#indica elaño mas reciente en el que tenemos datos
nombresmasrecientes<-babymales[babymales$Year==max(babymales$Year),]
nrow(nombresmasrecientes)
sum(nombresmasrecientes$Frequency)
nombresmasrecientes<-nombresmasrecientes[,c("Name","Frequency")]#quita la primerA COLUMNA DE BABYMALES PORQUE REPITE MUCHAS VECES 1917 Y DA INFORMACVION REDUNDANTE
head(nombresmasrecientes,2)
nombresmasrecientes<-nombresmasrecientes[order(nombresmasrecientes$Frequency,decreasing=TRUE),]#orden de forma decreciente por frecuencia#BENJAMIN LIAM NOAH ETHAN
write.csv(nombresmasrecientes, file="nombres_populares_2016.csv")#se guarda la tabla como csv, por defecto se guarda en la carpeta del proyecto y hay que poner file y el nombre que queramos
getwd()

head(nombresmasrecientes,5)#vemos los primeros 5 resultantes
#nombre.deseado<-readline(prompt="¿que nombre quiere buscar?: ")#pide que introduzcas un nombre en la consola
nombre.deseado<-"oliver"
freq.year<-babymales[babymales$Name == toupper(nombre.deseado),#youpper es para que todo lo que escribas lo ponga en mayusucla#numero de veces que se repite el nombre quw yo deseo cada año esa es la freq
                     c("Year","Frequency")]
plot.title<-paste("Bebes llamados", toupper(nombre.deseado))
g<-plot(freq.year, main=plot.title, type='s')
