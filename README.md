# ios-exercises
Hello, ios hacker! 

We have prepared a challenge for you to complete in your own time.
To get started use this repo as your origin.  Start hacking away at the problem and commit here.  Please commit and push often so we can follow your progress.

We will assess your solution according to the following criteria

* Functionality - Does it work as we expect ?
* Code structure - Have you structured the solution in a logical way ?
* Readability - Will we understand how your code works ? 
* Testing - Do you understood the importance of testing ?

## Problem: Build an app that can display a list of matches

Clearly here are CrowdScores we've had to do this quite a bit.   We'd like to see how you approach this.

You will find a file called matches.json.   This contains a list of matches on one particular day.  Each match belongs to a competition.
The file contains lots of data about the matches but only parse the data you really need.

1. Parse the file into a list of matches
2. Display a table with sections for each competition
3. For the section header simply display the competition name
4. For each section display the matches ordered by kick off time  
5. For each match simply show the kick off time and the teams
 * E.g. 15:00 Espanyol vs Barcelona
6. For extra credit provide tests that you feel are appropriate
 
## Helpful things
* Use a simple UITableView to display the data
* Keep it as simple as possible whilst still demonstrating proper separation of concerns
* The kick off time of the match is defined by the attribute 'start'.  It can be converted to an NSDate like this...
```Objective-C
NSDate *date = [NSDate dateWithTimeIntervalSince1970:start/1000.0];
```
* Use homeTeam.shortName and awayTeam.shortName for the team names. 


