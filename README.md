# ios-exercises
Hello, ios hacker! 

We have prepared a challenge for you to complete in your own time.
To get started use this repo as your origin.  Start hacking away at the problem and commit here.  Please commit and push often so we can follow your progress.

We will assess your solution according to the following criteria

* Functionality - Does it work as we expect?
* Code structure - Have you structured the solution in a logical way?
* Readability - Will we understand how your code works? 
* Testing - Do you understand the importance of testing?

## Problem: Build an app that can display a list of matches

Clearly here are CrowdScores we've had to do this quite a bit.   We'd like to see how you approach this.

You will find a file called matches.json.   This contains a list of matches on one particular day.  Each match belongs to a competition.

You should be able to build something in a couple of hours.

1. Parse the file into a list of matches
2. Display the matches ordered by kick off time  
3. For each match simply show the kick off time and the teams
 * E.g. 15:00 Espanyol vs Barcelona
4. For extra credit provide tests that you feel are appropriate
5. For even more credit display the matches grouped by competition 

## Helpful things
* Keep it as simple as possible whilst still demonstrating proper separation of concerns
* The file contains lots of data about the matches but only parse the data you really need
* Use homeTeam.shortName and awayTeam.shortName for the team names 
* The kick off time of the match is defined by the attribute 'start'.  It can be converted to an NSDate like this...
```Objective-C
NSDate *date = [NSDate dateWithTimeIntervalSince1970:start/1000.0];
```



