
#Assumption 1 Area data is not case sensitive 
#Assumption 2 same Beneficiary can visit same area or same service multiple it is not a duplicate data.


######################################
##  Developer: Assignment.R         ##
##  Reviewer :                      ##
##  version  : 1.0                  ##
######################################

#Libraries 

library(tidyr)

#Source files import
areas <- read.csv("C:/Users/DELL/Downloads/Data Engineer/program tasks/areas.csv")
users <- read.delim("C:/Users/DELL/Downloads/Data Engineer/program tasks/users.txt",header=FALSE,sep =":")

#Columns to rows trnsformation 
users_beneficiaries <- separate_rows(users,V2,sep=",") %>%  
  rename(c(User="V1",Beneficiary="V2"))
  

#Join users and visits
df = merge(x=users_beneficiaries,y=visits,by="Beneficiary",all.y=TRUE)

#Get counts area wise
summery<-df %>%
  group_by(User) %>%
  summarize(n()) %>%
  drop_na(User) %>%
  rename(c(Counts="n()")) 


Summery_sorted <- summery[order(summery$Counts,decreasing = FALSE),]  

# Create the data for the chart
H <- c(Summery_sorted$Counts)
M <- c(Summery_sorted$User)

# Plot the bar chart 
x1=barplot(H,names.arg=M,main="User Performance by no of Services provided", las =2,col = "light blue" , border="light green" ,cex.axis=0.8, cex.names=0.6)

# Add text at top of bars
text(x=x1,y=H,labels = H,pos =1, cex = 0.7, col = "red")




