# PROGRAMMING WITH R

### 1. Pythagoras triplets  ###

a<- 34
b<- 12
h<- 66

# Check by calculations
a*a+b*b
h*h
# Better with a function
#Con la siguiente funcion se va a comprobar si la terna es pitagorica
terna <-function (a, b, h){ #se va a crear una función de tres elementos, no es importante el tipo ni si son cadenas de caracteres. Cuando definimos una funcion son nombres abstratctos siempre se trabaja con el material que hay en el woekspace, puedee star referenciado pero solo como parametro. Ejemplo xyh
  if (a*a+b*b==h*h) {print('Yes, it is a pythagoras triplet')} #Cuerpo de la funcion, cuando yo llame a eso terna que es lo que va a pasar
  else {print(' No, this is not a p.t.')}
} # se ejecuta de la 14 a la 17.
# lets try with some examples
terna(a,b,h)
terna(3,4,5)
# 
terna(12, 34, 66)
terna(40, 9, 41)


### 2.  multiple Pythagoras triplets by brute force ###
#2.1 check all triplets with legs between 1-n
ternasenm_n<-function(n){
  t<-0 #Cuantas encuentro
  for (a in 1:n){ #PARA CUALQUIER VALOR DEL PRIMER CATETO ENTRE 1 Y N
    for (b in 1:n) { #PARA CUALQUIER VALOR DEL SEGUNDO CATETO DE ENTRE 1 Y N
      h<-sqrt(a*a+b*b) #CALCULA LA HIPOTENUSA QUE LES LA RAIZ CUADRADO DE LA SUMA DE LOS CATETOS AL CUADRADO, casi siempre numeros con decimales.
      if (h==round(h)){ #si coincide con su redondeo lo ejecuto y lo imprimo
        t<-t+1; #Al principio no tengo ninguna y luego sigo buscando
        print(c(a,b,h))}
    }
  }
  cat("hay en total", t, "ternas pitagóricas") #Cambiado, antes ponia print
}
ternasenm_n(20)
#2.2 check all triplets with legs between n-m #No queremos ni que sea muy grande pero tmpoco pequeñisimos, le metemos un oarametro mas y decimos que la a y la b comiencen teniendo el valor m como valor mas pequeño y como max el valor n
ternasenm_n<-function(m, n){
  t<-0
  for (a in m:n){
    for (b in m:n) {
      h<-sqrt(a*a+b*b)
      if (h==round(h)){ 
        t<-t+1;
        print(c(a,b,h))}
    }
  }
  print(t) #numero de estelas que ha encontrado
}
ternasenm_n(1, 20) # me saca lo mismo que antes porque lo unico que he hecho es acotarlo, es una funcion mas general ya que puedo hacer lo que hacia antes y mas cosas.
#2.3 avoiding repetitions#evitar repeticiones de una manera eficiente
ternasenm_n<-function(m, n){
t<-0
for (a in m:n){ #comienza en el valor minimo y va hasta el maximo
  for (b in a:n) { #empieza por el valor del valor anterior y acaba en el superior de esta manera se evitan las repeticiones, ya no puede tomar valores inferiores para evitar repeticiones
    h<-sqrt(a*a+b*b)
    print(c(a,b,h))
      if (h==round(h)){ 
             t<-t+1;
        print("encontrada",c(a,b,h))} #ahora te muestra todas y a las que valen las llama encontrada.
    }
  }
print(t)
}
ternasenm_n(15,15000)#ahora me salen 7 ya no me salen las repeticiones, si pongo 10,20 me sale que solo hay dos porque quita repeticiones

#3.1 Euclides equations #si yo se que hay repeticiones y van a salir lo que hago es quitr las repeticiones antes de tiempo aunque no sepa ni cuales son. asi mejoro estrategia
## this is an example
m<- 56
n<- 34
## Euclides values are:
a<-m*m-n*n#primer cateta el mas grande al cuadrado menos el menor al cuadrado, no numero negativo
b<-2*m*n #segundo catetto doble del producto
h<-m*m+n*n #suma de los catetos al cuadrado
print(c(a,b,h))

## function terna can check the values
terna(a,b,h)


#3.2 Pythagoras equations
## this is an example

k<- 87
## Pythagoras values are:
a<-k*k-1
b<-2*k
h<-k*k+1
print(c(a,b,h))
# also we can write a function for making several  triplets
ternasPyt<-function(n){
  for (k in 2:(n+1)){
  a<-k*k-1
  b<-2*k
  h<-k*k+1
  print(c(a,b,h))}
  }

ternasPyt(10)

# 4. Fibonacci series and Pythagoras triplets
# First items within the Fibonacci series
fib<-c(0,1,1,2,3,5,8,13,21,34,55,89)
#  V1 - V4 store 4 Fibonacci values in a row
v1<-89; v2<-55+89; v3<-v1+v2; v4<-v3+v2;
# now we use them to compute a new triplet:
a<- v1*v4
b<-2*v2*v3
h<-v2*v2+v3*v3
# Checking the result
terna(a,b,h)


## the end.

