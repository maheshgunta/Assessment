
######################################
##  Developer: Assignment. R        ##
##  Reviewer :                      ##
##  version  : 1.0                  ##
######################################

#Libraries 

library(tidyr)

#Source files import
areas <- read.csv("C:/Users/DELL/Downloads/Data Engineer/program tasks/areas.csv")
visits <- read.csv("C:/Users/DELL/Downloads/Data Engineer/program tasks/visits.csv")

#Join areas and visits
df = merge(x=areas,y=visits,by="Beneficiary",all.y=TRUE)

#Get counts area wise
summery<-df %>%
  group_by(toupper(Area)) %>%
  summarize(n()) %>%
  rename(c(Area="toupper(Area)",Counts="n()")) 

Summery_sorted <- summery[order(summery$Counts,decreasing = FALSE),]  

# Create the data for the chart
H <- c(Summery_sorted$Counts)
M <- c(Summery_sorted$Area)

# Plot the bar chart 
x1=barplot(H,names.arg=M,main="Counts of Beneficiaries by District", las =2,col = "light blue" , border="light green" ,cex.axis=0.8, cex.names=0.6)

# Add text at top of bars
text(x=x1,y=H,labels = H,pos =1, cex = 0.7, col = "red")




