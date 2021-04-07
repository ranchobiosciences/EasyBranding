## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
collapse = TRUE,
comment = "#>"
)

## ----fig.width=6--------------------------------------------------------------
library(EasyBranding)
library(ggplot2)
library(ggprism)

theme_set(theme_prism() + theme(aspect.ratio = 0.4))
p <- ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color = Species)) +
  geom_point(size = 2) +
  geom_smooth(formula = 'y ~ x', method = 'glm', se = F)

p + scale_color_brand() + 
  labs(title='main palette')
p + scale_color_brand(palette = 'dark') + 
  labs(title='dark palette')
p + scale_color_brand(reverse = T) +
  labs(title='reverse main palette')

## ----fig.width=6--------------------------------------------------------------
df <- data.frame(category = LETTERS[1:20],
                 value = runif(20)+1)
p <- ggplot(df, aes(category, value, fill = category)) +
  geom_col()
p + scale_fill_brand() + 
  labs(title='main palette') +
  theme(legend.position = 'none')
p + scale_fill_brand(palette = "all") + 
  labs(title='*all* palette') +
  theme(legend.position = 'none')

