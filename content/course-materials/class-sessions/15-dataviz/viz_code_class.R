

library(tidyverse)

# read in the data

# bites<-read_csv("./-------")
# bigfoot<-read_csv("./-------")


# We will first make a bar chart, then a scatter plot.

# bar chart ---------------------------------------------------------------

bites10<-bites_summary %>% sample_n(10)

# to reorder the bars

bites10<-
  bites10 %>%
  arrange(bites) %>%    # First sort by val. This sort the dataframe but NOT the factor levels. Arraange will go from low to high. to go from high to low use arrange(desc())
  mutate(breed=factor(breed, levels=breed)) 



# MAPPING
barplot <- ggplot(data = bites10, 
                mapping = aes(x=breed, y=bites))


# GEOM
barplot <- barplot + geom_bar(stat = "identity", # use this when your df is a summary of the values for each category
                            width=1,      # width of the bars
                            color="black", # outline of the bars
                            fill="black") # color of the bars

# Coordinates and Scales

barplot<-barplot+
  scale_y_continuous(breaks=seq(0,1000,50))

# LABELS AND GUIDES 

barplot <- barplot+
  labs(x="Breed",
       y="No. of bites",
       title="Bites by Dog Breed")
  
# 
# This is the basics but still kinda ugly, so lets choose a "theme"
# https://ggplot2.tidyverse.org/reference/ggtheme.html
# I like theme classic

barplot<-barplot+
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
  
barplot
    
    
    



#  scatter plot -----------------------------------------------------------

bigfoot$year<-as.integer(bigfoot$year)
# MAPPING
scatter <- ggplot(data = bigfoot, 
                  mapping = aes(x=year, y=sightings))
  


# GEOM
scatter <- scatter + geom_point(color="black", # the stroke color, the circle outline
                                fill="black", #color of the circle inner part
                                shape=20 # shape of the marker
                                # alpha=1, # circle transparency, [0->1], 0 is fully transparent
                                # size=0, # circle size
                                # stroke = 1 # the stroke width
                                )


# if you want to add a regression line

scatter <- scatter + 
  # stat_smooth(method = "lm",
  stat_smooth(method = "loess",
              formula = y ~ x,
              geom = "smooth",
              color="red", 
              linetype="dashed", 
              size=1.5)
  
# Coordinates and Scales

scatter<-scatter+
  scale_y_continuous(breaks=seq(0,300,20))

# LABELS AND GUIDES 

scatter <- scatter+
  labs(x="year",
       y="Sightings",
       title="Annual Bigfoot Sightings")



scatter<-scatter+
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


