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



/*Data for club stats*/
/*INSERT INTO clubStats VALUES(clubkey, gamesplayed, won, tied, lost, goalf for, against, statkey, seeasonkey);*/
INSERT INTO clubStats VALUES('BARCELONA', 13, 9, 3, 1, 0, 0, 0, 2011);
--INSERT INTO clubStats VALUES();


/*Data for player stats*/
--INSERT INTO playerStats VALUES(playerkey, statkey, name, apperances, goals, assists, nation);
INSERT INTO playerStats VALUES(0, 0, 'Messi', 13, 12, 0, 'Argentina');