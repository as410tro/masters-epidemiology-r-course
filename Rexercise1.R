install.packages("ggplot2")
library(ggplot2)
dat <- read.table('/Users/seung-a/Dropbox/My Mac (SeunguicBookAir)/Downloads/NHANES1.csv', sep=',', header=TRUE)

# How to get rows & columns & its names
dim(dat)
nrow(dat)
ncol(dat)
colnames(dat)

# Set some variables as a factor
dat$srhgnrl <- as.factor(dat$srhgnrl)
dat$srphbad_prv30d <- as.factor(dat$srphbad_prv30d)
dat$srmhbad_prv30d <- as.factor(dat$srmhbad_prv30d)
dat$adlimp_prv30d <- as.factor(dat$adlimp_prv30d)
dat$educ <- as.factor(dat$educ)
dat$martlst <- as.factor(dat$martlst)
dat$ethnic <- as.factor(dat$ethnic)
dat$increl <- as.factor(dat$increl)
dat$diab_lft <- as.factor(dat$diab_lft)
dat$jobstat_lwk <- as.factor(dat$jobstat_lwk)
dat$alc_lft <- as.factor(dat$alc_lft)
dat$smokstat <- as.factor(dat$smokstat)
dat$milk_month <- as.factor(dat$milk_month)

# save it as .Rdata
save(dat, file="cleanedData.Rdata")

attach(dat)
?attach
?as.factor

# How many women & men?
length(which(male==F)) # number of women
length(which(male==T)) # number of men

length(which(dat$male==T)) # dat$male is unnecc cuz we "attach"ed dat

# How many women have bronchitis?
someVar <- table(dat$male, dat$cbronch_now)
someVar[4]

# mean BMI
?mean
mean(bmi, na.rm=T) # mean bmi

mean(bmi[male==T], na.rm=T) # mean bmi for men, [ ] is a subset; another header/column
mean(bmi[male==F], na.rm=T) # mean bmi for women

# comparing mercury level
## who has higher mercury level: men vs women?
meanMenHg <- mean(hg[male==TRUE], na.rm=TRUE)
meanWomHg <- mean(hg[male==FALSE], na.rm=TRUE)

### men have higher Mercury (hypothesis)
hypothesis <- TRUE
if(meanMenHg < meanWomHg){
  hypothesis <- TRUE
}else{
  hypothesis <- FALSE
}

## who has higher Hg: w/ bronchitis or not?
meanBronch <- mean(hg[cbronch_now==TRUE], na.rm=TRUE)
meanNoBron <- mean(hg[cbronch_now==FALSE], na.rm=TRUE)

## different ethnic groups
ethnicity <- list(Hispanic = 1, White = 2, Black = 3, OtherMixed = 4)

meanHis <- mean(hg[ethnic==ethnicity$Hispanic], na.rm = TRUE)
meanWhi <- mean(hg[ethnic==ethnicity$White], na.rm = TRUE)
meanBla <- mean(hg[ethnic==3], na.rm = TRUE)
meanOth <- mean(hg[ethnic==4], na.rm = TRUE)

# summary
summary(dat)

attach(dat)

# plot sys bp x BMI
plot(bmi, xlab = "BMI",
     rr_sys, ylab = "Systolic Blood Pressure", 
     pch=20, col="#FFCC00", 
     main = "Association between BMI & Sys BP")

# boxplot sys BP x Diabetes diagnosis
boxplot(rr_sys~diab_lft, 
        pch = 1, col = c("light blue","orange","red"),
        names = c("none", "prediabetic", "diabetic"),
        xlab = "Diabetes Diagnosis", ylab = "Sys Blood Pressure",
        main = "Association btwn Diabetes & Sys BP")

# plot bmi x educ
plot(x = educ, y = bmi, col = c("light yellow", "yellow", "light green", "green", "blue"),
     pch=20, main = "Association btwn BMI x Education",
     names = c("less than 9", "no highschool diploma",
               "high school", "undergrad","gradschool"),
     xlab = "education level", ylab = "BMI")

# histogram of HDL cholestrol level
hist(hdl, breaks = 100)

dat$logHDL <- log(hdl)
hist(dat$logHDL, breaks=100, main="Distribution of log(HDL)", xlab="log(HDLcholesterol level)")
save(dat, file="dat.Rdata")