fibonacci<-function(n){
  if(n<1){#no se pueden numeros negativos
    return("escrine numeros enteros positivos")
  }
  if(n>0){#si n es mayor que 0 entonces..
    sfibo<-seq(0,n)#haz una secuencia de 0 a n
    for(i in 3:n){#y al llegar al tercer elemento
      sfibo[i]<-sfibo[i-1]+sfibo[i-2]#machacamos sfib[i] por la siguiente expresion para q a partir del 3 todos los numeros que vengan detras sigan la secuencia fibonacci
    }
    return(sfibo)
  }
}
  
fibonacci(20)
fibonacci(10)

nternas<-function(n) {
  if (n < 1) {
    return("Selecciona valores mayor o igual a 1")
  }
  else
  cuaternaf<-c(fibonacci(n+4))
  m<-matrix(nrow = n, ncol = 3)
  for (i in 1:n){
    v1<-cuaternaf[(i+1)]
    v2<-cuaternaf[(i+2)]
    v3<-cuaternaf[(i+3)]
    v4<-cuaternaf[(i+4)]
    a<-v1*v4
    b<-2*v2*v3
    h<-(v2*v2)+(v3*v3)
    m[i, ]<-c(a,b,h)
    
  }
  return(m)
}

nternas(6)


  


