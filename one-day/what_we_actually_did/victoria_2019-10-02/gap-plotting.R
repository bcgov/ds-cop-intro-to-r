# load libraries
library(readr)

# install.packages("ggplot2")
library(ggplot2)

# load data
gapminder <- read_csv("data/gapminder_data.csv")

# make some quick plots
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

# make a plot of life expectancy over time?
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp)) +
  geom_point()

# colour aes
ggplot(data = gapminder,
       mapping = aes(x = year, y = lifeExp, colour = continent)) +
  geom_point()

# change geom to line
ggplot(data = gapminder,
       mapping = aes(x = year, y = lifeExp, colour = continent, group = country)) +
  geom_line()

# use geom line + points
ggplot(data = gapminder,
       mapping = aes(x = year, y = lifeExp, colour = continent, group = country)) +
  geom_line() + geom_point()

# colour lines, black points - point on top
ggplot(data = gapminder,
       mapping = aes(x = year, y = lifeExp, group = country)) +
  geom_line(mapping = aes(colour = continent)) + geom_point()

# colour lines, black points - lines on top
ggplot(data = gapminder,
       mapping = aes(x = year, y = lifeExp, group = country)) +
  geom_point() +
  geom_line(mapping = aes(colour = continent)) 

# make all lines blue
ggplot(data = gapminder,
       mapping = aes(x = year, y = lifeExp, group = country)) +
  geom_point() +
  geom_line(colour = "blue")

# using alpha
ggplot(data = gapminder,
       mapping = aes(x = year, y = lifeExp, group = country)) +
  geom_point(alpha = 0.1)

# using a scale
ggplot(data = gapminder,
       mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5)

ggplot(data = gapminder,
       mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + 
  scale_x_log10()


# using lm
ggplot(data = gapminder,
       mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + 
  scale_x_log10() + # Andy told me to scale the x axis
  geom_smooth(method = "lm")


# change smooth line to pink
ggplot(data = gapminder,
       mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + 
  scale_x_log10() + # Andy told me to scale the x axis
  geom_smooth(method = "lm", colour = "pink")


# subset gapminder data - we want Asia and Oceania continents

asia_oceania <- gapminder[gapminder$continent %in% c("Asia", "Oceania"), ]

# plot facets
ggplot(data = asia_oceania, mapping = aes(x = year, y = lifeExp)) +
  geom_line() +
  facet_wrap( ~ country)


# customization
ggplot(data = asia_oceania, mapping = aes(x = year, y = lifeExp)) +
  geom_line() +
  facet_wrap( ~ country) +
  labs(x = "Year",
       y = "Life Expectancy",
       title = "My first facet plot") +
  theme(axis.text.x = element_text(angle = 90))

# export plot
my_plot <- ggplot(data = asia_oceania, mapping = aes(x = year, y = lifeExp)) +
  geom_line() +
  facet_wrap( ~ country) +
  labs(x = "Year",
       y = "Life Expectancy",
       title = "My first facet plot") +
  theme(axis.text.x = element_text(angle = 90))

# wide screen tv size
ggsave(filename = "my_plot_widetv.png", plot = my_plot, width = 13.33, height = 7.5)

# a smaller size
ggsave(filename = "my_plot_smaller.png", plot = my_plot,
       width = 6, height = 4, )







































































































