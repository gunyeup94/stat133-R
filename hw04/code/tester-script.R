# ===================================================================
# Title: tester-script.R
# Description: create a test-reporter to see if test has been passed or not 
# Input(s): functions.R, tests.R
# Output(s): test-reporter.txt
# Author: Gun Yeup Kim
# Date: 11-18-2017
# ===================================================================

#setwd("C:/Users/Gun Yeup Kim/stat133/stat133-hws-fall17/hw04/code")
#test script
library(testthat)

#source in functions to be tested
source("functions.R")

sink('../output/test-reporter.txt')
test_file('tests.R')
sink()
