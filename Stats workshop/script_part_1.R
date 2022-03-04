datum<- file.choose()
datum$Protein= as.factor(datum$protein)
plot(Mass~Protein, data = datum) #abline() adds a regression line only after you have run the function
results<- aov(Mass~Protein, data = datum)
summary(results)

#prefers to use lm instead of aov

ln(formula= Mass~Protein, data= datum)
confint(results) #gives the confidence error between the groups
#make protein a categorical data
results2<- ln(Mass~ as.factor(Protein), data=datum)
anova(results2, results) #compares results, **put more complicated model first**, tests if the first model is a better significant fit to the data
TukeyHSD(aov(results2)) # take results2, run AOV and run Tukey test - shows differences between all the protein groups
results3<- ln(Mass~relevel(as.factor(Protein), ref="35"), data=datum) #R automatically chooses lowest value, if you want to change the reference variable use this
