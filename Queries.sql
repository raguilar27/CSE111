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

