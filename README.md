Original take home project spec:

# ios-exercises
Hello, ios dev! 

We have prepared a challenge for you to complete in your own time.
To get started use this repo as your origin.  Start implementing the exercise and commit/push in a separate branch.
Once done, please submit a pull request.
Please try to use little/none external dependencies as possible (stay native as much as you can!)
Please use Swift

We will assess your solution according to the following criteria

* Functionality - Does it work as expected?
* Code structure - Does your implementation provide a clean, efficient and scalable architecture?
* Good practice - Do you follow good coding practice and use SDK's according to guidelines?
* Readability - Will we understand how your code works? 
* Testing - Do you understand the importance of testing?

## Problem: Build an app that can display matches grouped by competition

Clearly here are CrowdScores we've had to do this quite a bit.   We'd like to see how you approach this.

You will find a file called matches.json.   This contains a list of matches on one particular day.  Each match belongs to a competition.  


1. Parse the file into suitable data structures
2. Display matches grouped by competition and ordered by competition 'ordering' 
3. For each competition order the matches by kick off
4. For each match simply show the kick off time and the teams
 * E.g. 15:00 Espanyol vs Barcelona
5. Provide tests that you feel are appropriate 
 
## Helpful things
* Use your architecture of choice
* The file contains lots of data about the matches but only parse the data you really need
* The default order of competitions is determined by the 'ordering' field.
* Use homeTeam.shortName and awayTeam.shortName for the team names 
* The kick off time of the match is defined by the attribute 'start' ( this is an epoch)

Have fun!
