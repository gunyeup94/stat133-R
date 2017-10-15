## Data 'nba2017-stats.csv'

Here's the description of the R objects in 'nba2017-stats.csv':

+ `Player`: first and last names of player
+ `games_played`: Games Played furing regular season
+ `mintues`: Minutes Played during regular season
+ `field_goal_made`: Field Goals Made
+ `field_goal_attempts`: Field Goal Attempts
+ `Points3`: 3-Point Field Goals
+ `Points3_atts`: 3-Point Field Goal Attempts
+ `Points2`: 2-Point Field Goals
+ `Points2_atts`: 2-Point Field Goal Attempts
+ `points1`: Free Throws Made
+ `points1_atts`: Free Throw Attempts
+ `off_rebounds`: Offensive Rebounds
+ `def_rebounds`: Defensive Rebounds
+ `assits`: Assists
+ `steal`: Steals
+ `block`: Blocks
+ `turnovers`: Turnovers

codified missing variable

```
Missed_FG (missed field goals) = Field Goal Attemt - Field Goal Made
```
```
Missed_FT (missed free throws) = Free Throw Attemt - Free Throw Made
```
```
points (total points) = Free Throw Made + 2*points2 + 3*points3
```
```
rebound (total rebounds: offensive and defensive) = Offensive Rebound + Defensive Rebound
```
```
efficiency (total efficiency: sum of varibles and divide it by games played) = points + rebounds + assists + steals + blocks -missed_fg - missed_ft - turnovers)/games_played
```