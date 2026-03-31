# After loading dataset first task is preprocessing
str(sales_data)
# We have to convert data into proper formats
sales_data[['Sale_Date']] <- as.Date(sales_data[['Sale_Date']], format = "%Y-%m-%d")
# We have to convert categories into factors
unique(sales_data[["Sales_Rep"]])
unique(sales_data[["Product_Category"]])
unique(sales_data[["Customer_Type"]])
unique(sales_data[["Region_and_Sales_Rep"]])
unique(sales_data[["Sales_Channel"]])
unique(sales_data[["Payment_Method"]])
sales_data[['Month']] <- format(sales_data[['Sale_Date']], "%Y-%m")
sales_data[['Sales_Rep']] <- as.factor(sales_data[['Sales_Rep']])
sales_data[['Region']] <- as.factor(sales_data[['Region']])
sales_data[['Product_Category']] <- as.factor(sales_data[['Product_Category']])
sales_data[['Customer_Type']] <- as.factor(sales_data[['Customer_Type']])
sales_data[['Region_and_Sales_Rep']] <- as.factor(sales_data[['Region_and_Sales_Rep']])
sales_data[['Sales_Channel']] <- as.factor(sales_data[['Sales_Channel']])
sales_data[['Payment_Method']] <- as.factor(sales_data[['Payment_Method']])



if(!require(GWalkR)) install.packages("GWalkR")
library(GWalkR)
gwalkr(sales_data)

str(sales_data)

if(!require(esquisse)) install.packages("esquisse")
library(esquisse)
esquisser(sales_data, viewer = "browser")

