# ===================================================================
# Title: functions.R
# Description: create functions to get the finalized grade for 334 students.  
# Input(s):
# Output(s): 
# Author: Gun Yeup Kim
# Date: 11-18-2017
# ===================================================================

#removing missing
remove_missing <- function(x){
  if(is.numeric(x)){
  nona_x <- x[!is.na(x)]
  return(nona_x)
  }else{
    stop("Non-numeric argument")
  }
}


#getting a minimum of the vector
get_minimum <- function(x,na.rm = FALSE){
  if(is.numeric(x)){
    if(na.rm == TRUE){
      x <- remove_missing(x)
      min <- x[1]
      for(i in 2:length(x)){
        if(x[i] < min)
          min <- x[i]
      }
      min
    }else{
      return(NA)
    }
  }else{
    stop("Non-numeric argument")
  }
}


#getting a maximum of the vector
get_maximum <- function(x, na.rm = FALSE){
  if(is.numeric(x)){
    if(na.rm == TRUE){
      x <- remove_missing(x)
      maxi <- x[1]
      for(i in 2:length(x)){
        if(x[i] > maxi)
          maxi <- x[i]
      }
      maxi
    }else{
      return(NA)
    }
  }else{
    stop("Non-numeric argument")
  }
}

#getting a range of the vector
get_range <- function(x, na.rm = FALSE){
  if(is.numeric(x)){
    if(na.rm == TRUE){
      rangeX <- get_maximum(x, na.rm = TRUE)-get_minimum(x, na.rm = TRUE)
      return(rangeX)
    }else{
      return(NA)
    }
  }else{
    stop("Non-numeric argument")
  }
}

#getting a 10th percentile of the input vector
get_percentile10 <- function(x, na.rm = FALSE){
  if(is.numeric(x)){
    if(na.rm == TRUE){
      per10 <- quantile(x, seq(0,1,0.10), na.rm = TRUE, names = FALSE)
      per10[2]
    }else{
      return(NA)
    }
  }else{
    stop("Non-numeric argument")
  }
}

#getting a 90th percentile of the input vector
get_percentile90 <- function(x, na.rm = FALSE){
  if(is.numeric(x)){
    if(na.rm == TRUE){
      per90 <- quantile(x, seq(0,1,0.10), na.rm = TRUE, names = FALSE)
      per90[10]
    }else{
      return(NA)
    }
  }else{
    stop("Non-numeric argument")
  }
}

#getting a median
get_median <- function(x, na.rm = FALSE){
  if(is.numeric(x)){
    if(na.rm == TRUE){
      x <- remove_missing(x)
      x <- sort(x)
      if(length(x)%%2 == 0){
        num <- length(x)/2
        medianX <- (x[num] + x[num+1])/2
      }else{
        num <- (length(x)+1)/2
        medianX <- x[num]
      }
      medianX
    }else{
      return(NA)
    }
  }else{
    stop("Non-numerice argument")
  }
}

#getting an average
get_average <- function(x, na.rm = FALSE){
  if(is.numeric(x)){
    if(na.rm == TRUE){
      x <- remove_missing(x)
      initial <- x[1]
      for(i in 2:length(x)){
        initial <-  initial + x[i]
      }
      averageX <- initial/length(x)
      return(averageX)
    }else{
      return(NA)
    }
  }else{
    stop("Non-numeric argument")
  }
}

#getting an standard deviation
get_stdev <- function(x, na.rm = FALSE){
  if(is.numeric(x)){
    if(na.rm == TRUE){
      x <- remove_missing(x)
      aveX <- get_average(x, na.rm = TRUE)
      initial <- (x[1]-aveX)^2
      for(i in 2:length(x)){
        initial <- initial + (x[i] - aveX)^2
      }
      sdX <- sqrt((1/(length(x)-1))*initial)
      return(sdX)
    }else{
      return(NA)
    }
  }else{
    stop("Non-numeric argument")
  }
}

#getting the first quartile
get_quartile1 <- function(x, na.rm = FALSE){
  if(is.numeric(x)){
    if(na.rm == TRUE){
      first_quart <- quantile(x, na.rm = TRUE, names =FALSE)
      first_quart[2]
    }else{
      return(NA)
    }
  }else{
    stop("Non-numeric argument")
  }
}

#getting the third quartile
get_quartile3 <- function(x, na.rm = FALSE){
  if(is.numeric(x)){
    if(na.rm == TRUE){
      third_quart <- quantile(x, na.rm = TRUE, names = FALSE)
      third_quart[4]
    }else{
      return(NA)
    }
  }else{
    stop("Non-numeric argument")
  }
}

#counting the number of missing values
count_missing <- function(x){
  change_to_logic <- is.na(x)
  countMissing <- sum(change_to_logic)
  countMissing
}

#getting the summary of statistic
summary_stats <- function(x){
  stat_list <- list(minimum = get_minimum(x, na.rm = TRUE),
                 percent10 = get_percentile10(x, na.rm =TRUE),
                 quartile1 = get_quartile1(x, na.rm = TRUE),
                 median = get_median(x, na.rm = TRUE),
                 mean = get_average(x, na.rm = TRUE),
                 quartile3 = get_quartile3(x, na.rm = TRUE),
                 percent90 = get_percentile90(x, na.rm = TRUE),
                 maximum = get_maximum(x, na.rm = TRUE),
                 range = get_range(x, na.rm = TRUE),
                 stdev = get_stdev(x, na.rm = TRUE),
                 missing = count_missing(x))
  stat_list
}

#printing list of summary statistic
print_stats <- function(x){
  for(i in 1:length(x)){
    cat(str_pad(names(x)[i], 9, "right"), ":", sprintf("%.4f", x[i]), "\n")
  }
}


#creating rescale 100
rescale100 <- function(x, xmin, xmax){
  if(is.numeric(x)){
  z <- 100*((x - xmin)/(xmax - xmin))
  z
  }else{
    stop("Non-numeric argument")
  }
}

#dropping the lowest value
drop_lowest <- function(x){
  if(is.numeric(x)){
    lowest <- get_minimum(x, na.rm = TRUE)
    for(i in 1:length(x)){
      if(x[i] == lowest){
        new_list <- x[-i]
      }
    }
    new_list
  }else{
    stop("Non-numeric argument")
  }
}

#creating function to average out the homeworks
score_homework <- function(x, drop = FALSE){
  if(is.numeric(x)){
    if(drop == TRUE){
      new_dropped_list <- drop_lowest(x)
      aveX <- get_average(new_dropped_list, na.rm = TRUE)
    }else{
      aveX <- get_average(x,na.rm = TRUE)
    }
    aveX
  }else{
    stop("Non-numeric argument")
  }
}

#creating function to average out the quizzes
score_quiz <- function(x, drop = FALSE){
  if(is.numeric(x)){
    if(drop == TRUE){
      dropped_list <- drop_lowest(x)
      aveX <- get_average(dropped_list, na.rm = TRUE)
    }else{
      aveX <- get_average(x, na.rm = TRUE)
    }
    aveX
  }else{
    stop("Non-numeric argument")
  }
}

#creating function for lab score
score_lab <-  function(x){
  if(is.numeric(x)){
    if(x <= 6){
      return(0)
    }else if(x == 7){
      return(20)
    }else if(x == 8){
      return(40)
    }else if(x == 9){
      return(60)
    }else if(x == 10){
      return(80)
    }else if(x == 11 | x == 12){
      return(100)
    }
  }else{
    stop("Non-numeric argument")
  }
}


