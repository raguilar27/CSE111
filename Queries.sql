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

/*Data for seasons*/
INSERT INTO seasons VALUES(11, '2010/2011 Season');
INSERT INTO seasons VALUES(12, '2011/2012 Season');
INSERT INTO seasons VALUES(13, '2012/2013 Season');
INSERT INTO seasons VALUES(14, '2013/2014 Season');
INSERT INTO seasons VALUES(15, '2014/2015 Season');
INSERT INTO seasons VALUES(16, '2015/2016 Season');

/*Data for stats*/
INSERT INTO stats VALUES(1, 'Player Stats 2010/2011', 11);
INSERT INTO stats VALUES(2, 'Club Stats 2010/2011', 11);
INSERT INTO stats VALUES(3, 'Player Stats 2011/2012', 12);
INSERT INTO stats VALUES(4, 'Club Stats 2011/2012', 12);
INSERT INTO stats VALUES(5, 'Player Stats 2012/2013', 13);
INSERT INTO stats VALUES(6, 'Club Stats 2012/2013', 13);
INSERT INTO stats VALUES(7, 'Player Stats 2013/2014', 14);
INSERT INTO stats VALUES(8, 'Club Stats 2013/2014', 14);
INSERT INTO stats VALUES(9, 'Player Stats 2014/2015', 15);
INSERT INTO stats VALUES(10, 'Club Stats 2014/2015', 15);
INSERT INTO stats VALUES(11, 'Player Stats 2015/2016', 16);
INSERT INTO stats VALUES(12, 'Club Stats 2015/2016', 16);

/*Data for nation*/
INSERT INTO nation VALUES(1, 'AUSTRIA');
INSERT INTO nation VALUES(2, 'BELARUS');
INSERT INTO nation VALUES(3, 'BELGIUM');
INSERT INTO nation VALUES(4, 'BULGARIA');
INSERT INTO nation VALUES(5, 'CROATIA');
INSERT INTO nation VALUES(6, 'CYPRUS');
INSERT INTO nation VALUES(7, 'CZECH REPUBLIC');
INSERT INTO nation VALUES(8, 'DENMARK');
INSERT INTO nation VALUES(9, 'ENGLAND');
INSERT INTO nation VALUES(10, 'FRANCE');
INSERT INTO nation VALUES(11, 'GERMANY');
INSERT INTO nation VALUES(12, 'GREECE');
INSERT INTO nation VALUES(13, 'ISRAEL');
INSERT INTO nation VALUES(14, 'ITALY');
INSERT INTO nation VALUES(15, 'KAZAKHSTAN');
INSERT INTO nation VALUES(16, 'NETHERLANDS');
INSERT INTO nation VALUES(17, 'PORTUGAL');
INSERT INTO nation VALUES(18, 'ROMANIA');
INSERT INTO nation VALUES(19, 'RUSSIA');
INSERT INTO nation VALUES(20, 'SCOTLAND');
INSERT INTO nation VALUES(21, 'SERBIA');
INSERT INTO nation VALUES(22, 'SLOVAKIA');
INSERT INTO nation VALUES(23, 'SLOVENIA');
INSERT INTO nation VALUES(24, 'SPAIN');
INSERT INTO nation VALUES(25, 'SWEDEN');
INSERT INTO nation VALUES(26, 'SWITZERLAND');
INSERT INTO nation VALUES(27, 'TURKEY');
INSERT INTO nation VALUES(28, 'UKRAINE');

/*Data for club*/
INSERT INTO club VALUES(1, '',1 , 1);



















/*1. What teams where in group A? in the 2010/2011 season*/
Select DISTINCT c_name
From matches, club, clubStats, seasons
Where m_group='A'
    AND s_name = '2010/2011 Season'
    AND s_seasonkey = cs_seasonkey
    AND m_matchkey = cs_matchkey
    AND cs_clubkey = c_clubkey;


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
From club, nation, matches, clubStats
Where n_name = 'SPAIN'
    AND c_nationkey = n_nationkey
    AND cs_clubkey = c_clubkey
    AND cs_matchkey = m_matchkey
    AND m_stage = 'Knockout';


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
