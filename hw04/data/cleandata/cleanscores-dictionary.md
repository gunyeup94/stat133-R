## Data 'cleanscores.csv'

Here's the description of the R objects in 'cleanscore.csv':


- `HW1`: 334 students' HW1 scores, and converted NA to 0 from the original data, which is 'rawscore.csv'
- `HW2`: 334 students' HW2 scores, and converted NA to 0 from the original data, which is 'rawscore.csv'
- `HW3`: 334 students' HW3 scores, and converted NA to 0 from the original data, which is 'rawscore.csv'
- `HW4`: 334 students' HW4 scores, and converted NA to 0 from the original data, which is 'rawscore.csv'
- `HW5`: 334 students' HW5 scores, and converted NA to 0 from the original data, which is 'rawscore.csv'
- `HW6`: 334 students' HW6 scores, and converted NA to 0 from the original data, which is 'rawscore.csv'
- `HW7`: 334 students' HW7 scores, and converted NA to 0 from the original data, which is 'rawscore.csv'
- `HW8`: 334 students' HW8 scores, and converted NA to 0 from the original data, which is 'rawscore.csv'
- `HW9`: 334 students' HW9 scores, and converted NA to 0 from the original data, which is 'rawscore.csv'
- `ATT`: 334 students' Lab attendence scores
- `QZ1`: 334 students' QZ1 scores, and converted NA to 0 from the original data, which is 'rawscore.csv'
- `QZ2`: 334 students' QZ2 scores, and converted NA to 0 from the original data, which is 'rawscore.csv'
- `QZ3`: 334 students' QZ3 scores, and converted NA to 0 from the original data, which is 'rawscore.csv'
- `QZ4`: 334 students' QZ4 scores, and converted NA to 0 from the original data, which is 'rawscore.csv'
- `EX1`: 334 students' EX1 scores, and converted NA to 0 from the original data, which is 'rawscore.csv'
- `EX2`: 334 students' EX2 scores, and converted NA to 0 from the original data, which is 'rawscore.csv'

codified missing variable:

```
Test1: 334 students' EX1 percentage. Used `rescale100` function from 'functions.R'to get the percentage of EX1
```
```
Test2: 334 students' EX2 percentage. Used `rescale100` function from 'functions.R'to get the percentage of EX2
```
```
Homework: 334 students' Overall Homework scores after dropping the lowest score in 9 homework assignments
```
```
Quiz: 334 students' Overall Quiz scores after dropping the lowest score in 4 quizzes
```
```
Lab: 334 students' Lab percentage
```
```
Overall: 334 students' Overall grades
```
```
Grade: 334 students' letter grades
```

There are 334 rows and 23 columns.

Row is the number of students in class. Columns labels are the variables that I mentioned above.

Used 'rawscores.csv' and 'functions.R' to get cleanscores.csv
