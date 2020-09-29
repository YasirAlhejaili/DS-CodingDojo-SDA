# Section 3.2 #
library(tidyverse)

mpg
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# Section 3.2 exercise #

ggplot(data = mpg) # Q 1 :What do you see? , Ans : Nothing #
                   # Q 2 : How many columns? , Ans : 11 #
                   # Q 3 : What does the drv variable describe? , Ans : the type of drive train, f = front-wheel, r = rear wheel, 4 = 4wd #
                   # Q 4 : Make a scatterplot of hwy vs cyl , Ans : #

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = hwy, y = cyl))  
                   # Q 5 : What happens if you make a scatterplot of class vs drv? #
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = drv))

# Section 3.3 #

# Using color to class #
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

# Using size to class #
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

# Using alpha to class #
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# Using shape to class #
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

# Using blue color to all the graph #
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

# Section 3.3 exercise #
                   # Q 1 : Why are the points not blue? , Ans : There is no culomn named "blue" #  
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))

                   # Q 2 :  Map a continuous variable to color, size, and shape , Ans : #
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = hwy))
                   # Q 3 : What happens if you map the same variable to multiple aesthetics? , Ans : worked #
# using stroke aesthetic #
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, stroke = hwy))
                   # Q 4 : What happens if you map an aesthetic to something other than a variable name ? , Ans : True an False #
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = displ < 5))


# Section 3.4 #
# moving + to the write place #
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))


# Section 3.5 #
# To facet your plot by a single variable #
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

# To facet your plot by a two variable #
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)


# Section 3.5 exercise #

                   # Q 1 : What happens if you facet on a continuous variable? , Ans : a lot of windows #
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ hwy, nrow = 2)
                   # Q 2 : What do the empty cells in plot with facet_grid(drv ~ cyl) mean? , Ans : No mach in disple and hwy #
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)
                   # Q 3 : What does . do? , Ans : To do virtocal or herozantal #
# Take the first faceted # 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
                   # Q 3 : the advantages to using faceting instead of the colour aesthetic? , Ans : To look at specific column #
                   # Q 4 : the disadvantages ? , Ans : not seeing all the graph #
                   # Q 5 : How might the balance change if you had a larger dataset? , Ans : faceting will be more useful #
                   # Q 6 : What does nrow do? , Ans : Number of rows #
                   # Q 7 : What does ncol do? , Ans : Number of columns #
                   # Q 8 : What other options control the layout of the individual panels? , Ans : switch #
                   # Q 9 : Why doesn’t facet_grid() have nrow and ncol arguments? , Ans : facet_grid() forms a matrix of panels  #
                   # Q 10 : When using facet_grid() you should usually put the variable with more unique levels in the columns. Why? , Ans : because it is matrix #


# Section 3.6 #

# geom_point #
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# geom_smooth #
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

# separates the cars into three lines based on their drv value #
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

######
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE
  )

# To display multiple geoms in the same plot #
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

#  display different aesthetics in different layers #
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()

# The local data argument in geom_smooth() overrides the global data argument in ggplot() for that layer only #
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)


# Section 3.6 exercise #

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

                 # Q 1 : What does the se argument to geom_smooth() do? , Ans : Display confidence interval around smooth #
                 # Q 2 : Will these two graphs look different? Why/why not? Ans : Wirten in diffrent ways but same output #
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))

# Section 3.7 #

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

# you can recreate the previous plot using stat_count() instead of geom_bar() #
ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut))

######
demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)

ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")

# display a bar chart of proportion, rather than count #

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1))

# draw greater attention to the statistical transformation #

ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )
#> Warning: `fun.y` is deprecated. Use `fun` instead.
#> Warning: `fun.ymin` is deprecated. Use `fun.min` instead.
#> Warning: `fun.ymax` is deprecated. Use `fun.max` instead.

# Section 3.7 exercise #

                       # Q 1 : What is the default geom associated with stat_summary()? , Ans : "pointrange" #
                       # Q 2 : What does geom_col() do? How is it different to geom_bar()? , Ans : Use geom_col() if you want heights of the bars , geom_bar() height of the bar proportional to the number of cases #
                       

# Section 3.8 #

# You can colour a bar chart using either the colour aesthetic, or, more usefully, fill #
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, colour = cut))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))

# Each colored rectangle represents a combination of cut and clarity #

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))
# position = "identity" will place each object exactly where it falls in the context of the graph.  #
# To see that overlapping we either need to make the bars slightly transparent by setting alpha to a small value, or completely transparent by setting fill = NA #
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(alpha = 1/5, position = "identity")
ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(fill = NA, position = "identity")

# This makes it easier to compare proportions across groups #
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

# position = "dodge" places overlapping objects directly beside one another #
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

# position = "jitter" adds a small amount of random noise to each point #
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")


# Section 3.8 exercise #


ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point()

                       # Q 1 : How to improve the code ? , Ans : Adding new things
                       # Q 2 : What parameters to geom_jitter() control the amount of jittering ? , Ans : x , y #
                       # Q 3 : Compare and contrast geom_jitter() with geom_count() , Ans : geom_jitter adds a small amount of random variation to the location of each point, geom_count counts the number of observations at each location #
                       # Q 4 : What’s the default position adjustment for geom_boxplot()? , Ans : dodge2 #
                       # Q 5 : Create a visualisation of the mpg dataset that demonstrates it , Ans : #
ggplot(data = mpg) + 
  geom_boxplot(mapping = aes(x = displ, y = hwy))


