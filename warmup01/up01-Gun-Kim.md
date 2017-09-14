Untitled
================
Gun Yeup Kim
2017 9 9

R Markdown
----------

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

``` r
  #How to cook pasta
  print("Fill a large pot2/3 of the way with water. Bring the water to a boil over high heat. Add the pasta and stir. Reduce to medium or medium hihg. Cook for 8 to 10 minutes. Pour the pasta through a strainer. Shake out the excess water.")
```

    ## [1] "Fill a large pot2/3 of the way with water. Bring the water to a boil over high heat. Add the pasta and stir. Reduce to medium or medium hihg. Cook for 8 to 10 minutes. Pour the pasta through a strainer. Shake out the excess water."

``` r
  #Quadratic eqaution
print("quadratic equation (from the Latin quadratus for square) is any equation having the form where x represents an unknown, and a, b, c represent known numbers such that a is not equal to 0")
```

    ## [1] "quadratic equation (from the Latin quadratus for square) is any equation having the form where x represents an unknown, and a, b, c represent known numbers such that a is not equal to 0"

``` r
a = 4
b=4
c=5
x = 3
QE <- a*x^2+b*x+c
Root1 <- ((-1)*b+sqrt(b^2-4*a*c))/(2*a)
```

    ## Warning in sqrt(b^2 - 4 * a * c): NaNAI ≫y¼ºμC¾u½A´I´U

``` r
Root2 <- ((-1)*b-sqrt(b^2-4*a*c))/(2*a)
```

    ## Warning in sqrt(b^2 - 4 * a * c): NaNAI ≫y¼ºμC¾u½A´I´U

``` r
print("calculating the roots was hard. Nothing was easy. Yes this is my first time using markdown.")
```

    ## [1] "calculating the roots was hard. Nothing was easy. Yes this is my first time using markdown."
