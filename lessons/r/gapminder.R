# Load gapminder data
gapminder <- read.table(url("https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv"),
                        sep = ",", header=TRUE)


# Convert character strings to factors
gapminder$continent <- as.factor(gapminder$continent)
gapminder$country <- as.factor(gapminder$country)

# Plot GDP per capita against life expectancy
p1 <- ggplot(data=gapminder, aes(x=lifeExp, y=gdpPercap, color=continent))
p1 <- p1 + geom_line(aes(group=country), alpha=0.2) + geom_point(alpha=0.2)
p1 + scale_y_log10() + geom_density2d(color="purple")

# Plot life expectancy against time
p2 <- ggplot(data=gapminder, aes(x=year, y=lifeExp,
                                 colour=continent, group=country))
p2 + geom_line() + scale_y_log10() + facet_wrap(~continent)

# Plot GDP per capita against population
gapminder %>% ggplot(aes(x=pop, y=gdpPercap)) +
  geom_point(alpha=0.7, aes(color=continent)) +
  scale_x_log10() + scale_y_log10() +
  geom_density2d(alpha=0.5) + facet_wrap(~year)

# Find average life expectancy by nation
avg_lifexp_country <- gapminder %>%
  group_by(country) %>%
  summarize(meanlifeExp = mean(lifeExp))

# Calculate observations per continent in 2002
gapminder %>% filter(year == 2002) %>%
  count(continent, sort = TRUE)

# Calculate standard error of life expectancy per continent
gapminder %>% group_by(continent) %>%
  summarise(se_lifeExp = sd(lifeExp)/sqrt(n()))

# Calculate GDP in billions of dollars
gdp_bill <- gapminder %>%
  mutate(gdpBillion = gdpPercap * pop / 1e9)
