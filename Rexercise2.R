load(file = "dat.Rdata")
dat$male
attach(dat)
male
?attach
help("attach")

# male & female height, normally distributed? check graphically
heightOfMales <- height[male==TRUE]
heightOfFemales <- height[male==FALSE]

hist(heightOfMales, breaks = 100)
hist(heightOfFemales, breaks = 100)

qqnorm(height[male == T])
qqnorm(heightOfMales)
qqnorm(height[male == F])



# bmi, normally distributed? draw a line where median & mean is
hist(bmi, breaks = 100)
plot(density(bmi, na.rm = T))

abline(v=median(bmi, na.rm = TRUE), col="pink")
abline(v=mean(bmi, na.rm = TRUE), col="blue")

# Is logBmi normally distributed?
logBmi <- log(bmi)
plot(density(logBmi, na.rm = TRUE))    ## still a bit right skewed
qqnorm(logBmi)     ## line a bit bent -> logBmi is not normal

# add WHO's BMI category as a new variable
bmi_cat <- cut(bmi, breaks = c(0, 18.5, 25, 30, 35, 40, 100), labels = c("Underweight", "Normal", "Overweight", "Class 1 Obesity", "Class 2 Obesity", "Class 3 Obesity"), right = FALSE)
dat$bmi_cat <- bmi_cat
plot(bmi_cat, main = "WHO BMI Classification")


# compare BMI_cat with ovrwht_ever
table(bmi_cat, ovrwght_ever) ## Among ppl with 'bmi > 30' (class1 obesity), there are a considerable number of ppl who were NEVER diagnosed of overweight 



# how is smoking status distributed?
table(smokstat)
plot(smokstat, main = "Smoking Status", names = c("Non-Smoker", "Occasionally", "Daily"), col = c("green", "orange", "red"))

# smoking status' distribution by proportion
table(smokstat)/sum(table(smokstat))
100*table(smokstat)/sum(table(smokstat))

barplot(100*table(smokstat)/sum(table(smokstat)), col=c("green3", "orange", "red"), 
        names=c("Non-smoker", "Smoking occasionally", "Smoking daily"), 
        xlab="Smoking status", ylab="Proportion in %", main = "Proportion of Smoking Status")

# create a new variable that combines non & occasional smokers
smokstat_bin <- rep(NA, nrow(dat))

### Why use []? ###
smokstat_bin[smokstat %in% c(1, 2)] <- 0     ## 0 is non/occasional
# smokstat_bin[smokstat==1] <- 0
# smokstat_bin[smokstat==2] <- 0

smokstat_bin[smokstat==3] <- 1               ## 1 is daily
# smokstat_bin[smokstat==3] = 1 
# smokstat_bin[smokstat %in% c(3)] <- 1

## 5000 rows (thus patients)
nrOfRows <- nrow(dat)
## we made an empty list with the same amount of patients
smokstat_bin <- rep(NA, nrOfRows)

### Why smokstat works and smokstat_bin requires traversing with $ to the new categ ####
plot(smokstat, main = "Smoking Status", names = c("Non-Smoker", "Occasionally", "Daily"), col = c("green", "orange", "red"))
plot(dat$smokstat_bin, main = "Smoking Status", names = c("Non-Smoker-Occasionally", "Daily"), col = c("green", "red"))
# attach(dat)
# dat$smokstat_bin <- smokstat_bin
# dat$smokstat_bin <- as.factor(dat$smokstat_bin)

# check if the new assignment is correct
table(smokstat, smokstat_bin)
hist(smokstat_bin, names=c("non/ocassional", "daily"))








test = list(sunsetRed = "sfd2344", green = "sdgsdf234")

test$
test[red] # does not work
test["sunset red"]

Horse = list(name = "Puppy", 
          poops = c(morning = TRUE, afternoon = FALSE, evening = TRUE),
          friends = c("Sia", "Bart", "Rick", "Morty"),
          male = T,
          records = c(list(date = "04-05-1989", firstPlace = TRUE), list(date = "06-07-2001", firstPlace = FALSE)))

Horse$records[1]$firstPlace

## some lists can only take one typee.g. only boolean or only numbers
## some lists can't take duplicate values (and will remove them)
## some lists accept every type 
## some lists give type information to the compiler (like list)

save(dat, file="dat.Rdata")
