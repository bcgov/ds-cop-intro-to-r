library(gapminder)
library(dplyr)

## A basic left join

country_codes

joined_gapminder <- gapminder %>% 
  left_join(country_codes, by =c("country"))
