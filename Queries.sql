DELETE FROM season;
DELETE FROM matches;
DELETE FROM club;
DELETE FROM clubStats;
DELETE FROM stats;
DELETE FROM playerStats;
DELETE FROM nation;

/*importing matches for 2010/2011 season*/
.mode "csv"
.separator ","
.import '| tail -n +90 data/11champs.csv' matches

/*importing matches for 2011/2012 season*/
.mode "csv"
.separator ","
.import '| tail -n +90 data/12champs.csv' matches

/*importing matches for 2012/2013 season*/
.mode "csv"
.separator ","
.import '| tail -n +90 data/13champs.csv' matches

/*importing matches for 2013/2014 season*/
.mode "csv"
.separator ","
.import '| tail -n +90 data/14champs.csv' matches

/*importing matches for 2014/2015 season*/
.mode "csv"
.separator ","
.import '| tail -n +92 data/15champs.csv' matches

/*importing matches for 2015/2016 season*/
.mode "csv"
.separator ","
.import '| tail -n +94 data/16champs.csv' matches

/*1. What teams where in group A?*/
Select c_name
From matches
Where m_group='A';


/*2. What nation(s) where the teams from group C?*/
Select c_nationkey
From club
Where m_group='C';


/*3. What teams won games during the group stage?*/



/*4. What teams won or tied but didn't lose during the group stage?*/



/*5. What teams ended up going to penalties during any round?*/



/*6. What teams won the final?*/
Select m_winner
From matches
Where m_stage='Final';

/*7. What were all the results of (pick a team)?*/



/*8. What teams are from Spain and played in the knockout stage?*/
Select c_name
From club
Where c_nationkey='Esp';


/*9. What were the mations of the teams that played in the final?*/
Select c_nationkey
From club
Where m_stage='Final';


/*10. What teams played on (pick a date)?*/



/*11. What were the results of all the teams that played on (pick a date) and (pick a date)?*/



/*12. What were all the nations of teams that made it into the group stage?*/



/*13. What was the nation with the most teams in the round of 16 and how many teams did that nation have?*/



/*14. What teams made it to the final and are from the same nation?*/



/*15. What teams didn't score at least one goal during any round?*/



/*16. How many games eneded with a score of 0-0?*/



/*17. What two teams, if any, played each other during the group stage and then played each other during a knockout stage?*/



/*18. What team lost at least three games during the group stage but still made it to the knockout stage?*/



/*19. What game(s), if any, did the team who won the final lose a game?*/



/*20. What was the highest aggregate score?*/
