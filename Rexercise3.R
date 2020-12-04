load(file = "dat.Rdata")
attach(dat)

# Use a statistical test to see if there is a significant difference in height between men and women.
# before doing a t-test, check if the variables are normally distributed
qqnorm(height[male==F])
qqline(height[male==F], col="red", lwd=2) 

qqnorm(height[male==T])
qqline(height[male==T], col="red", lwd=2)    ## Seems normally distributed

# H0: no difference btwn men & women, H1: there is a difference btwn men & women
t.test(height~male)        ## Welch Two Sample t-test for both genders

t.test(height[male==T])    ## Or do One Sample t-test for each gender
t.test(height[male==F])    ## both CIs do not overlap. Therefore, the height of men and women are 'significantly' different.

# Test if the variance in height is different between men and women.
var.test(height~male)      ## CI includes 1, so the varience is not significantly different in both groups


# a small difference in blood mercury levels between men & women. Difference statistically significant?
qqnorm(hg)
qqline(hg, col="pink", lwd=2)   ## hg distribution is right skewed

qqnorm(log(hg))
qqline(log(hg), col="pink", lwd=2, lty=2) ## log(hg) seems almost normally distributed following the normal quantiles
# except for the values on the left that look problematic. We will use the t-test
log_hg <- log(hg)
t.test(log_hg~male)   ## CI of difference=[-0.08, 0.04] contains "0." Hg level is not sig. diff btwn both genders.

# Is HDL significantly different between people who have been diagnosed with & without overweight?
# If so, what is the difference you expect? Test your hypothesis.
qqnorm(hdl)
qqline(hdl, col="yellow", lwd=2)  ## HDL is not normally distributed

qqnorm(logHDL)
qqline(logHDL, col="yellow", lwd=2)  ## log(HDL) is normally distributed

t.test(logHDL~ovrwght_ever)  ## CI of difference=[0.09,0.12] does not contain 0 & p<0.05, sig. diff
                             ### When reporting the result should I exp the CI?

# if your hypothesis is that HDL is lower in overweight people, do a one-sided t-test:
t.test(logHDL[ovrwght_ever==T], alternative="greater")    ## H0=no difference btwn overweight/not
                                                          ## H1=true mean difference greater than 0
                                                          ## CI=[0.25,inf]
t.test(logHDL~ovrwght_ever, alternative="g")


  
# Is there sig. diff. in HDL btwn diabetics(3) vs non-diabetics(1)?
t.test(log(hdl)[diab_lft==1], log(hdl)[diab_lft==3])    ## nond-diab(non has higher HDL) CI=[0.09,0.13] does not contain 0, sig. diff


# Consider HDL of diabetics vs non-diabetics among ppl who have NEVER been diagnosed with overweight.
t.test(log(hdl)[diab_lft==1 & ovrwght_ever==F], 
       log(hdl)[diab_lft==3 & ovrwght_ever==F])        ## nond-diab CI=[0.04,0.11] not contain 0, still sig diff btwn diab & non-diab

# Does the result change? Interpret the results from both tests.
## no, 

# Do you expect other numerical variables in your data set to be different btwn certain groups? 

# Test your hypotheses and interpret your findings.