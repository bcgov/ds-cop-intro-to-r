# install.packages("reprex")

library(reprex)
library(readr)
library(dplyr)

# load data
cats <- read_csv("data/feline-data.csv")

# munge data
cats %>% 
  select(coat, weight) %>% 
  ggplot(aes(x = coat, y = weight)) +
  geom_col()
  
  
# munge data
cats %>% 
  select(coat, weight) %>% 
  ggplot(aes(x = coat, y = weight)) %>% 
  geom_col() 

dput(cats)


# install.packages("reprex")

library(reprex)
library(readr)
library(dplyr)

cat <- structure(list(coat = c("calico", "black", "tabby"), weight = c(2.1, 
5, 3.2), likes_string = c(1, 0, 1)), class = c("spec_tbl_df", 
"tbl_df", "tbl", "data.frame"), row.names = c(NA, -3L), spec = structure(list(
    cols = list(coat = structure(list(), class = c("collector_character", 
    "collector")), weight = structure(list(), class = c("collector_double", 
    "collector")), likes_string = structure(list(), class = c("collector_double", 
    "collector"))), default = structure(list(), class = c("collector_guess", 
    "collector")), skip = 1), class = "col_spec"))

# munge data
cats %>% 
  select(coat, weight) %>% 
  ggplot(aes(x = coat, y = weight)) %>% 
  geom_col()



?datasets

starwars

starwars %>% 
  select(name, height) %>% 
  ggplot(aes(x = name, y = height)) %>% 
  geom_col()



  