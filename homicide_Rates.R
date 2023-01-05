
#Homicide Rates Code Sheet
install.packages("AER")
install.packages("tidyverse")
install.packages("marima")
install.packages("forecast")
install.packages("lmtest")

library(AER)
library(tidyverse)
library(marima)
library(forecast)
library(lmtest)

#turn off scientific notation
options(scipen=999)

install.packages("plm")
library(plm)
library(car)
library(readxl)

head(myData)
Summary(myData)

hist(myData$Crude_Rate,col="gold",main ="Histogram: Homicide Rates",xlab="Homicides Per 100,000")

#Autocorrelation
#lm test eq1
#H0:  No autocorrelation.  :)
#HA:  Autocorrelation.  :(
#lm test for first order autocorrelation (error and error lagged one period)
bgtest(eq1, order = 1, order.by = NULL, type = c("Chisq", "F"),data = list(), fill = 0)
#lm test for up to second order autocorrelation (error and error up to lagged two periods)
bgtest(eq1, order = 2, order.by = NULL, type = c("Chisq", "F"),data = list(), fill = 0)
#lm test for up to third order autocorrelation (error and error up to lagged three periods)
bgtest(eq1, order = 3, order.by = NULL, type = c("Chisq", "F"),data = list(), fill = 0)

#lm test for first order autocorrelation (error and error lagged one period)
bgtest(eq2, order = 1, order.by = NULL, type = c("Chisq", "F"),data = list(), fill = 0)
#lm test for up to second order autocorrelation (error and error up to lagged two periods)
bgtest(eq2, order = 2, order.by = NULL, type = c("Chisq", "F"),data = list(), fill = 0)
#lm test for up to third order autocorrelation (error and error up to lagged three periods)
bgtest(eq2, order = 3, order.by = NULL, type = c("Chisq", "F"),data = list(), fill = 0)

coeftest(eq1,vcov.=NeweyWest(eq1,lag=2,adjust=FALSE,verbose=TRUE))



#multicollinearity
vif(eq1)
vif(eq2)
vif_values <- vif(eq1)
barplot(vif_values, main = "VIF Values: OLS", horiz = TRUE, col = "steelblue")
abline(v = 5, lwd = 3, lty = 2)
vif_values2 <- vif(eq2)
barplot(vif_values2, main = "VIF Values: Log-Log", horiz = TRUE, col = "steelblue")
abline(v = 5, lwd = 3, lty = 2)
#Breusch pagan
bptest(eq2)








#Log Crude Rate in new variable 'lCrude_Rate'
myData$lCrude_Rate <- log(myData$Crude_Rate)


#ols regressions---multivariate 
eq1 <- lm(lCrude_Rate~Shall+Unemployment+Poverty+Bachelors+Divorced+Fatherless_Household+Pandemic+Death_Penalty+Northeast+Midwest+West,data=myData)
summary(eq1)
vif(eq1)
yhat<-eq1$fitted
plot(myData$Year_Code,myData$lCrude_Rate)
abline(lm(myData$lCrude_Rate~myData$Year_Code),lwd=3,col="red")
#double log
eq2 <- lm(lCrude_Rate~log(Unemployment)+log(Poverty)+log(Bachelors)+log(Divorced)+log(Fatherless_Household),data=myData)
summary(eq2)
vif(eq2)
#Panel Linear Model One way fixed effect
eq3 <- plm(lCrude_Rate~Shall+Unemployment+Poverty+Bachelors+Divorced+Fatherless_Household+Pandemic+Death_Penalty+Northeast+Midwest+West,data=myData,index=c("State_Code","Year_Code"),model="within")
summary(eq3)
#F test with null hypothesis of no (positive) difference between fixed effects model and standard ols
pFtest(eq3,eq2)
fixef(eq3)

#Panel Linear Model TFE
eq4 <- plm(lCrude_Rate~Shall+Unemployment+Poverty+Bachelors+Divorced+Fatherless_Household+Pandemic+Death_Penalty+Northeast+Midwest+West,data=myData,index=c("State_Code","Year_Code"),model="within", effect = "twoways")
summary(eq4)
pFtest(eq4,eq1)
fixef(eq4)


library(stargazer)
stargazer(eq3,eq2,eq1,eq4,type="text",digits=2)

