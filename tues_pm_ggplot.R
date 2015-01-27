# Tuesday afternoon ggplot exercises for R Workshop
# Install libraries
install.packages("ggplot2", dependencies=TRUE)
install.packages("plyr")
install.packages("ggthemes")
install.packages("reshape2")

# Load libraries
library("ggplot2")
library("plyr")
library("ggthemes")
library("reshape2")

# Iris dataset
myplot <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width))
summary(myplot)

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
        geom_point()
myplot + geom_point()

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
        geom_point(size = 3)

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
        geom_point(aes(shape = Species), size = 3)

# Diamonds dataset
d2 <- diamonds[sample(1:dim(diamonds)[1], 1000), ]
ggplot(d2, aes(carat, price, color = color)) +
        geom_point()

# Boxplots
library(MASS)
ggplot(birthwt, aes(factor(race), bwt)) + geom_boxplot()
ggplot(birthwt, aes(factor(race), bwt)) + geom_boxplot(color = "green", fill = "purple", outlier.colour = "yellow", outlier.size = 16)

# Color Brewer Palette (this is a premade color palette with different preassigned color schemes)
df <- melt(iris, id.vars = "Species")
ggplot(df, aes(Species, value, fill = variable)) +
        geom_bar(stat = "identity", position = "dodge") +
        scale_fill_brewer(palette = "Set1")

# Histogram
h <- ggplot(faithful, aes(x = waiting))
h + geom_histogram(binwidth = 30)
h + geom_histogram(binwidth = 8, fill = "steelblue", color = "black")

# Bar Plots
ggplot(iris, aes(Species, Sepal.Length)) + geom_bar(stat = "identity")
# above makes a bar plot with additive values. If you want a bar plot with means (instead
# of a box plot which is probably a better representation):
df <- melt(iris, id.vars = "Species")
ggplot(df, aes(Species, value, fill = variable)) + geom_bar(stat = "identity")
# above makes a an additive bar plot with color differentiation
ggplot(df, aes(Species, value, fill = variable)) + 
        geom_bar(stat = "identity", position = "dodge", color = "black")
# above makes a bar plot with each intance overlaid: height of bars = max.

#histogram with d2 dataset:
ggplot(d2, aes(x = clarity, fill = cut)) + geom_histogram(position = "dodge")
#OR
ggplot(d2, aes(x = clarity, fill = cut)) + geom_bar(stat = "bin", position = "dodge")
# stat = bin in the bar plot makes the y axis a count. It's actually the default and
# doesn't need to be included.

# Density plots
ggplot(faithful, aes(waiting)) + geom_density()
ggplot(faithful, aes(waiting)) + geom_density(fill = "blue", alpha = 0.1)
# alpha is a transparency setting

# Regrression lines
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
        geom_point(aes(shape = Species), size = 3) +
        geom_smooth(method = "lm")
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
        geom_point(aes(shape = Species), size = 3) +
        geom_smooth(method = "lm") +
        facet_wrap( ~ Species)
