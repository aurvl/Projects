# Factorial Analysis of Mixed Data (FAMD)

# Clearing the workspace
rm(list = ls())

# Install necessary packages
# install.packages(c("FactoMineR", "factoextra"))

# We will use the "adult" dataset from the UCI (University of California, Irvine) archive,
# which is commonly used as a sample dataset in machine learning and statistics contexts.
# This dataset is often used for tasks such as income classification or prediction.

library("FactoMineR")
library("factoextra")

# Import the dataset
url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data"
column_names <- c(
  "age", "workclass", "fnlwgt", "education", "education_num",
  "marital_status", "occupation", "relationship", "race", "sex",
  "capital_gain", "capital_loss", "hours_per_week", "native_country", "income"
)

data_adult <- read.table(url, header = FALSE, sep = ",", col.names = column_names)
rm(column_names)

# Create a subset dataframe named "df".
df <- data_adult[, 1:15]
str(df)

# Remove the redundant "education" variable
# "education" is already numerically coded under education-num, so we will remove it
df <- df[, !names(df) %in% c("education")]

# Convert categorical variables to factors
df$workclass <- as.factor(df$workclass)
df$marital_status <- as.factor(df$marital_status)
df$occupation <- as.factor(df$occupation)
df$relationship <- as.factor(df$relationship)
df$race <- as.factor(df$race)
df$sex <- factor(df$sex)
df$native_country <- as.factor(df$native_country)
df$income <- factor(df$income)

# Delete "?" values in "workclass"
# Supprimer les lignes où la variable 'workclass' contient des '?'
df <- df[!(grepl("\\?", df$workclass) | grepl("\\?", df$native_country) | grepl("\\?", df$occupation)), ]
# Summary of our dataset
head(df[, 1:14], 5)
str(df)
# In the df dataset, we have:
# 8 categorical variables (workclass, marital_status, occupation, relationship, race, sex, native_country, income)
# 6 quantitative variables (age, fnlwgt, education_num, capital_gain, capital_loss, hours_per_week).



# FAMD Execution
res.famd <- FAMD(df, graph = FALSE)
print(res.famd)

# Display eigenvalues (first output)
get_eigenvalue(res.famd)
# Plot the screeplot of explained variance
fviz_screeplot(res.famd)

# Extract results from the loadings of the variables (var).
var <- get_famd_var(res.famd)
var

# "coord" provides the coordinates of the loadings of each quantitative variable w.r.t. each dimension
head(var$coord)

# "Cos2" provides the coordinates of the loadings of each quantitative variable w.r.t each dimension
# through a trigonometric representation
head(var$cos2)

# Graphical representation
fviz_famd_var(res.famd, "quanti", repel = TRUE,
              col.var = "black")

# Contribution of the loadings of different categories of each qualitative variable
# w.r.t. each dimension
fviz_famd_var(res.famd, "quali", repel = TRUE,
              col.var = "black")

# "contrib" provides the coordinates and the contribution (in terms of magnitude) of the loadings of
# each quantitative variable w.r.t each dimension
head(var$contrib)

# Graphical representation of the contribution of the loadings for each variable
# (quantitative and qualitative)
fviz_famd_var(res.famd, "quanti", col.var = "contrib",
              gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
              repel = TRUE)

fviz_famd_var(res.famd, "quali", col.var = "contrib",
              gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"))

# Correlation between variables (in terms of loadings) and the two principal dimensions (dim. 1 & dim. 2).
# For this, the following functions [in the factoextra package] are used:
# "fviz_famd_var()" to plot both quantitative and qualitative variables
# "fviz_contrib()" to visualize the contribution of variables to the principal dimensions (1 & 2)

# Display the coordinates of the original observations to the two dimensions
fviz_famd_var(res.famd, repel = TRUE)

# Contributions of variables to Dimension 1
fviz_contrib(res.famd, "var", axes = 1)
# Contributions of variables to Dimension 2
fviz_contrib(res.famd, "var", axes = 2)

# From the plots above, we can deduce that:
# 1 - The variables which contribute the most to the first dimension are: relationship and marital_status.
# 2 - The variables which contribute the most to the second dimension are: occupation and relationship.

# Scatterplots of the original observations on the dimensions
ind <- get_famd_ind(res.famd)
ind

# Scatterplot of the coordinates of each individual observation w.r.t each dimension
fviz_famd_ind(res.famd, col.ind = "cos2",
              gradient.cols = c("#00AFBB", "#FF0000", "#00FF00", "#000FF", "#FFFF00", "#FF00FF", " #00FFFF", "#800080", "#008080"), invisible = "quali.var",
              repel = TRUE)


# Ellipses
fviz_mfa_ind(res.famd,
             habillage = c( "marital_status", "occupation", "relationship"), # color by groups
             palette = c("#FF0000", "#00FF00", "#003", "#FFFF00", "#FF00FF", "#039", "#800080", "#008080"),
             addEllipses = TRUE, ellipse.type = "confidence", # add an ellipse to cluster observations w.r.t. qualitative labels
             repel = TRUE # Avoid text overlapping
)


fviz_ellipses(res.famd, c( "marital_status", "occupation", "relationship"), repel = TRUE)


