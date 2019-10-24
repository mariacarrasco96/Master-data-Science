library(ggplot2)
#1) Gráfica temporal
ggplot(economics, aes(x = date, y = unemploy)) + 
  geom_line()
