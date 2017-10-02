
## Data 'nba2017-player-statistics.csv'

Here's the description of the R objects in 'nba2017-player-statistics.csv' :

+ `Player`: first and last names of player
+ `Team`: 3-letter team abbreviation
+ `Position`: player’s position
+ `Experience`: years of experience in NBA (a value of R means rookie)
+ `Salary`: player salary in dollars
+ `Rank`: Rank of player in his team
+ `Age`: Age of Player at the start of February 1st of that season.
+ `GP`: Games Played furing regular season
+ `GS`: Games Started
+ `MIN`: Minutes Played during regular season
+ `FGM`: Field Goals Made
+ `FGA`: Field Goal Attempts
+ `Points3`: 3-Point Field Goals
+ `Points3_atts`: 3-Point Field Goal Attempts
+ `Points2`: 2-Point Field Goals
+ `Points2_atts`: 2-Point Field Goal Attempts
+ `FTM`: Free Throws Made
+ `FTA`: Free Throw Attempts
+ `OREB`: Offensive Rebounds
+ `DREB`: Defensive Rebounds
+ `AST`: Assists
+ `STL`: Steals
+ `BLK`: Blocks
+ `TO`: Turnovers

codified missing variable

```
Missed_FG (missed field goals) = Field Goal Attemt - Field Goal Made
```
```
Missed_FT (missed free throws) = Free Throw Attemt - Free Throw Made
```
```
PTS (total points) = Free Throw Made + 2*points2 + 3*points3
```
```
REB (total rebounds: offensive and defensive) = Offensive Rebound + Defensive Rebound
```
```
MPG (minutes per game; NOT to be used when calculating EFF) = Min/Game Played
```


There are five types of player positions (see [wikipedia](https://en.wikipedia.org/wiki/Basketball_positions) for more details):

+ `PG`: point guard
+ `SG`: shooting guard
+ `SF`: small forward
+ `PF`: power forward
+ `C`: center


There are 441 rows and 24 columns

column labels are the variables that I mentioned above.

Units or measurement are various. Those could be name, dollars, points, and number.