library(readr)
gapminder <- read_csv("data/gapminder_data.csv")


mean(gapminder$lifeExp)


install.packages("dplyr")

library(dplyr)
 
year_country_gdp <- select(gapminder, year, country, gdpPercap)

filtered_by_europe <- filter(gapminder, continent == "Europe")

gapminder %>%
  filter(continent == "Europe") %>% 
  select(year, country, gdpPercap)

## Only Africa
## Only lifeExp, country and year

gapminder %>%
  filter(continent == "Africa") %>% 
  select(lifeExp, country, year)


gapminder %>%
  select(lifeExp, country, year) %>% 
  filter(country == "Canada")

gapminder %>% 
  group_by(continent) %>% 
  summarize(mean_gdpPercap = mean(gdpPercap))

country_mean_lifeExp <- gapminder %>% 
  group_by(country) %>% 
  summarize(mean_lifeExp = mean(lifeExp)) %>% 
  filter(mean_lifeExp == min(mean_lifeExp))

## Just filter for mean
gapminder %>% 
  group_by(country) %>% 
  summarize(mean_lifeExp = mean(lifeExp)) %>% 
  filter(mean_lifeExp == min(mean_lifeExp))

## Just filter for max
gapminder %>% 
  group_by(country) %>% 
  summarize(mean_lifeExp = mean(lifeExp)) %>% 
  filter(mean_lifeExp == max(mean_lifeExp))

gapminder %>% 
  group_by(country) %>% 
  summarize(mean_lifeExp = mean(lifeExp)) %>% 
  filter(mean_lifeExp == max(mean_lifeExp) | mean_lifeExp == min(mean_lifeExp))

## Grouping by two variables
gapminder %>% 
  group_by(continent, year) %>% 
  summarise(mean_gdpPercap = mean(gdpPercap))

## Summarize by multiple grouping variable
## And summarize multiple columns
big_summary <- gapminder %>% 
  group_by(continent, year) %>% 
  summarise(mean_gdpPercap = mean(gdpPercap),
            mean_lifeExp = mean(lifeExp),
            sd_gdpPergap = sd(gdpPercap),
            mean_pop = mean(pop))

## Exporting the data
write_csv(big_summary, "big_summary.csv")


gapminder %>% 
  filter(year == 2002) %>% 
  count(continent, sort = TRUE)


gapminder %>% 
  filter(year %in% c(1998, 2002)) %>% 
  count(continent, sort = TRUE)


gapminder %>% 
  filter(year %in% c(1998, 2002)) %>% 
  group_by(continent) %>% 
  summarise(num_unique = n_distinct(country))


bigger_summary <- gapminder %>% 
  group_by(continent, year) %>% 
  summarise(mean_gdpPercap = mean(gdpPercap),
            mean_lifeExp = mean(lifeExp),
            sd_gdpPergap = sd(gdpPercap),
            mean_pop = mean(pop)) %>% 
  mutate(lifeExp_per_pop = mean_lifeExp/mean_pop) %>% 
  mutate(mean_pop_per_thousand = mean_pop/1000)


gapminder %>% 
  mutate(pop_per_thousand = pop/1000)


a_countries <- gapminder %>% 
  filter(country %in% c("Albania", "Algeria", "Australia", "Angola", "Argentina"))

library(ggplot2)

ggplot(data = a_countries, mapping = aes(x = year, y = lifeExp, colour = continent)) +
  geom_line() +
  facet_wrap(~country)

gapminder %>% 
  filter((continent == "Africa" & year > 1980) | (continent == "Europe" & year < 1979))



gapminder %>% 
  #filter(year == 2002) %>% 
  #group_by(continent) %>% 
  summarise(mean_pop = mean(pop))


dplyr::filter()

stats::filter()





































































































































