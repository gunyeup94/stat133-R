# ===================================================================
# Title: clean-data-script.R
# Description: create a csv data file after data preparation  
# Input(s): rawscores.csv
# Output(s): summary-cleanscores.txt, Homework-stats, Lab-stats, Overall-stats, Quiz-stats, summary-cleanscores, summary-rawscores, Test1-stats, Test2-stats, cleanscores.csv
# Author: Gun Yeup Kim
# Date: 11-18-2017
# ===================================================================


raw_score <- read.csv("../data/rawdata/rawscores.csv")

library(stringr)
source("functions.R")
raw_score$ATT <- as.numeric(raw_score$ATT)
raw_score$QZ2 <- as.numeric(raw_score$QZ2)
raw_score$QZ4 <- as.numeric(raw_score$QZ4)


#Printing out the summary of rawscores
sink("../output/summary-rawscores.txt")

str(raw_score)
name_col <- colnames(raw_score)

for(i in 1:ncol(raw_score)){
  print(name_col[i])
  print_summary <- summary_stats(raw_score[[i]])
  print_stats(print_summary)
}
sink()

#Changing NA to 0
change_to_zero <- raw_score

for(i in 1:ncol(change_to_zero)){
  for(x in 1:length(change_to_zero[[i]])){
    if(is.na(change_to_zero[[i]][x])){
      change_to_zero[[i]][x] <- 0
    }
  }
}

#rescale quizzes 
change_to_zero$QZ1 <-  rescale100(change_to_zero$QZ1, 0, 12)
change_to_zero$QZ2 <- rescale100(change_to_zero$QZ2, 0, 18)
change_to_zero$QZ3 <- rescale100(change_to_zero$QZ3, 0,20)
change_to_zero$QZ4 <- rescale100(change_to_zero$QZ4, 0, 20)

#rescale test1 and test2
Test1 <- rescale100(change_to_zero$EX1, 0,80)
Test2 <- rescale100(change_to_zero$EX2, 0,90)
change_to_zero$Test1 <- Test1
change_to_zero$Test2 <- Test2

#Drop the lowest hw and get average of hws
all_hw <- c()
for (i in 1:nrow(change_to_zero)) {
  individual_hw <- c()
  individual_hw <- append(individual_hw,change_to_zero[[i,"HW1"]])
  individual_hw <- append(individual_hw,change_to_zero[[i,"HW2"]])
  individual_hw <- append(individual_hw,change_to_zero[[i,"HW3"]])
  individual_hw <- append(individual_hw,change_to_zero[[i,"HW4"]])
  individual_hw <- append(individual_hw,change_to_zero[[i,"HW5"]])
  individual_hw <- append(individual_hw,change_to_zero[[i,"HW6"]])
  individual_hw <- append(individual_hw,change_to_zero[[i,"HW7"]])
  individual_hw <- append(individual_hw,change_to_zero[[i,"HW8"]])
  individual_hw <- append(individual_hw,change_to_zero[[i,"HW9"]])
  overall_hw <- score_homework(individual_hw,drop=TRUE)
  all_hw <- append(all_hw,overall_hw)
}
change_to_zero$Homework <- all_hw

#Drop the lowest quiz and get average of quizzes
all_quizzes <- c()
for (i in 1:nrow(change_to_zero)) {
  individual_quizzes <- c()
  individual_quizzes <- append(individual_quizzes,change_to_zero[[i,"QZ1"]])
  individual_quizzes <- append(individual_quizzes,change_to_zero[[i,"QZ2"]])
  individual_quizzes <- append(individual_quizzes,change_to_zero[[i,"QZ3"]])
  individual_quizzes <- append(individual_quizzes,change_to_zero[[i,"QZ4"]])
  overall_quizzes <- score_quiz(individual_quizzes,drop=TRUE)
  all_quizzes <- append(all_quizzes,overall_quizzes)
}
change_to_zero$Quiz <- all_quizzes

#Calculating lab score
all_labs <- c()
for(i in 1:nrow(change_to_zero)){
  individual_labs <-  c()
  individual_labs <-  append(individual_labs, change_to_zero[[i,"ATT"]])
  overall_labs <-  score_lab(individual_labs)
  all_labs <- append(all_labs, overall_labs)
}
change_to_zero$Lab <- all_labs

#Calculating Overall score
all_scores <- c()
for(i in 1:nrow(change_to_zero)){
  individual_score <- c()
  individual_score <- append(individual_score, change_to_zero[[i,"Test1"]])
  individual_score <- append(individual_score, change_to_zero[[i,"Test2"]])
  individual_score <- append(individual_score, change_to_zero[[i,"Lab"]])
  individual_score <- append(individual_score, change_to_zero[[i,"Quiz"]])
  individual_score <- append(individual_score, change_to_zero[[i,"Homework"]])
  calculate_score <- (individual_score[1]*.2)+(individual_score[2]*.25)+(individual_score[3]*.1)+(individual_score[4]*.15)+(individual_score[5]*.3)
  all_scores <- append(all_scores, calculate_score)
}

change_to_zero$Overall <- all_scores

#Get the letter grade
all_grade <- c()
for(i in 1:nrow(change_to_zero)){
  individual_grade <- c()
  individual_grade <- append(individual_grade, change_to_zero[[i,"Overall"]])
  if(individual_grade < 50){
    Lgrade <- "F"
  }else if(individual_grade >= 50 & individual_grade <60){
    Lgrade <- "D"
  }else if(individual_grade >= 60 & individual_grade <70){
    Lgrade <- "C-"
  }else if(individual_grade >= 70 & individual_grade <77.5){
    Lgrade <- "C"
  }else if(individual_grade >= 77.5 & individual_grade <79.5){
    Lgrade <- "C+"
  }else if(individual_grade >= 79.5 & individual_grade <82){
    Lgrade <- "B-"
  }else if(individual_grade >= 82 & individual_grade <86){
    Lgrade <- "B"
  }else if(individual_grade >= 86 & individual_grade <88){
    Lgrade <- "B+"
  }else if(individual_grade >= 88 & individual_grade <90){
    Lgrade <- "A-"
  }else if(individual_grade >= 90 & individual_grade <95){
    Lgrade <- "A"
  }else if(individual_grade >= 95 & individual_grade <=100){
    Lgrade <- "A+"
  }
  all_grade <- append(all_grade, Lgrade)
}
change_to_zero$Grade <- all_grade

#Printing summaries of codified variables
columnlist=c("Lab","Homework","Quiz","Test1","Test2","Overall")
for (i in columnlist){
  filename=paste("../output/","-stats.txt",sep=i)
  sink(file = filename)
  columndata=as.numeric(change_to_zero[[i]])
  column_summary_stat=(summary_stats(columndata))
  (print_stats(column_summary_stat))
  sink()
}

#printing the summary of cleanscores
sink("../output/summary-cleanscores.txt")
str(change_to_zero)
sink()

#write out the cleanscores to csv file
write.csv(change_to_zero,"../data/cleandata/cleanscores.csv")

