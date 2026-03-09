# Correlation
# Types of correlation
# Pearson (r): Measures the linear relationship between continuous, quantitative variables.
# Spearman Rank ( - rho): Measures the monotonic, non-parametric relationship using ranks.
# Kendall Rank ( - tau): Used for non-parametric ordinal data, particularly in smaller samples.

# Most common use of correlation is Pearson
# We will find correlation using two different libaries

# Using Psych
# load_dataset
# after successfully loading data which is in practice
View(practice)
# Import package
library(psych)
# first of all get all those columns that are numeric
# There are two methods to do this
# first: use index method like following we will check which column is not numeric and remove that
correlation <- corr.test(practice[-5])
print(correlation)

# Second: write all numeric columns in vector format
correlation <-corr.test(practice[c('Petal_width', 'Petal_length', 'Sepal_width', 'Sepal_length')])
print(correlation)


# Display correlation in graphs
pairs.panels(practice[-5])
# display correlation strength
pairs.panels(practice[-5], stars = TRUE)


# Second method will use corrplot
library(corrplot)
# finding correlation matrix
cor_matrix <- cor(practice[-5])
# Applying different types of visuals/display on correlation matrix
corrplot(cor_matrix, method="color")
corrplot(cor_matrix, method="number")
corrplot(cor_matrix, method="circle")
corrplot(cor_matrix, method="square")
corrplot(cor_matrix, method="ellipse")
corrplot(cor_matrix, method="shade")
corrplot(cor_matrix, method="pie")







