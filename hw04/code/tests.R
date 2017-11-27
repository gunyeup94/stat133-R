# ===================================================================
# Title: tests.R
# Description: create functions to test out functions from functions.R  
# Input(s): functions.R
# Output(s): 
# Author: Gun Yeup Kim
# Date: 11-18-2017
# ===================================================================

library(testthat)
source("functions.R")

#testing remove_missing function
context("Test to remove missing Variable")

test_that("Remove missing variable",{
  a <- c(1,4,7,NA,NA,10)
  b <- c(NA,NA,NA,3,4,NA,5)
  expect_equal(remove_missing(a), c(1,4,7,10))
  expect_that(length(remove_missing(a)), equals(4))
  expect_equal(remove_missing(b), c(3,4,5))
  expect_that(length(remove_missing(b)), equals(3))
})

context("Test to get a minimum number")

test_that("Getting a minimum number",{
  a <- sample(20)
  b <- c(3,4,5,1,2,9,55,NA,NA,43)
  expect_equal(get_minimum(a, na.rm = TRUE), min(a, na.rm = TRUE))
  expect_that(get_minimum(b, na.rm = TRUE), equals(1))
  expect_equal(get_minimum(b), NA)
  expect_equal(get_minimum(b, na.rm = TRUE), min(b, na.rm = TRUE))
})

context("Test to get a maximum number")

test_that("Getting a maximum number",{
  a <- sample(20)
  b <- c(3,4,5,1,2,9,55,NA,NA,43)
  expect_equal(get_maximum(a, na.rm = TRUE), max(a, na.rm = TRUE))
  expect_that(get_maximum(b, na.rm = TRUE), equals(55))
  expect_equal(get_maximum(b), NA)
  expect_equal(get_maximum(b, na.rm = TRUE), max(b, na.rm = TRUE))
})

context("Test to get a range")

test_that("Getting a range",{
  a <- c(1,3,5,7,9,11)
  b <- c(0,NA,100,3,2,4,6,5)
  expect_equal(get_range(a), NA)
  expect_equal(get_range(a, na.rm = TRUE), 10)
  expect_equal(get_range(b, na.rm = TRUE), 100)
  expect_equal(get_range(b),NA)
})

context("Test to get a 10th percentile")

test_that("10th percentile",{
  a <- c(1,4,7, NA, 10)
  b <- c(3,4,5,2,6,7)
  expect_equal(get_percentile10(a, na.rm = TRUE),1.9)
  expect_equal(get_percentile10(a), NA)
  expect_equal(get_percentile10(b, na.rm = TRUE), 2.5)
  expect_equal(get_percentile10(b), NA)
})

context("Test to get a 90th percentile")

test_that("90th percentile",{
  a <- c(1,4,7, NA, 10)
  b <- c(3,4,5,2,6,7)
  expect_equal(get_percentile90(a, na.rm = TRUE),9.1)
  expect_equal(get_percentile90(a), NA)
  expect_equal(get_percentile90(b, na.rm = TRUE), 6.5)
  expect_equal(get_percentile90(b), NA)
})

context("Test to get the median")

test_that("Get the median",{
  a <- c(1,4,7, NA, 10)
  b <- c(3,4,5,2,6,7)
  expect_equal(get_median(a, na.rm = TRUE), 5.5)
  expect_equal(get_median(a), NA)
  expect_equal(get_median(b, na.rm = TRUE), 4.5)
  expect_equal(get_median(b), NA)
})

context("Test to get the average")

test_that("Get the average",{
  a <- c(1,4,7, NA, 10)
  b <- c(3,4,5,2,6,7)
  expect_equal(get_average(a, na.rm = TRUE), mean(a, na.rm = TRUE))
  expect_equal(get_average(a),NA)
  expect_equal(get_average(b, na.rm = TRUE), mean(b))
  expect_equal(get_average(b), NA)
})

context("Test to get the standard deviation")

test_that("Get the SD",{
  a <- c(1,4,7, NA, 10)
  b <- c(3,4,5,2,6,7)
  expect_equal(get_stdev(a, na.rm = TRUE), sd(a, na.rm = TRUE))
  expect_equal(get_stdev(a), NA)
  expect_equal(get_stdev(b, na.rm = TRUE), sd(b))
  expect_equal(get_stdev(b), NA)
})

context("Test to get the first quartile")

test_that("Get the 1st quartile",{
  a <- c(1,4,7, NA, 10)
  b <- c(3,4,5,2,6,7)
  expect_equal(get_quartile1(a,na.rm = TRUE),3.25)
  expect_equal(get_quartile1(a),NA)
  expect_equal(get_quartile1(b, na.rm = TRUE), 3.25)
  expect_equal(get_quartile1(b), NA)
})

context("Test to get the third quartile")

test_that("Get the 3rd quartile",{
  a <- c(1,4,7, NA, 10)
  b <- c(3,4,5,2,6,7)
  expect_equal(get_quartile3(a,na.rm = TRUE),7.75)
  expect_equal(get_quartile3(a),NA)
  expect_equal(get_quartile3(b, na.rm = TRUE), 5.75)
  expect_equal(get_quartile3(b), NA)
})

context("Test to get the number of missing values")

test_that("Get the number of missing values",{
  a <- c(1,4,7, NA, 10)
  b <- c(NA,NA,NA,NA,NA,2)
  c <- c(NA,NA,3,4,5,1,NA)
  d <- c(1,2,3,4,5,6,5)
  expect_equal(count_missing(a),1)
  expect_equal(count_missing(b), 5)
  expect_equal(count_missing(c), 3)
  expect_equal(count_missing(d), 0)
})

context("Test to get the summary of stats")

test_that("Get the summary of the stats",{
  a <- c(1,4,7, NA, 10)
  stats_for_test <- summary_stats(a)
  expect_equal(stats_for_test$minimum, get_minimum(a,na.rm = TRUE))
  expect_equal(stats_for_test$median, get_median(a, na.rm = TRUE))
  expect_equal(stats_for_test$maximum, get_maximum(a,na.rm =TRUE))
  expect_equal(stats_for_test$range, get_range(a, na.rm = TRUE))
})

context("Test to rescale to 100")

test_that("Get the rescale100",{
  b <-c(18, 15, 16,4,17,9)
  new_b <- rescale100(b, 0,20)
  expect_equal(new_b[1], 90)
  expect_equal(new_b[2], 75)
  expect_equal(new_b[3], 80)
  expect_equal(new_b[4], 20)
})

context("Test to drop the lowest value")

test_that("Drop the lowest value",{
  a <- c(56,66,77,88,45,64)
  b <- c(1,2,3,4,5,6,7)
  c <- c(4,55,1)
  d <- c(939,3)
  expect_equal(drop_lowest(a), c(56,66,77,88,64))
  expect_equal(drop_lowest(b), c(2,3,4,5,6,7))
  expect_equal(drop_lowest(c), c(4,55))
  expect_equal(drop_lowest(d), 939)
})

context("Test to score homework")

test_that("Get the average of homework score",{
  hws <- c(100,80,30,70,75,85)
  hws2 <-c(90,90,90,90,90,90)
  expect_equal(score_homework(hws, drop = TRUE), 82)
  expect_equal(score_homework(hws, drop = FALSE), mean(hws))
  expect_equal(score_homework(hws2, drop = FALSE), 90)
  expect_equal(score_homework(hws2, drop = TRUE), 90)
})

context("Test to score quiz")

test_that("Get the average of quiz score",{
  q <- c(100, 80,70,0)
  q2 <- c(100,100,99,98)
  expect_equal(score_quiz(q, drop = TRUE), mean(c(100,80,70)))
  expect_equal(score_quiz(q, drop = FALSE), mean(q))
  expect_equal(score_quiz(q2, drop = TRUE), mean(c(100,100,99)))
  expect_equal(score_quiz(q2, drop = FALSE),mean(q2))
})

context("Test to score lab")

test_that("Get the lab score",{
  expect_equal(score_lab(12), 100)
  expect_equal(score_lab(1),0)
  expect_equal(score_lab(8),40)
  expect_equal(score_lab(11),100)
})

