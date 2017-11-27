## Data 'rawscores.csv'

Here's the description of the R objects in 'rawscores.csv':


- `HW1`: 334 students' HW1 scores, with some NA, missing assignments.
- `HW2`: 334 students' HW2 scores, with some NA, missing assignments.
- `HW3`: 334 students' HW3 scores, with some NA, missing assignments.
- `HW4`: 334 students' HW4 scores, with some NA, missing assignments.
- `HW5`: 334 students' HW5 scores, with some NA, missing assignments.
- `HW6`: 334 students' HW6 scores, with some NA, missing assignments.
- `HW7`: 334 students' HW7 scores, with some NA, missing assignments.
- `HW8`: 334 students' HW8 scores, with some NA, missing assignments.
- `HW9`: 334 students' HW9 scores, with some NA, missing assignments.
- `ATT`: 334 students' Lab attendence scores
- `QZ1`: 334 students' QZ1 scores, with some NA, missing quzzies.
- `QZ2`: 334 students' QZ2 scores, with some NA, missing quzzies.
- `QZ3`: 334 students' QZ3 scores, with some NA, missing quzzies.
- `QZ4`: 334 students' QZ4 scores, with some NA, missing quzzies.
- `EX1`: 334 students' EX1 scores, with some NA, missing Exams.
- `EX2`: 334 students' EX2 scores, with some NA, missing Exams.

There are 334 rows and 16 columns.

Row number is the number of students. Columns are variable that I mentioned above.

Used this rawscore to codify `Homework`, `Quiz`, `Test1`, `Test2`, `Overall`, `Grade`, `Lab`:

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

