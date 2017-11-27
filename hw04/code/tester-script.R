#setwd("C:/Users/Gun Yeup Kim/stat133/stat133-hws-fall17/hw04/code")
#test script
library(testthat)

#source in functions to be tested
source("functions.R")

sink('../output/test-reporter.txt')
test_file('tests.R')
sink()
