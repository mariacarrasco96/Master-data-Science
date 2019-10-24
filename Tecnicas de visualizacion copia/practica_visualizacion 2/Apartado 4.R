#4)Evita overplotting usando transparencia
ggplot(faithful, aes(x = eruptions, y = waiting, alpha = 0.5)) + 
  geom_point()
