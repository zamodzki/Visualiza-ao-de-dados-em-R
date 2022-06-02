install.packages(c("readr","data.table"))
library(readr)
library(data.table)
library(ggplot2)
library(sclaes)
library(dplyr)
require(ggplot2)

df <- fread("Stores.csv")
tail(df) #896 stores
plot(df$Store_Area, df$Items_Available)
plot(df$Store_Area, df$Daily_Customer_Count)
plot(df$Store_Area, df$Store_Sales)
plot(df$Items_Available, df$Daily_Customer_Count)
plot(df$Items_Available, df$Store_Sales, type ="p", xlab="Items Available", ylab="Store Sales", col ="purple")
plot(df$Store_Sales, df$Daily_Customer_Count)

areaXitems<- ggplot(df, aes(x=df$Store_Area, y=df$Items_Available, xlabel= "Store Area", ylabel= Items_Available)) + 
  geom_point()+
  geom_smooth(method=lm , col="red") 
areaXitems

areaXd_coustumer<- ggplot(df, aes(x=df$Daily_Customer_Count, y=df$Store_Area, xlabel= "Store Area", ylabel= Items_Available)) + 
  geom_point()+
  geom_smooth(method=lm , col="red") 
areaXd_coustumer

areaXsales<- ggplot(df, aes(x=df$Daily_Customer_Count, y=df$Store_Sales, xlabel= "Store Area", ylabel= Items_Available)) + 
  geom_point()+
  geom_smooth(method=lm , col="red") 
areaXsales

itemsXd_customer<- ggplot(df, aes(x=df$Items_Available, y=df$Daily_Customer_Count, xlabel= "Store Area", ylabel= Items_Available)) + 
  geom_point()+
  geom_smooth(method=lm , col="red") 
itemsXd_customer

itemsXsales<- ggplot(df, aes(x=df$Items_Available, y=df$Store_Sales, xlabel= "Store Area", ylabel= Items_Available)) + 
  geom_point()+
  geom_smooth(method=lm , col="red") 
itemsXsales

d_customerXsales<- ggplot(df, aes(x=df$Daily_Customer_Count, y=df$Store_Sales, xlabel= "Store Area", ylabel= Items_Available)) + 
  geom_point()+
  geom_smooth(method=lm , col="red") 
d_customerXsales

