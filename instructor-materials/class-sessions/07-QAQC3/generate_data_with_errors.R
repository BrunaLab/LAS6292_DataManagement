# this code is to generate dataset to practice data visualization
# to find errors

library(MASS)
library(tidyverse)
set.seed(5)
# create the variance covariance matrix
sigma<-rbind(c(1,0.8,0.7), c(0.8,1, 0.9), c(0.7,0.9,1))
# create the mean vector
mu<-c(10, 9, 2) 
# generate the multivariate normal distribution
df<-as.data.frame(mvrnorm(n=750, mu=mu, Sigma=sigma))
df$V3<-df$V3+1.3
df$V2<-df$V2+1
names(df)<-c("body_length","age","weight")

df<-df %>% 
  mutate(body_length=round(body_length,2),
         weight=round(weight,2),
         age=round(age,1))

species1<-as_tibble(rep("bigfoot",250))
species2<-as_tibble(rep("mapinguari",250))
species3<-as_tibble(rep("chupacabra",250))
species<-bind_rows(species1,species2,species3) %>% 
  rename(species=value) %>% 
  mutate(id_key=row_number()) 

df<-df %>% 
  as_tibble() %>% 
  mutate(id_key=row_number()) %>% 
  relocate(id_key,.before=1) %>% 
  left_join(species) 
# 
# plot(df$age,df$body_length)
# 
# df2<-df
# df3<-df
# df4<-df
# df2[23,2]<-df2[23,2]+3
# df2[13,2]<-df2[13,2]+3
# df2[200,2]<-df2[200,2]+3
# df2[325,2]<-df2[325,2]+3
# df2[638,2]<-df2[638,2]+3
# df2[750,2]<-df2[750,2]+3
# 
# 
# 
# df3[23,2]<-df3[23,2]+6
# df3[13,2]<-df3[13,2]+6
# df3[200,2]<-df3[200,2]+6
# df3[325,2]<-df3[325,2]+6
# df3[638,2]<-df3[638,2]+6
# df3[750,2]<-df3[750,2]+6
df4<-df
df4[700,2]<-df4[700,2]+8
df4[700,3]<-df4[700,3]+0.5



# 
# 
# plot(df2$age,df2$body_length)
# plot(df2$age,df2$weight)
# plot(df2$body_length,df2$weight)
# 
# plot(df3$age,df3$body_length)
# plot(df3$age,df3$weight)
# plot(df3$body_length,df3$weight)
# 
# 
# plot(df$age,df$body_length)
# plot(df$age,df$weight)
# plot(df$body_length,df$weight)


library(ggplot2)
# Basic scatter plot
fig1<-ggplot(df4, aes(x=age, y=body_length)) + geom_point()
fig1
# 
# fig2<-fig1 + 
#   scale_x_continuous(name="demo data", limits=c(0, 20)) + 
#   scale_y_continuous(name="demo data", limits=c(0, 20)) 
# fig2
names(df4)
df4<-df4 %>% 
  dplyr::select(-id_key) %>% 
  mutate(species=as.factor(species)) 
  
summary(df4)
# write_csv(df4,"./instructor-materials/class-sessions/07-QAQC3/las_data_viz.csv")

las_data<-iris
las_data[42,1]<-las_data[42,1]+10
write_csv(las_data,"./instructor-materials/class-sessions/07-QAQC3/demo_datasets/las_data_viz.csv")