# Learning dplyer
# afternoon day 2 carpentry workshop March 2019

# install and load package
# install.packages("dplyr") [remove # if need to install]

# to use a package add it to the library
library(dplyr)
library(ggplot)

# how to add data 
gapminder <-read.csv("~/desktop/data-shell/gapminder_data.csv")

# to show whole file
gapminder
# to show first 6 rows
head(gapminder)

#choosing specific columns
# a pipe [|] in R is %>%
gap_yr_gdp<-gapminder %>% select(year,gdpPercap)
head(gap_yr_gdp)

year_country_gdp_africa <- gapminder %>% filter(continent=="Africa") %>% select(lifeExp, country, year)
year_country_gdp_africa

#count number of rows
nrow(year_country_gdp_africa
    )
str(year_country_gdp_africa)

#Summarizing data
gdp_bycontinents <- gapminder %>%
  group_by(continent) %>%
  summarize(mean_gdpPercap=mean(gdpPercap))
gdp_bycontinents

#mutate function
gdp_pop <- gapminder %>% mutate(gdp_billions = (gdpPercap*pop)/10^9)
head(gdp_pop)

gdp_pop_bycontinents_byyear <- gapminder %>%
  mutate(gdp_billion=gdpPercap*pop/10^9) %>%
  group_by(continent,year) %>%
  summarize(mean_gdpPercap=mean(gdpPercap),
            sd_gdpPercap=sd(gdpPercap),
            mean_pop=mean(pop),
            sd_pop=sd(pop),
            mean_gdp_billion=mean(gdp_billion),
            sd_gdp_billion=sd(gdp_billion))
gdp_pop_bycontinents_byyear_above25 <- gapminder %>%
  mutate(gdp_billion = ifelse(lifeExp > 25, gdpPercap * pop / 10^9, NA)) %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop),
            mean_gdp_billion = mean(gdp_billion),
            sd_gdp_billion = sd(gdp_billion))

# string with ggplot
gapminder %>% 
  mutate(gdp_billions = (gdpPercap*pop)/10^9) %>% 
  group_by(continent,year)%>% 
  summarise(mean_gdp_billions = mean(gdp_billions))%>% 
  ggplot(aes(x=year,y=mean_gdp_billions,color=continent)) + geom_point()

