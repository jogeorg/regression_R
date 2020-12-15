# IMPORT LIBRARIES
install.packages("openxlsx", dependencies = TRUE)
library(readr, datasets, openxlsx)

# IMPORT DATA
wb <- loadWorkbook(file = "SUB-IP-EST2019-ANNRES-47.xlsx")
df <- read.xlsx(xlsxFile = wb, rows = 4:349, cols = 4:13)
head(df)
tail(df)

# CLEAN THE DATA
pop <- as.integer(mapply(sum,df))
years <- seq(from = 2010, to = 2019)
pop.years <- data.frame(years = years, population = pop)

# PLOT THE DATA
scatter.smooth(pop.years, main = "Population in Tennessee")

#PREDICT
model <- lm(pop ~ years, data = pop.years)
new.years <- data.frame(years = 2025)
predict(model, newdata = new.years)

#TABULATE STAT DESC FROM SUMMARY()
summary(model)
