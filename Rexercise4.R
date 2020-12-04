# recreate the 4 column x 17 row table
wrightPeakFlowMeter <- rep(NA, 17)
practiceData <- read.table('/Users/seung-a/Dropbox/My Mac (SeunguicBookAir)/Documents/my school work/R/practiceData.csv', sep=',', header=TRUE)
attach(practiceData)

# recreate figure 1
plot(WPFM_1st, mWPFM_1st, 
     xlab = "PEFR by Large meter (1/min)", ylab = "PEFR by Mini meter (1/min)", 
     xlim=c(0, 800), ylim=c(0, 800),
     main = "PEFR measured with large Wright peak flow meter \nand mini Wright peak flow meter, with line of equality")
abline(0, 1)

# recreate figure 2
plot(   , WPFM_1st-mWPFM_1st)
