# learning to use ggplot
# installing a library
library("ggplot2")
48/12
42/12
ggplot(data=gapminder,aes(x=gdpPercap, y = lifeExp))+geom_point()
gapminder
gapminder <- read.csv("~/desktop/data-shell/gapminder_data.csv", header=TRUE)
gapminder
ggplot(data=gapminder,aes(x=gdpPercap, y = lifeExp))+geom_point()
ggplot(data=gapminder,aes(x=year, y = lifeExp,color=continent))+geom_point()
ggplot(data=gapminder,aes(x=year, y = lifeExp,by=country,color=continent))+geom_line()
ggplot(data=gapminder,aes(x=year, y = lifeExp,by=country,color=continent))+geom_line()+geom_point()
ggplot(data=gapminder,aes(x=year, y = lifeExp,by=country))+geom_line(aes(color=continent))+geom_point()
ggplot(data=gapminder,aes(x=year, y = lifeExp,by=country,color=continent))+geom_line(color="blue")+geom_point()
ggplot(data=gapminder,aes(x=year, y = lifeExp,by=country))+geom_point(color="red")+geom_line(color="blue")
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color=continent)) +
  geom_point()
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp,color=continent)) +
  geom_point(alpha = 0,shape=13) + scale_x_log10()+geom_smooth(method="lm", size=1.5)                                                              
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 1,shape=13, color="red") + scale_x_log10()+geom_smooth(method="lm", size=1.5)     
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp,color=continent))  + scale_x_log10()+geom_smooth(method="lm", size=1.5)  
