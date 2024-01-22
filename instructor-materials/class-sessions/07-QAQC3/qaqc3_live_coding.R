
# load the libraries ------------------------------------------------------

library(tidyverse)

# Load the csv file with data ---------------------------------------------

las_data<- read_csv(" ------ .csv") # you will need to add the path
# las_data <- read_csv("./instructor-materials/class-sessions/07-QAQC3/demo_datasets/las_data_viz.csv")

# Basic Summary of the columns in the df
summary(las_data)
# need to convert species to a factor
las_data$Species <- as.factor(las_data$Species)
# Summarize again
summary(las_data)
# can summarize individual columns
summary(las_data$Sepal.Length)
# can have it porvide only the mean...
mean(las_data$Sepal.Length)
# ...or median...
median(las_data$Sepal.Length)
# or even the range...
range(las_data$Sepal.Length)
# summary of factor gives the sample size of each
summary(las_data$Species)

# 
# That said, the tidy version of getting summaries is really useful and flexible
# It is easier for more complex combinations, so we will use that most of the time
# if we are looking at multiple variables

# %>% = "then" (this is the 'pipe' operator, 
# it connects multiple tidyverse commands)

# the syntax to get the mean of SepalLength is as follows: 
# "with your dataframe, then summarize the mean of column Sepal.Length"

las_data %>% 
  summarize(mean(Sepal.Length))

# you can assign the value to a new variable
mean_sl <- las_data %>% summarize(mean(Sepal.Length))
mean_sl

# You can also give the column a new name at the same time 
mean_sl <- las_data %>% summarize(mean = mean(Sepal.Length))
mean_sl

# you can also operate on multiple columns in the same command. 
# For ex, here we are getting the mean of both Sepal.Length and Petal.Length
mean_lengths <- las_data %>%
  summarize(
    mean_sl = mean(Sepal.Length),
    mean_pl = mean(Petal.Length)
  )
mean_lengths

# But recall, there were different species. All the previous measurments 
were pooling the values for the different species. How do you get the 
mean for each species? 
  
# To get the mean for a group, use the group_by command
mean_sl <- las_data %>%
  group_by(Species) %>%
  summarize(mean_sl = mean(Sepal.Length))
mean_sl

# incredibly valuable, because this is the start of a table...
# for instance, you can get the mean, sd, and range
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

# yes! get the min and the macx for each column (range is the diff of these 2)
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

# This is to do the Datasaurus comparison.
# https://cran.r-project.org/web/packages/datasauRus/vignettes/Datasaurus.html
install.packages("datasauRus")
library(datasauRus)
if(requireNamespace("dplyr")){
suppressPackageStartupMessages(library(dplyr))
datasaurus_dozen %>% 
  group_by(dataset) %>% 
  summarize(
    mean_x    = mean(x),
    mean_y    = mean(y),
    std_dev_x = sd(x),
    std_dev_y = sd(y),
    corr_x_y  = cor(x, y)
  )

if(requireNamespace("ggplot2")){
ggplot(datasaurus_dozen, aes(x = x, y = y, colour = dataset))+
  geom_point()+
  theme_classic()+
  theme(legend.position = "none")+
  facet_wrap(~dataset, ncol = 3)
}



# ALWAYS PLOT THE DATA!!!!

# histograms in base R

hist(las_data$Sepal.Length)
hist(las_data$Sepal.Width)
hist(las_data$Petal.Length)

# Box plots in base r
boxplot(las_data$Sepal.Length)
boxplot(las_data$Petal.Length)

# ALL OF THIS IS GREAT, BUT GRAPHS CAN OBSCURE PATTERNS TOO
# ALWAYS PLOT THE RAW DATA
# with correlated data, can do this really well
# VIEW A on Y, and THAT IS INCREDIBLY USEFUL

# scatterpolot in base r:  plot(x,y)
plot(las_data$Sepal.Width,las_data$Sepal.Length)
     

# BUT WE HAVE BEEN LOOKING THE WHOLE TIME WITH ALL SPECIES TOGETHER. LETS 
# LOOK AT THE PATTERN FOR ALL SPECIES SEPERATELY. 
This is much easier to do in ggplot2 (tidyverse)- 

# Here is how to do histograms in ggplot2
# https://r-graph-gallery.com/220-basic-ggplot2-histogram.html 
plot <- ggplot(las_data, 
               aes(x=Petal.Length)) + 
  geom_histogram()
plot

# easy to customize. Change the background with different "theme"
  plot <- ggplot(las_data, 
                 aes(x=Petal.Length)) + 
  geom_histogram()+
  theme_classic()
plot

# can change colors
  plot <- ggplot(las_data, 
                 aes(x=Petal.Length)) + 
  geom_histogram( binwidth=0.5, fill="red", color="black") +
  theme_classic()
plot


# different plot for different groups 
plot <- ggplot(las_data, 
                 aes(x=Petal.Length, fill=Species)) + 
  geom_histogram() +
  theme_classic()
plot


# BOOM. Finally see why that weird value set at end


# box plots in tidy
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


# scatter plots (x,y) in ggplot2
# can also look at the x y values
las_data %>% 
  ggplot(
    aes(x=Sepal.Width, y=Sepal.Length)) +
  geom_point() +
  theme_bw()

# different color points for each species

las_data %>% 
  ggplot(
    aes(x=Sepal.Width, y=Sepal.Length, color=Species)) +
  geom_point() +
  theme_bw()

# if you want to remove the "error", uncomment the code below and run it.
# las_data<-las_data %>% 
#   filter(Sepal.Length<12)
# you have filtered the data to ONLY allow values of Sepal.Length less than 12



# bigfoot data ------------------------------------------------------------



bigfoot<-read_csv("./instructor-materials/class-sessions/07-QAQC3/demo_datasets/annual_bigfoot.csv")



# complete code for plot with bigfoot data --------------------------------


#  make a scatter plot ----------------------------------------------------

# first convert year to an integer
bigfoot$year<-as.integer(bigfoot$year)
# MAPPING ggplot(....)+
# GEOM (geom_point....)

# if you want to add the options in the geom_point, don't foget to 
# add a , (comma) after each line except the last one. 
# Also, don't forget the last )

scatter <- ggplot(data = bigfoot, 
                  mapping = aes(x=year, y=sightings))+
  geom_point(color="black", # the stroke color, the circle outline
                                fill="black", #color of the circle inner part
                                shape=20 # shape of the marker
                                # alpha=1, # circle transparency, [0->1], 0 is fully transparent
                                # size=0, # circle size
                                # stroke = 1 # the stroke width
             )

# Coordinates and Scales
# take your plot named scatter, and add some scales to y axis
scatter<-scatter+
  scale_y_continuous(breaks=seq(0,300,20))

# LABELS AND GUIDES 
# add labes for axes and a title
scatter <- scatter+
  labs(x="year",
       y="Sightings",
       title="Annual Bigfoot Sightings")



# if you want to add a regression line
scatter <- scatter + 
  # stat_smooth(method = "lm",
  stat_smooth(method = "loess",
              formula = y ~ x,
              geom = "smooth",
              color="red", 
              linetype="dashed", 
              size=1.5)




# THE WHOLE THING WITH ALL SECTIONS TOGETHER ------------------------------


scatter <- ggplot(data = bigfoot, 
                  mapping = aes(x=year, y=sightings))+
  geom_point(color="black", # the stroke color, the circle outline
             fill="black", #color of the circle inner part
             shape=20 # shape of the marker
             # alpha=1, # circle transparency, [0->1], 0 is fully transparent
             # size=0, # circle size
             # stroke = 1 # the stroke width
  )+
  theme_classic()+
  theme(plot.title = element_text(face="bold", size=20,family = "Arial", colour = "black"),  
        # Sets title size, style, location
        # legend.position=c(0.5,0.95),
        axis.line.y = element_line(color="black", size = 0.5, lineend="square"),
        axis.line.x = element_line(color="black", size = 0.5, lineend="square"),
        axis.title.x=element_text(colour="black", size = 20, vjust=-0.5),           #S ets x axis title size, style, distance from axis #add , face = "bold" if you want bold
        axis.title.y=element_text(colour="black", size = 20, vjust=1.5),            #S ets y axis title size, style, distance from axis #add , face = "bold" if you want bold
        axis.text.x=element_text(colour="black", size = 16, angle = 45, vjust =0, hjust=0),                          # Sets size and style of labels on axes
        axis.text.y=element_text(colour="black", size = 16, angle = 0, vjust =0, hjust=0),                          # Sets size and style of labels on axes
        # legend.title = element_blank(),                                             # Removes the Legend title
        # legend.key = element_blank(),                                              #R emoves the boxes around legend colors
        # legend.text = element_text(face="italic", color="black", size=12),
        # legend.position = "top",
        # legend.direction = 'horizontal', 
        # legend.key = element_rect(colour = "black"),                              #s ets size and style of labels on axes
        # plot.margin = unit(c(1,2,1,1), "cm")
        plot.background = element_rect(fill = "white"),
        panel.background = element_rect(fill = "white")
  )    

scatter

 

