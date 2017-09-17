Warmup02
================
Gun Yeup Kim
2017년 9월 14일

R Markdown
----------

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

``` r
  #download data
  url = paste0('https://github.com/ucb-stat133/stat133-hws-fall17/', 'raw/master/warmup02/data/nba2017-salary-points.RData')
destfile = "nba2017-salary-points.RData"
load("nba2017-salary-points.RData")
```

``` r
  #evaluating points
  summary(points)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##     0.0   156.0   432.0   546.6   780.0  2558.0

``` r
  hist(points)
```

![](up02-Gun-Kim_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-2-1.png)

``` r
  boxplot(points)
```

![](up02-Gun-Kim_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-2-2.png)

``` r
  plot(density(points))
```

![](up02-Gun-Kim_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-3-1.png)

``` r
  #adding a Normal Curve
  x <- points
  xfit <- seq(min(x), max(x), length = 2500)
  yfit <- dnorm(xfit, mean = mean(x), sd = sd(x))
  plot(density(yfit))
```

![](up02-Gun-Kim_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-3-2.png)
