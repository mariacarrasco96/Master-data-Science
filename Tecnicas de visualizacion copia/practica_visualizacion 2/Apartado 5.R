#5)Evita overplotting usando jittering
ggplot(faithful, aes(x = eruptions, y = waiting)) + 
  geom_point(position = "jitter") + 
  geom_jitter() 
