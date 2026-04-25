Macroeconomic Analysis of Stock Market (R)

## Objective
To analyze the impact of macroeconomic variables on stock market performance using regression analysis.

## Data Used
- S&P 500 (Stock Market Index)
- CPI (Inflation)
- Unemployment Rate
- Interest Rate (Federal Funds Rate)
- Money Supply (M2)

## Tools Used
- R Programming
- quantmod, lmtest, tseries, car packages

## Methodology
- Data collected from FRED database
- Log transformation applied to selected variables
- Multiple linear regression model used
- Diagnostic tests performed:
  - Jarque-Bera (Normality)
  - VIF (Multicollinearity)
  - Breusch-Pagan (Heteroskedasticity)
  - Durbin-Watson (Autocorrelation)
  - ADF Test (Stationarity)

## Key Findings
- Money supply has a strong positive impact on stock market performance
- Inflation and interest rates significantly influence market movements
- Unemployment shows a weaker relationship
- Liquidity plays a major role in driving stock market growth

## Limitations
- Presence of autocorrelation and heteroskedasticity
- Some variables are non-stationary
- Model assumes linear relationships

## Conclusion
Macroeconomic factors significantly influence stock market performance, with liquidity and inflation emerging as key drivers. The study highlights the importance of incorporating economic indicators into investment decision-making.

## Files
- macroeconomic_analysis.R → Code
- macroeconomic_analysis_report.pdf → Detailed analysis
