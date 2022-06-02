install.packages(c("readr","data.table"))
library(readr)
library(data.table)
library(ggplot2)
library(sclaes)
library(dplyr)

df <- fread("TemperaturasGlobais.csv")

CidadesBrasil <- subset(df, Country == "Brazil")
CidadesBrasil <- na.omit(CidadesBrasil)

CidadesBrasil$dt = as.POSIXct(CidadesBrasil$dt, format = '%Y-%m-%d')
CidadesBrasil$Month = month(CidadesBrasil$dt)
CidadesBrasil$Year = year(CidadesBrasil$dt)

cps = subset(CidadesBrasil, City == 'Campinas')
cps = subset(cps, Year %in% c(1796,1846, 1896,1946, 1996,2012))

cwb = subset(CidadesBrasil, City == "Curitiba")
cwb = subset(cps, Year %in% c(1796,1846, 1896,1946, 1996,2012))         

mao = subset(CidadesBrasil, City == "Manaus")
mao = subset(mao, Year %in% c(1796,1846, 1896,1946, 1996,2012))

rcf = subset(CidadesBrasil, City == "Recife")
rcf = subset(rcf, Year %in% c(1796,1846, 1896,1946, 1996,2012))
rcf

p_cps = ggplot(cps, aes(x= (Month), y = AverageTemperature, color = as.factor(Year)))+
  geom_smooth(se= FALSE, fill = NA, size= 2)+
  theme_light(base_size = 20)+
  xlab("Mês")+
  ylab("Temperatura Média")+
  scale_color_discrete("")+
  ggtitle("Temperatura Média ao Longo dos Anos em Campinas")+
  theme(plot.title = element_text(size = 18))
p_cps

p_cwb = ggplot(cwb, aes(x= (Month), y = AverageTemperature, color = as.factor(Year)))+
  geom_smooth(se= FALSE, fill = NA, size= 2)+
  theme_light(base_size = 20)+
  xlab("Mês")+
  ylab("Temperatura Média")+
  scale_color_discrete("")+
  ggtitle("Temperatura Média ao Longo dos Anos em Curitiba")+
  theme(plot.title = element_text(size = 18))
p_cwb

p_mao = ggplot(mao, aes(x= (Month), y = AverageTemperature, color = as.factor(Year)))+
  geom_smooth(se= FALSE, fill = NA, size= 2)+
  theme_light(base_size = 20)+
  xlab("Mês")+
  ylab("Temperatura Média")+
  scale_color_discrete("")+
  ggtitle("Temperatura Média ao Longo dos Anos em Manaus")+
  theme(plot.title = element_text(size = 18))
p_mao

p_rcf = ggplot(rcf, aes(x= (Month), y = AverageTemperature, color = as.factor(Year)))+
  geom_smooth(se= FALSE, fill = NA, size= 2)+
  theme_light(base_size = 20)+
  xlab("Mês")+
  ylab("Temperatura Média")+
  scale_color_discrete("")+
  ggtitle("Temperatura Média ao Longo dos Anos em Recife")+
  theme(plot.title = element_text(size = 18))
p_rcf
