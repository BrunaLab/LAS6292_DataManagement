# 1. Intro slides

# 2. Load CSV file of df

las_data <- read_csv("./course-materials/class-sessions/07-QAQC3/las_data_viz.csv")



summary(las_data)
las_data$Species <- as.factor(las_data$Species)
summary(las_data)
summary(las_data$Sepal.Length)
mean(las_data$Sepal.Length)
median(las_data$Sepal.Length)
summary(las_data$Species)
range(las_data$Sepal.Length)
# las_data %>% summarize(mean(Sepal.Length))

mean_sl <- las_data %>% summarize(mean = mean(Sepal.Length))
mean_sl

mean_lengths <- las_data %>%
  summarize(
    mean_sl = mean(Sepal.Length),
    mean_pl = mean(Petal.Length)
  )
mean_lengths


mean_sl <- las_data %>%
  group_by(Species) %>%
  summarize(mean_sl = mean(Sepal.Length))
mean_sl
# (incredibly valuable, because this is the start of a table)

mean_sl <- las_data %>%
  group_by(Species) %>%
  summarize(
    mean_sl = mean(Sepal.Length),
    sd_sl = sd(Sepal.Length),
    range_sl = range(Sepal.Length)
  )
mean_sl
# huh? it adds a row to each group with the min and max. 
# this isn't very tidy, is there a better way to do this? 

mean_sl <- las_data %>%
  group_by(Species) %>%
  summarize(
    mean_sl = mean(Sepal.Length),
    sd_sl = sd(Sepal.Length),
    min_sl = min(Sepal.Length),
    max_sl = max(Sepal.Length)
  )
mean_sl

# BUT THERE IS AN ISSUE WITH JUST LOOKING AT SUMMARIES


# https://cran.r-project.org/web/packages/datasauRus/vignettes/Datasaurus.html
library(datasauRus)
# if(requireNamespace("dplyr")){
#   suppressPackageStartupMessages(library(dplyr))
datasaurus_dozen %>% 
  group_by(dataset) %>% 
  summarize(
    mean_x    = mean(x),
    mean_y    = mean(y),
    std_dev_x = sd(x),
    std_dev_y = sd(y),
    corr_x_y  = cor(x, y)
  )


# if(requireNamespace("ggplot2")){
#   library(ggplot2)
ggplot(datasaurus_dozen, aes(x = x, y = y, colour = dataset))+
  geom_point()+
  theme_classic()+
  theme(legend.position = "none")+
  facet_wrap(~dataset, ncol = 3)
# }

# 
# star<-datasaurus_dozen %>% filter(dataset=="star")
# hist(star$x)
# x_shape<-datasaurus_dozen %>% filter(dataset=="x_shape")
# hist(x_shape$x)
# 
# bullseye<-datasaurus_dozen %>% filter(dataset=="bullseye")
# hist(bullseye$x)
# hist(bullseye$y)
# plot(bullseye$x,bullseye$y)
# 
# high_lines<-datasaurus_dozen %>% filter(dataset=="high_lines")
# hist(high_lines$x)
# hist(high_lines$y)
# plot(high_lines$x,high_lines$y)
# 

#  ALWAYS PLOT THE DATA


hist(las_data$Sepal.Length)
hist(las_data$Sepal.Width)
hist(las_data$Petal.Length)

boxplot(las_data$Sepal.Length)
boxplot(las_data$Petal.Length)

# ALL OF THIS IS GREAT, BUT GRAPHS CAN OBSCURE PATTERNS TOO
# back to slides, show the same mean/sd diff dist

# ALWAYS PLOT THE RAW DATA
# with correlated data, can do this really well
# VIEW A on Y, and THAT IS INCREDIBLY USEFUL


plot(las_data$Sepal.Width,las_data$Sepal.Length)
     

# BUT WE HAVE BEEN LOOKING THE WHOLE TIME WITH ALL SPECIES TOGETHER. LETS 
# LOOK AT THE PATTERN FOR ALL SPECIES SEPERATELY. PROBLME - THIS IS HARDER TO DO
# IN BASE-R. WE NEED TO DI IT IN TIDY, AND IT IS REALLY MUCH MRE FLEXIBLE. 

# FLIP OVER TO SLIDES


# https://r-graph-gallery.com/220-basic-ggplot2-histogram.html 
plot <- ggplot(las_data, 
               aes(x=Petal.Length)) + 
  geom_histogram()
plot

# easy to customize
  plot <- ggplot(las_data, 
                 aes(x=Petal.Length)) + 
  geom_histogram()+
  theme_classic()
plot

# start customizing
  plot <- ggplot(las_data, 
                 aes(x=Petal.Length)) + 
  geom_histogram( binwidth=0.5, fill="red", color="black") +
  theme_classic()
plot


# by groups
plot <- ggplot(las_data, 
                 aes(x=Petal.Length, fill=Species)) + 
  geom_histogram() +
  theme_classic()
plot


plot <- ggplot(las_data, 
               aes(x=Petal.Length, fill=Species)) + 
  geom_histogram(color="black") +
  # geom_histogram(color="black", alpha=0.6, position = 'identity') +
  theme_classic()
plot


# BOOM. Finally see why that weird value set at end

# https://r-graph-gallery.com/boxplot.html 

las_data %>% 
  ggplot(
    aes(x=Species, y=Sepal.Length, fill=Species)) +
  geom_boxplot() +
  theme_bw()


las_data %>%
  ggplot(aes(x=Species, y=Sepal.Length, fill=Species)) +
  geom_boxplot() +
  geom_jitter(color="black", size=0.4, alpha=0.9) +
  theme_bw()


# can also look at the x y values
las_data %>% 
  ggplot(
    aes(x=Sepal.Width, y=Sepal.Length)) +
  geom_point() +
  theme_bw()


las_data %>% 
  ggplot(
    aes(x=Sepal.Width, y=Sepal.Length, color=Species)) +
  geom_point() +
  theme_bw()

las_data<-las_data %>% 
  filter(Sepal.Length<12)



 

