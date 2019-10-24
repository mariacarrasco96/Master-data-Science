numeros<-c(7, 15, 12, 6, 0, 4, 0)

t<-0
for(i in 1:length(numeros)){
  if(numeros[i]==0){
   t<-t+1 
  }
  
}
print(t)

mimatriz<-matrix(data = numeros ,nrow=3, ncol=4)
 nceros<-0
 for(i in 1:nrow(mimatriz)){
   for(j in 1:ncol(mimatriz)){
     if(mimatriz[i,j]==0){
       nceros<-nceros+1
     }
   
    } 
     
   }
   print(nceros)
 gewd()
 