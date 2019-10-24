#2)Gráfica con lineas de colores
ggplot(economics_long, aes(x = date)) + 
  geom_line( aes( y = value01, color = variable))
