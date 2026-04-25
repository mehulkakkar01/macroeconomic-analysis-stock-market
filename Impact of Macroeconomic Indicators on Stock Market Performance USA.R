# Install required packages (run once)
install.packages(c("quantmod","tidyverse","lmtest","car","tseries","forecast"))

# Load libraries
library(quantmod)
library(tidyverse)
library(lmtest)
library(car)
library(tseries)
library(forecast)

# -------------------------------
# Download Macro Financial Data
# -------------------------------

getSymbols(c("SP500","CPIAUCSL","UNRATE","FEDFUNDS","M2SL"),
           src = "FRED")

# Merge and clean data
data <- na.omit(merge(SP500, CPIAUCSL, UNRATE, FEDFUNDS, M2SL))

# Rename columns
colnames(data) <- c("SP500","CPI","Unemployment","InterestRate","MoneySupply")

# View data
head(data)

# -------------------------------
# Log Transformation
# -------------------------------

# Apply log only to appropriate variables
data_log <- data
data_log$SP500 <- log(data$SP500)
data_log$CPI <- log(data$CPI)
data_log$MoneySupply <- log(data$MoneySupply)

# Remove NA values again
data_log <- na.omit(data_log)

head(data_log)

# -------------------------------
# Regression Model
# -------------------------------

model <- lm(SP500 ~ CPI + Unemployment + InterestRate + MoneySupply,
            data = data_log)

summary(model)

# -------------------------------
# Diagnostic Tests
# -------------------------------

# Normality Test
jarque.bera.test(residuals(model))

# Histogram & QQ Plot
par(mfrow=c(1,2))

hist(residuals(model),
     main="Histogram of Residuals",
     xlab="Residuals")

qqnorm(residuals(model),
       main="Q-Q Plot")
qqline(residuals(model), col="red")

# Multicollinearity Test
vif(model)

# Heteroskedasticity Test
bptest(model)

# Autocorrelation Test
dwtest(model)

# -------------------------------
# Stationarity Tests
# -------------------------------

adf.test(data_log$SP500)
adf.test(data_log$CPI)
adf.test(data_log$Unemployment)
adf.test(data_log$InterestRate)
adf.test(data_log$MoneySupply)

# -------------------------------
# Correlation Analysis
# -------------------------------

cor(data_log)

# Scatterplot Matrix
pairs(data_log)