library(tidyverse)
library(readxl)
data<-read_xlsx("./class_outlines/wk3_spreadsheets/example_spreadsheets/untidy-portal-data.xlsx",skip=3)

# Select the columns that represent each plot
plot1<-select(data,1:5)
plot2<-select(data,8:12)
plot3<-select(data,14:17)

# Rename the columns and slice away the 1st row 
# add a column with plot number
# note: would be more efficient to make this a function
colnames<-slice(plot1,1)
colnames(plot1)<-tolower(colnames) # tolower makes them lower case
plot1<-slice(plot1,-1)
plot1$plot<-"plot.1"
plot1<-plot1 %>% separate(species, c("genus", "species"), " ")
# plot1<-plot1 %>% filter(!is.na(`date collected`))
# plot1$`date collected`<-as.numeric(plot1$`date collected`)
# as.Date(plot1$`date collected`, origin = "1899-12-30")

colnames<-slice(plot2,1)
colnames(plot2)<-tolower(colnames)
plot2<-slice(plot2,-1)
plot2$plot<-"plot.2"

# Turns out the dates were complicated because in different formats. I had
# originally left date conversion for last, bbut then realized needed to convert here
# because plot 1 and 2 are different date formst from plot 3
data<-bind_rows(plot1,plot2)
data$`date collected`<-as.numeric(data$`date collected`)
data$`date collected`<-as.Date(data$`date collected`, origin = "1899-12-30")



colnames<-slice(plot3,1)
colnames(plot3)<-tolower(colnames)
plot3<-slice(plot3,-1)
plot3$plot<-"plot.3"
plot3<-plot3 %>% separate(species, c("genus", "species"), " ")
# convert to date, but without the year wont recognize as date
plot3$`date collected`<-paste(plot3$`date collected`,"14",sep="/")
# note the different indicator of date format 
plot3$`date collected`<-as.Date(plot3$`date collected`,"%m/%d/%y")
# bind the plots
data<-bind_rows(data,plot3)
data<-data %>% rename('date'='date collected')
data$genus<-tolower(data$genus)

# set some types
data$weight<-as.numeric(data$weight)

# change female or male to a single letter
data<-data %>% mutate(sex=ifelse(sex=="male","m",sex))
data<-data %>% mutate(sex=ifelse(sex=="female","f",sex))
data$sex<-tolower(data$sex)
# convert species = ? to NA
data<-data %>% mutate(species=ifelse(species=="?","not_identified",species)) 
# note can't use the more common "sp" because there is a species that startts with sp 
data<-data %>% mutate(species=ifelse(species=="unknown","not_identified",species))
# Convert wieght -999 or ? to NA
data<-data %>% mutate(weight=ifelse(weight== -999, NA ,weight))
data<-data %>% mutate(weight=ifelse(weight== "?", NA ,weight))



# Add genus where missing

data<-data %>% mutate(genus=ifelse(species== "ordii","dipodomys",genus))
data<-data %>% mutate(genus=ifelse(species== "spectabilis","dipodomys",genus))
data<-data %>% mutate(genus=ifelse(species== "merriami","dipodomys",genus))


# add "notes column with relevant info
data$notes<-NA

data<-data %>% mutate(notes=ifelse(species== "ordii*","sp id uncertain",NA))
data<-data %>% mutate(species=ifelse(species== "ordii*","ordii",species))

data<-data %>% mutate(notes=ifelse(species== "not_identified","sp not identified",notes))

data<-data %>% mutate(notes=ifelse(species== "sp.","sp not identified",notes))
data<-data %>% mutate(species=ifelse(species== "sp.","not_identified",species))

# Fix shaded cells

data<-data %>% mutate(notes=ifelse((plot== "plot.2" &
                                      (weight==52 | 
                                         weight==127| 
                                         weight==157| 
                                         weight==218)),
                                   "scale not calibrated properly",notes))

# remove rows with no data
data<-data %>% filter(!is.na(date))
data<-data %>% filter(!sp.code=="NANA")


# Split date into three columns
data<-data %>% separate(date, c("year", "month","day"), "-")


# convert genus + species into a code
data$sp.code<-paste(str_sub(data$genus, 1, 2),str_sub(data$species, 1, 2), sep="")

# create taxonomy table
taxonomy<-data %>% select(family, 
                          genus,
                          species,
                          sp.code) %>% 
  mutate(family=ifelse(genus== "dipodomys","Heteromyidae",family)) %>% 
  mutate(family=ifelse(genus== "onychomys","Cricetidae",family)) %>% # I had to look up the family
  group_by(genus,species) %>%
  slice(1) %>% 
  filter(!is.na(family))

taxonomy$family<-tolower(taxonomy$family)
taxonomy$family<-as.factor(taxonomy$family)
taxonomy$genus<-as.factor(taxonomy$genus)
taxonomy$species<-as.factor(taxonomy$species)
taxonomy$sp.code<-as.factor(taxonomy$sp.code)
  
taxonomy
# Rearrange
data<-data %>% select(plot,
                      year,
                      month,
                      day,
                      sp.code,
                      weight,
                      sex,
                      notes)

# set data types
data$year<-as.integer(data$year)
data$month<-as.integer(data$month)
data$day<-as.integer(data$day)
data$sp.code<-as.factor(data$sp.code)
data$sex<-as.factor(data$sex)
data$weight<-as.numeric(data$weight)

data<-data %>% arrange(plot,
                       year,
                       month,
                       day,
                       sp.code)


view(taxonomy)
view(data)

write_csv(taxonomy,"./class_outlines/wk3_spreadsheets/example_spreadsheets/EB_tax_example.csv")
write_csv(data,"./class_outlines/wk3_spreadsheets/example_spreadsheets/EB_data_example.csv")


# what if you discover that sp. doesn't mean "species not identified", 
# but that is actually a new, undescribed species?'
# (lines 82-83)
