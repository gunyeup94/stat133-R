#title: "hw03"
#author: "Gun Yeup Kim"
#date: "2017 10 13"
#input(s): nba2017-roster.csv, nba2017-stats.csv
#output(s): nba2017-teams.csv, star plot, scatterplot, summary of teams and efficiency


library(dplyr)
library(ggplot2)
setwd("c:/Users/Gun Yeup Kim/stat133/stat133-hws-fall17/hw03/code")
roster <- read.csv("../data/nba2017-roster.csv",stringsAsFactors = FALSE)
stat <- read.csv("../data/nba2017-stats.csv",stringsAsFactors = FALSE)
missed_fg <- stat$field_goals_atts - stat$field_goals_made
missed_ft <- stat$points1_atts - stat$points1_made
points <- stat$points3_made*3+stat$points2_made*2+stat$points1_made
rebounds <- stat$off_rebounds+stat$def_rebounds
stat <- stat %>% mutate(missed_fg,missed_ft,points,rebounds)
efficiency <- (stat$points +stat$rebounds+stat$assists+stat$steals+stat$blocks-stat$missed_fg-stat$missed_ft-stat$turnovers)/stat$games_played
stat <- stat %>% mutate(efficiency)
sink(file = "../output/efficiency-summary.txt")
summary(efficiency)
merge_roster_stat <- merge(stat,roster)
teams <- data.frame(team = merge_roster_stat$team,experience = merge_roster_stat$experience,salary = merge_roster_stat$salary,points3 = merge_roster_stat$points3_made, points2 = merge_roster_stat$points2_made, free_throws = merge_roster_stat$points1_made, points = merge_roster_stat$points, off_rebounds = merge_roster_stat$off_rebounds, def_rebounds = merge_roster_stat$def_rebounds, assists = merge_roster_stat$assists, steals = merge_roster_stat$steals, blocks = merge_roster_stat$blocks, tunrovers = merge_roster_stat$turnovers, fouls = merge_roster_stat$fouls, efficiency = merge_roster_stat$efficiency)
experience <- teams %>% group_by(team) %>% summarise(experience = round(sum(experience), digits = 2))
salary <- teams %>% group_by(team) %>% summarise(salary = round(sum(salary)/1000000,digits =2))
points3 <- teams %>% group_by(team) %>% summarise(points3 = sum(points3))
points2 <- teams %>% group_by(team) %>% summarise(points2 = sum(points2))
free_throws <- merge_roster_stat %>% group_by(team) %>% summarise(free_throws = sum(points1_made))
off_rebounds <- teams %>% group_by(team) %>% summarise(off_rebounds = sum(off_rebounds))
def_rebounds <- teams %>% group_by(team) %>% summarise(def_reounds = sum(def_rebounds))
assists <- teams %>% group_by(team) %>% summarise(assists = sum(assists))
steals <- teams %>% group_by(team) %>% summarise(steals = sum(steals))
blocks <- teams %>% group_by(team) %>% summarise(blocks = sum(blocks))
turnovers <- teams %>% group_by(team) %>% summarise(turnovers = sum(tunrovers))
fouls <- teams %>% group_by(team) %>% summarise(fouls = sum(fouls))
efficiency <- teams %>% group_by(team) %>% summarise(efficiency = sum(efficiency))
points <- merge_roster_stat %>% group_by(team) %>% summarise(points = sum(points))
final_organized_team <- merge(experience,salary)
final_organized_team <- merge(final_organized_team,points3)
final_organized_team <- merge(final_organized_team,points2)
final_organized_team <- merge(final_organized_team,free_throws)
final_organized_team <- merge(final_organized_team,points)
final_organized_team <- merge(final_organized_team,off_rebounds)
final_organized_team <- merge(final_organized_team,def_rebounds)
final_organized_team <- merge(final_organized_team,assists)
final_organized_team <- merge(final_organized_team,steals)
final_organized_team <- merge(final_organized_team,blocks)
final_organized_team <- merge(final_organized_team,turnovers)
final_organized_team <- merge(final_organized_team,fouls)
final_organized_team <- merge(final_organized_team,efficiency)
final_organized_team$team <- as.character(final_organized_team$team)

sink(file = "../data/teams-summary.txt")
summary(final_organized_team)
write.csv(final_organized_team,file = "../data/nba2017-teams.csv")
pdf(file = "../images/teams_star_plot.pdf")
stars(final_organized_team[,-1], labels = final_organized_team$team)
dev.off()
pdf(file = "../images/experience_salary.pdf")
ggplot(final_organized_team, aes(x = experience, y = salary))+geom_label(label = final_organized_team$team)
dev.off()
