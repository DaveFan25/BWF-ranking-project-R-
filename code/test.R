install.packages('tidyverse')
install.packages('ggplot2')
install.packages('readr')

library(tidyverse)
library(ggplot2)
library(readr)

setwd('C:/Users/Dave/Documents/BWF ranking project/data')
bwf_df <- read.csv('bwf_ranking.csv')
shi_yu_qi_data <- bwf_df %>% 
  filter(player == "Shi Yu Qi")
print(shi_yu_qi_data %>%
        select(rank, player, points, tournaments, country))
top10_players <- bwf_df %>%
  arrange(desc(points)) %>%
  slice(1:10)
ggplot(top10_players, aes(x = reorder(player, points), y = points, fill = country)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Top 10 BWF Men's Singles Players by Points",
       x = "Player", y = "Ranking Points") +
  theme_minimal() +
  theme(legend.position = "bottom")
