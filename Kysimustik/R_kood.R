setwd("C:/Users/maari/OneDrive/Loputoo/R")

library(readr)
survey_results <- read_csv("results-survey-170.csv")
#View(survey_results)

#install.packages("pacman")
#install.packages("dplyr")
library(dplyr)
#install.packages("ggplot2")
library(ggplot2)
#install.packages("ggpubr")
library(ggpubr)
##########
library (ggthemes)


###Funktsioon emotsiooni tabeli tegemiseks

data_function <- function(datadata){
  table_data <- datadata
  emotsioonid <- data.frame(Emotsioon=c("rõõm", "kurbus", "hirm", "viha", "vastikus", "segadustunne", "keskendunud", "üllatunud","neutraalne", "ei oska öelda", "muu"))
  name_mapping <-match(emotsioonid$Emotsioon, table_data$Emotsioon)
  for(i in 1:length(name_mapping)) {
    role <- as.character(table_data$N[name_mapping[i]])   
    emotsioonid$N[i] = role
  }
  emotsioonid[is.na(emotsioonid)] <-0
  return(emotsioonid)
}

###Inimene###
inim_kurbus <- count(survey_results, FKurbus)
colnames(inim_kurbus)<-c("Emotsioon","N")
inim_kurbus <- data_function(inim_kurbus)
#View(inim_kurbus)

inim_yllatus <-count(survey_results,FYllatus)
colnames(inim_yllatus)<-c("Emotsioon","N")
inim_yllatus <- data_function(inim_yllatus)
       
inim_hirm <-count(survey_results,FHirm)
colnames(inim_hirm)<-c("Emotsioon","N")
inim_hirm <- data_function(inim_hirm)

inim_viha <-count(survey_results,FViha)
colnames(inim_viha)<-c("Emotsioon","N")
inim_viha <- data_function(inim_viha)

inim_vastikus <-count(survey_results,FVastikus)
colnames(inim_vastikus)<-c("Emotsioon","N")
inim_vastikus <- data_function(inim_vastikus)

inim_room <-count(survey_results,FRoom)
colnames(inim_room)<-c("Emotsioon","N")
inim_room <- data_function(inim_room)

###Robot1###
r1_kurbus <- count(survey_results,R1Kurb)
colnames(r1_kurbus)<-c("Emotsioon","N")
r1_kurbus <- data_function(r1_kurbus)

r1_hirm <- count(survey_results,R1Hirm)
colnames(r1_hirm)<-c("Emotsioon","N")
r1_hirm <- data_function(r1_hirm)

r1_viha <- count(survey_results,R1Kuri)
colnames(r1_viha)<-c("Emotsioon","N")
r1_viha <- data_function(r1_viha)

r1_neutraalne <- count(survey_results,R1Neutraalne)
colnames(r1_neutraalne)<-c("Emotsioon","N")
r1_neutraalne <- data_function(r1_neutraalne)

r1_yllatunud <- count(survey_results,R2Yllatunud)
colnames(r1_yllatunud)<-c("Emotsioon","N")
r1_yllatunud <- data_function(r1_yllatunud)

r1_room <- count(survey_results,R2Onnelik)
colnames(r1_room)<-c("Emotsioon","N")
r1_room <- data_function(r1_room)


###Robot2###

r2_keskendunud <- count(survey_results,R2Keskendunud)
colnames(r2_keskendunud)<-c("Emotsioon","N")
r2_keskendunud <- data_function(r2_keskendunud)

r2_keskendunud2 <- count(survey_results,R2Keskendunud2)
colnames(r2_keskendunud2)<-c("Emotsioon","N")
r2_keskendunud2 <- data_function(r2_keskendunud2)

r2_kurbus <- count(survey_results,R2Kurb)
colnames(r2_kurbus)<-c("Emotsioon","N")
r2_kurbus <- data_function(r2_kurbus)

r2_neutraalne <- count(survey_results,R2Neutraalne)
colnames(r2_neutraalne)<-c("Emotsioon","N")
r2_neutraalne <- data_function(r2_neutraalne)

r2_segadus <- count(survey_results,R2Segaduses)
colnames(r2_segadus)<-c("Emotsioon","N")
r2_segadus <- data_function(r2_segadus)

r2_yllatunud <- count(survey_results,R2Yllatunud2)
colnames(r2_yllatunud)<-c("Emotsioon","N")
r2_yllatunud <- data_function(r2_yllatunud)

###Robot3###
r3_room <- count(survey_results,R3Roomus)
colnames(r3_room)<-c("Emotsioon","N")
r3_room <- data_function(r3_room)

r3_kurbus <- count(survey_results,R3Kurb)
colnames(r3_kurbus)<-c("Emotsioon","N")
r3_kurbus <- data_function(r3_kurbus)

r3_yllatunud <- count(survey_results,R3Yllatunud)
colnames(r3_yllatunud)<-c("Emotsioon","N")
r3_yllatunud <- data_function(r3_yllatunud)

r3_segadus <- count(survey_results,R3Segaduses)
colnames(r3_segadus)<-c("Emotsioon","N")
r3_segadus <- data_function(r3_segadus)


###Robot4###
r4_kurbus <- count(survey_results,K2)
colnames(r4_kurbus)<-c("Emotsioon","N")
r4_kurbus <- data_function(r4_kurbus)

r4_room <- count(survey_results,R4Roomus)
colnames(r4_room)<-c("Emotsioon","N")
r4_room <- data_function(r4_room)

r4_viha <- count(survey_results,R4Kuri)
colnames(r4_viha)<-c("Emotsioon","N")
r4_viha <- data_function(r4_viha)

r4_neutraalne <- count(survey_results,R4Neutraalne)
colnames(r4_neutraalne)<-c("Emotsioon","N")
r4_neutraalne <- data_function(r4_neutraalne)


###Inimese graafikud###


###funktsioon graafiku tegemiseks
graph_function <-function (graph_data,area_color,graph_title){
  ggplot(graph_data, aes(Emotsioon,as.numeric(N)/sum(as.numeric(N))))+geom_col(fill=area_color,color="black",show.legend = FALSE)+
    ggtitle(graph_title) + theme_bw()+theme(axis.text.x = element_text(angle = 90, hjust = 1))+
    labs(x= "Emotsioon", y = "Protsent %")+
    geom_text(aes(label=scales::percent(as.numeric(N)/sum(as.numeric(N)))), position=position_dodge(width=0.9), vjust=-0.25)+
    scale_y_continuous(labels = scales::percent)+
    expand_limits(y=c(NA, 1))+
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
}

###graafikute tuplade värvid

area11.color <- c("green4","gray","gray","gray","gray", "gray", "gray", "gray", "gray","gray","gray")
area11_kurbus.color <- c("gray","green4", "gray", "gray", "gray", "gray","gray","gray","gray","gray","gray")
area11_hirm.color <- c("gray","gray","green4","gray","gray","gray","gray", "gray", "gray", "gray", "gray")
area11_viha.color <- c("gray","gray", "gray","green4","gray","gray","gray","gray", "gray", "gray", "gray")
area11_vastikus.color <- c("gray","gray", "gray", "gray","green4","gray","gray","gray","gray", "gray", "gray")
area11_segadus.color <- c("gray","gray", "gray", "gray", "gray","green4","gray","gray","gray","gray", "gray")
area11_keskendunud.color <- c("gray","gray", "gray", "gray", "gray", "gray","green4","gray","gray","gray","gray")
area11_yllatus.color <- c("gray","gray", "gray", "gray", "gray", "gray","gray","green4","gray","gray","gray")
area11_muu.color <- c("gray","gray", "gray", "gray", "gray", "gray","gray","gray","gray","gray","green4")
area11_vastikus.color <- c("gray","gray", "gray", "gray","green4","gray","gray","gray","gray", "gray", "gray")
area11_eisoka.color <- c("gray","gray", "gray", "gray", "gray", "gray","gray","gray","gray","green4","gray")
area11_neutraalne.color <- c("gray","gray", "gray", "gray", "gray", "gray","gray","gray","green4","gray","gray")
area11_room.color <- c("green4","gray","gray","gray","gray", "gray", "gray", "gray", "gray","gray", "gray")


###graafikute loomine

###Inimene
ig_hirm <- graph_function(inim_hirm,area11_hirm.color,"(a) hirm")
ig_kurbus <- graph_function(inim_kurbus,area11_kurbus.color," (b) kurbus")
ig_room <- graph_function(inim_room,area11_room.color,"(c) rõõm")
ig_vastikus <- graph_function(inim_vastikus,area11_vastikus.color,"(d) vastikus")
ig_viha <- graph_function(inim_viha,area11_viha.color,"(e) viha")
ig_yllatus <- graph_function(inim_yllatus,area11_yllatus.color,"(f) üllatunud")
ggarrange(ig_hirm,ig_kurbus,ig_room,ig_vastikus,ig_viha,ig_yllatus)

###Robot1
r1g_hirm <- graph_function(r1_hirm,area11_hirm.color,"(a) hirm")
r1g_kurbus <- graph_function(r1_kurbus,area11_kurbus.color,"(b) kurbus")
r1g_neutraalne <- graph_function(r1_neutraalne,area11_neutraalne.color,"(c) neutraalne")
r1g_viha <- graph_function(r1_viha,area11_viha.color,"(d) viha")
r1g_room <- graph_function(r1_room,area11_room.color,"(e) rõõm")
r1g_yllatunud <- graph_function(r1_yllatunud,area11_yllatus.color,"(f) üllatunud")
ggarrange(r1g_hirm,r1g_kurbus,r1g_neutraalne,r1g_viha,r1g_room, r1g_yllatunud)

###Robot2
r2g_keskendunud <- graph_function(r2_keskendunud,area11_keskendunud.color,"(a) keskenunud")
r2g_keskendunud2 <- graph_function(r2_keskendunud2,area11_keskendunud.color,"(b) keskendunud 2")
r2g_kurbus <- graph_function(r2_kurbus,area11_kurbus.color,"(c) kurbus")
r2g_neutraalne <- graph_function(r2_neutraalne,area11_neutraalne.color,"(d) neutraalne")
r2g_segadus <- graph_function(r2_segadus,area11_segadus.color,"(e) segadustunne")
r2g_yllatunud <- graph_function(r2_yllatunud,area11_yllatus.color,"(f) üllatunud")
ggarrange(r2g_keskendunud,r2g_keskendunud2,r2g_kurbus,r2g_neutraalne,r2g_segadus, r2g_yllatunud)


###Robot3
r3g_kurbus <- graph_function(r3_kurbus,area11_kurbus.color,"(a) kurbus")
r3g_room <- graph_function(r3_room,area11_room.color,"(b) rõõm")
r3g_segadus <- graph_function(r3_segadus,area11_segadus.color,"(c) segadustunne")
r3g_yllatunud <- graph_function(r3_yllatunud,area11_yllatus.color,"(d) üllatunud")
ggarrange(r3g_kurbus,r3g_room,r3g_segadus,r3g_yllatunud)

###Robot4
r4g_kurbus <- graph_function(r4_kurbus,area11_kurbus.color,"(a) kurbus")
r4g_neutraalne <- graph_function(r4_neutraalne,area11_neutraalne.color,"(b) neutraalne")
r4g_room <- graph_function(r4_room,area11_room.color,"(c) rõõm")
r4g_viha <- graph_function(r4_viha,area11_viha.color,"(d) viha")
ggarrange(r4g_kurbus,r4g_neutraalne,r4g_room,r4g_viha)


#######################
########INTENT#########
#######################


#Pikad vastused inglisekeelseks
car_function <- function(data){
  data
  for(i in 1:nrow(data)){
    if(endsWith(data$Intent[i],"peatub.")){
      data$Intent[i]="The vehicle is stopping"
    }else if(endsWith(data$Intent[i],"selle tähendust.")){
      data$Intent[i]="Doesn't understand the meaning"
    }else if(endsWith(data$Intent[i],"muu")){
      data$Intent[i]="Else"
    }else if(endsWith(data$Intent[i],"mingit tähendust.")){
      data$Intent[i]="No significance for the pedestrian"  
    }else if(endsWith(data$Intent[i],"samamoodi.")){
      data$Intent[i]="The vehicle continues to drive "
    }else if(endsWith(data$Intent[i],"kohe liikumist.")){
      data$Intent[i]="The vehicle will start driving "
    }else if(endsWith(data$Intent[i],"mulle teed.")){
      data$Intent[i]="The vehicle will yield"
    }
  }
  return(data)
}

#esimesed neli
mersu_stop_led <- count(survey_results, YStopping )
colnames(mersu_stop_led)<-c("Intent","N")
mersu_stop_led <- car_function(mersu_stop_led)

mersu_stop_proj <- count(survey_results, Y2Stop )
colnames(mersu_stop_proj)<-c("Intent","N")
mersu_stop_proj <- car_function(mersu_stop_proj)

ford_annabteed <- count(survey_results, Y4AnnabTeed )
colnames(ford_annabteed)<-c("Intent","N")
ford_annabteed <- car_function(ford_annabteed)

ford_soidab <- count(survey_results, Y6Soidab )
colnames(ford_soidab)<-c("Intent","N")
ford_soidab <- car_function(ford_soidab)

#teised neli
mersu_annabteed_led <- count(survey_results, YGoAhead)
colnames(mersu_annabteed_led)<-c("Intent","N")
mersu_annabteed_led <- car_function(mersu_annabteed_led)

ford_peatunud <- count(survey_results, YAnnabTeedPeatunud)
colnames(ford_peatunud)<-c("Intent","N")
ford_peatunud <- car_function(ford_peatunud)

ford_hakkabsoitma <- count(survey_results, Y5HakkabSoitma)
colnames(ford_hakkabsoitma)<-c("Intent","N")
ford_hakkabsoitma <- car_function(ford_hakkabsoitma)

mersu_annabteed_proj <- count(survey_results, Y3Yletee)
colnames(mersu_annabteed_proj)<-c("Intent","N")
mersu_annabteed_proj <- car_function(mersu_annabteed_proj)

#####graafikud
graph_function2 <-function (graph_data,area_color,graph_title){
  ggplot(graph_data, aes(Intent,as.numeric(N)/sum(as.numeric(N))))+geom_col(fill=area_color,color="black",show.legend = FALSE)+
    ggtitle(graph_title) + theme_bw()+theme(axis.text.x = element_text(angle = 90, hjust = 1))+
    labs(x= "Intent", y = "Percentage %")+
    geom_text(aes(label=scales::percent(as.numeric(N)/sum(as.numeric(N)))), position=position_dodge(width=0.9), vjust=-0.25)+
    scale_y_continuous(labels = scales::percent)+
    expand_limits(y=c(NA, 1))+
    theme(axis.text.x = element_text(angle = 50, hjust = 1))
}

area5_1.color <- c("green4","gray","gray","gray","gray")
area5_4.color <- c("gray","gray","green4","gray","gray")
area5_5.color <- c("gray","gray","gray","green4","gray")
area5_3.color <- c("gray","gray","gray","gray","green4")

msl <- graph_function2(mersu_stop_led,area5_5.color,"(a) Mercedes, LED: Stopping")
msp <- graph_function2(mersu_stop_proj,area5_5.color,"(b) Mercedes, Projected: Stopping")
fat <- graph_function2(ford_annabteed,area5_5.color,"(c) Ford: Stopping")
fs <- graph_function2(ford_soidab,area5_4.color,"(d) Ford: Continues to drive")
ggarrange(msl,msp,fat,fs)

matl <- graph_function2(mersu_annabteed_led,area5_5.color,"(a) Mercedes, LED: Yields")
fp <- graph_function2(ford_peatunud,area5_5.color,"(b) Ford: Yields")
fhs <- graph_function2(ford_hakkabsoitma,area5_4.color,"(c) Ford: Starts driving")
matp <- graph_function2(mersu_annabteed_proj,area5_5.color,"(d) Mercedes, Projected: Yields")
ggarrange(matl,fp,fhs,matp)

       