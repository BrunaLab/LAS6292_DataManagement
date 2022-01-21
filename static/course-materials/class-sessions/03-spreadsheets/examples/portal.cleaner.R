library(tidyverse)
library(readxl)
portal<-read_xlsx("./static/course-materials/class-sessions/03-spreadsheets/examples/untidy-portal-data.xlsx",skip=3)

# Select the columns that represent each plot
plot1<-select(portal,1:5)
plot2<-select(portal,8:12)
plot3<-select(portal,14:17)

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
portal<-bind_rows(plot1,plot2)
portal$`date collected`<-as.numeric(portal$`date collected`)
portal$`date collected`<-as.Date(portal$`date collected`, origin = "1899-12-30")



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
portal<-bind_rows(portal,plot3)
portal<-portal %>% rename('date'='date collected')
portal$genus<-tolower(portal$genus)

# set some types
portal$weight<-as.numeric(portal$weight)

# change female or male to a single letter
portal<-portal %>% mutate(sex=ifelse(sex=="male","m",sex))
portal<-portal %>% mutate(sex=ifelse(sex=="female","f",sex))
portal$sex<-tolower(portal$sex)
# convert species = ? to NA
portal<-portal %>% mutate(species=ifelse(species=="?","not_identified",species)) 
# note can't use the more common "sp" because there is a species that startts with sp 
portal<-portal %>% mutate(species=ifelse(species=="unknown","not_identified",species))
# Convert wieght -999 or ? to NA
portal<-portal %>% mutate(weight=ifelse(weight== -999, NA ,weight))
portal<-portal %>% mutate(weight=ifelse(weight== "?", NA ,weight))



# Add genus where missing

portal<-portal %>% mutate(genus=ifelse(species== "ordii","dipodomys",genus))
portal<-portal %>% mutate(genus=ifelse(species== "spectabilis","dipodomys",genus))
portal<-portal %>% mutate(genus=ifelse(species== "merriami","dipodomys",genus))


# add "notes column with relevant info
portal$notes<-NA

portal<-portal %>% mutate(notes=ifelse(species== "ordii*","sp id uncertain",NA))
portal<-portal %>% mutate(species=ifelse(species== "ordii*","ordii",species))

portal<-portal %>% mutate(notes=ifelse(species== "not_identified","sp not identified",notes))

portal<-portal %>% mutate(notes=ifelse(species== "sp.","new undescribed species",notes))
portal<-portal %>% mutate(species=ifelse(species== "sp.","sp nov",species))

# Fix shaded cells

portal<-portal %>% mutate(notes=ifelse((plot== "plot.2" &
                                      (weight==52 | 
                                         weight==127| 
                                         weight==157| 
                                         weight==218)),
                                   "scale not calibrated properly",notes))

# remove rows with no data
portal<-portal %>% filter(!is.na(date))
portal<-portal %>% filter(!sp.code=="NANA")


# Split date into three columns
portal<-portal %>% separate(date, c("year", "month","day"), "-")


# convert genus + species into a code
portal$sp.code<-paste(str_sub(portal$genus, 1, 2),str_sub(portal$species, 1, 2), sep="")

# create taxonomy table
taxonomy<-portal %>% select(family, 
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



# add a unique id number for each animal
portal$ID_no<-seq(1:nrow(portal))
portal$ID_no<-paste("m",portal$ID_no,sep="")
# Rearrange
portal<-portal %>% select(plot,
                      year,
                      month,
                      day,
                      ID_no,
                      sp.code,
                      weight,
                      sex,
                      notes)

# set data types
portal$year<-as.integer(portal$year)
portal$month<-as.integer(portal$month)
portal$day<-as.integer(portal$day)
portal$sp.code<-as.factor(portal$sp.code)
portal$sex<-as.factor(portal$sex)
portal$weight<-as.numeric(portal$weight)


portal<-portal %>% arrange(plot,
                       year,
                       month,
                       day,
                       ID_no)




view(taxonomy)
view(portal)

write_csv(taxonomy,"./class_outlines/wk3_spreadsheets/example_spreadsheets/EB_tax_example.csv")
write_csv(portal,"./class_outlines/wk3_spreadsheets/example_spreadsheets/EB_data_example.csv")


# what if you discover that sp. doesn't mean "species not identified", 
# but that is actually a new, undescribed species?'
# (lines 82-83)
