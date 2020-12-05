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
UPDATE matches
SET m_seasonkey = 11
WHERE m_date LIKE '%2010%'
    OR m_date LIKE'%2011%';

/*importing matches for 2011/2012 season*/
.mode "csv"
.separator ","
.import '| tail -n +90 data/12champs.csv' matches
UPDATE matches
SET m_seasonkey = 12
WHERE m_date LIKE '%Sep 2011%'
    OR m_date LIKE '%Oct 2011%'
    OR m_date LIKE '%Nov 2011%'
    OR m_date LIKE '%Dec 2011%'
    OR m_date LIKE '%2012%';

/*importing matches for 2012/2013 season*/
.mode "csv"
.separator ","
.import '| tail -n +90 data/13champs.csv' matches
UPDATE matches
SET m_seasonkey = 13
WHERE m_date LIKE '%Sep 2012%'
    OR m_date LIKE '%Oct 2012%'
    OR m_date LIKE '%Nov 2012%'
    OR m_date LIKE '%Dec 2012%'
    OR m_date LIKE '%2013%';

/*importing matches for 2013/2014 season*/
.mode "csv"
.separator ","
.import '| tail -n +90 data/14champs.csv' matches
UPDATE matches
SET m_seasonkey = 14
WHERE m_date LIKE '%Sep 2013%'
    OR m_date LIKE '%Oct 2013%'
    OR m_date LIKE '%Nov 2013%'
    OR m_date LIKE '%Dec 2013%'
    OR m_date LIKE '%2014%';

/*importing matches for 2014/2015 season*/
.mode "csv"
.separator ","
.import '| tail -n +92 data/15champs.csv' matches
UPDATE matches
SET m_seasonkey = 15
WHERE m_date LIKE '%Sep 2014%'
    OR m_date LIKE '%Oct 2014%'
    OR m_date LIKE '%Nov 2014%'
    OR m_date LIKE '%Dec 2014%'
    OR m_date LIKE '%2015%';

/*importing matches for 2015/2016 season*/
.mode "csv"
.separator ","
.import '| tail -n +94 data/16champs.csv' matches
UPDATE matches
SET m_seasonkey = 16
WHERE m_date LIKE '%Sep 2015%'
    OR m_date LIKE '%Oct 2015%'
    OR m_date LIKE '%Nov 2015%'
    OR m_date LIKE '%Dec 2015%'
    OR m_date LIKE '%2016%';

/*Data for seasons*/
INSERT INTO seasons VALUES(11, '2010/2011 Season');
INSERT INTO seasons VALUES(12, '2011/2012 Season');
INSERT INTO seasons VALUES(13, '2012/2013 Season');
INSERT INTO seasons VALUES(14, '2013/2014 Season');
INSERT INTO seasons VALUES(15, '2014/2015 Season');
INSERT INTO seasons VALUES(16, '2015/2016 Season');

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
INSERT INTO club VALUES(1, 'AC MILAN', 14);
INSERT INTO club VALUES(2, 'AJAX', 16);
INSERT INTO club VALUES(3, 'APOEL', 6);
INSERT INTO club VALUES(4, 'ANDERLECHT', 3);
INSERT INTO club VALUES(5, 'ARSENAL', 9);
INSERT INTO club VALUES(6, 'ASTANA', 15);
INSERT INTO club VALUES(7, 'ATHLETIC BILBAO', 24);
INSERT INTO club VALUES(8, 'ATLETICO MADRID', 24);
INSERT INTO club VALUES(9, 'AUSTRIA WIEN', 1);
INSERT INTO club VALUES(10, 'AUXERRE', 10);
INSERT INTO club VALUES(11, 'BARCELONA', 24);
INSERT INTO club VALUES(12, 'BASEL', 26);
INSERT INTO club VALUES(13, 'BATE BORISOV', 2);
INSERT INTO club VALUES(14, 'BAYERN MUNICH', 11);
INSERT INTO club VALUES(15, 'BAYER LEVERKUSEN', 11);
INSERT INTO club VALUES(16, 'BENFICA', 17);
INSERT INTO club VALUES(17, 'BORUSSIA DORTMUND', 11);
INSERT INTO club VALUES(18, 'BORUSSIA MONCHENGLADBACH', 1);
INSERT INTO club VALUES(19, 'BRAGA', 17);
INSERT INTO club VALUES(20, 'BURSASPOR', 27);
INSERT INTO club VALUES(21, 'CELTIC', 20);
INSERT INTO club VALUES(22, 'CFR CLUJ', 18);
INSERT INTO club VALUES(23, 'CHELSEA', 9);
INSERT INTO club VALUES(24, 'COPENHAGEN', 8);
INSERT INTO club VALUES(25, 'CSKA MOSCOW', 19);
INSERT INTO club VALUES(26, 'DINAMO ZAGREB', 5);
INSERT INTO club VALUES(27, 'DYNAMO KYIV', 28);
INSERT INTO club VALUES(28, 'GALATASARAY', 27);
INSERT INTO club VALUES(29, 'GENK', 3);
INSERT INTO club VALUES(30, 'GENT', 3);
INSERT INTO club VALUES(31, 'HAPOEL TEL AVIV', 13);
INSERT INTO club VALUES(32, 'JUVENTUS', 14);
INSERT INTO club VALUES(33, 'LILLE', 10);
INSERT INTO club VALUES(34, 'LIVERPOOL', 9);
INSERT INTO club VALUES(35, 'LUDOGORETS RAZGRAD', 4);
INSERT INTO club VALUES(36, 'LYON', 10);
INSERT INTO club VALUES(37, 'INTER MILAN', 14);
INSERT INTO club VALUES(38, 'MACCABI TEL AVIV', 13);
INSERT INTO club VALUES(39, 'MALAGA', 24);
INSERT INTO club VALUES(40, 'MALMO FF', 25);
INSERT INTO club VALUES(41, 'MANCHESTER CITY', 9);
INSERT INTO club VALUES(42, 'MANCHESTER UNITED', 9);
INSERT INTO club VALUES(43, 'MARIBOR', 23);
INSERT INTO club VALUES(44, 'MARSEILLE', 10);
INSERT INTO club VALUES(45, 'MONACO', 10);
INSERT INTO club VALUES(46, 'MONTPELLIER', 10);
INSERT INTO club VALUES(47, 'NAPOLI', 14);
INSERT INTO club VALUES(48, 'NORDSJAELLAND', 8);
INSERT INTO club VALUES(49, 'OLYMPIACOS', 12);
INSERT INTO club VALUES(50, 'OTELUL GALATI', 18);
INSERT INTO club VALUES(51, 'PANATHINAIKOS', 12);
INSERT INTO club VALUES(52, 'PARITZAN', 21);
INSERT INTO club VALUES(53, 'PORTO', 17);
INSERT INTO club VALUES(54, 'PSG', 10);
INSERT INTO club VALUES(55, 'PSV', 16);
INSERT INTO club VALUES(56, 'RANGERS', 20);
INSERT INTO club VALUES(57, 'REAL MADRID', 24);
INSERT INTO club VALUES(58, 'REAL SOLCIEDAD', 24);
INSERT INTO club VALUES(59, 'ROMA', 14);
INSERT INTO club VALUES(60, 'RUBIN KAZAN', 19);
INSERT INTO club VALUES(61, 'SCHALKE 04', 11);
INSERT INTO club VALUES(62, 'SEVILLA', 24);
INSERT INTO club VALUES(63, 'SHAKHTAR DONETSK', 28);
INSERT INTO club VALUES(64, 'SPARTAK MOSCOW', 19);
INSERT INTO club VALUES(65, 'SPORTING CP', 17);
INSERT INTO club VALUES(66, 'STEAUA BUCURESTI', 18);
INSERT INTO club VALUES(67, 'TOTTENHAM', 9);
INSERT INTO club VALUES(68, 'TRABZONSPOR', 27);
INSERT INTO club VALUES(69, 'TWENTE', 16);
INSERT INTO club VALUES(70, 'VALENCIA', 24);
INSERT INTO club VALUES(71, 'VIKTORIA PLZEN', 7);
INSERT INTO club VALUES(72, 'VILLARREAL', 24);
INSERT INTO club VALUES(73, 'WERDER BREMEN', 11);
INSERT INTO club VALUES(74, 'WOLFSBURG', 11);
INSERT INTO club VALUES(75, 'ZENIT', 19);
INSERT INTO club VALUES(76, 'ZILINA', 22);


/*Data for club stats*/
/*INSERT INTO clubStats VALUES(clubkey,cs name, gamesplayed, won, tied, lost, goalf for, against, statkey, seeasonkey);*/
INSERT INTO clubStats VALUES(1, 'AC MILAN 10/11', 8, 2, 3, 3, 7, 8, 11);
INSERT INTO clubStats VALUES(1, 'AC MILAN 11/12', 10, 3, 4, 3, 16, 14, 12);
INSERT INTO clubStats VALUES(1, 'AC MILAN 12/13', 8, 3, 2, 3, 9, 10, 13);
INSERT INTO clubStats VALUES(1, 'AC MILAN 13/14', 8, 2, 3, 3, 9, 10, 14);
INSERT INTO clubStats VALUES(2, 'AJAX 10/11', 6, 2, 1, 3, 6, 10, 11);
INSERT INTO clubStats VALUES(2, 'AJAX 11/12', 6, 2, 2, 2, 6, 6, 12);
INSERT INTO clubStats VALUES(2, 'AJAX 12/13', 6, 1, 1, 4, 8, 16, 13);
INSERT INTO clubStats VALUES(2, 'AJAX 13/14', 6, 2, 2, 2, 5, 8, 14);
INSERT INTO clubStats VALUES(2, 'AJAX 14/15', 6, 1, 2, 3, 8, 10, 15);
INSERT INTO clubStats VALUES(3, 'APOEL 11/12', 10, 3, 3, 4, 13, 18, 12);
INSERT INTO clubStats VALUES(3, 'APOEL 14/15', 6, 0, 1, 5, 1, 12, 15);
INSERT INTO clubStats VALUES(4, 'ANDERLECHT 12/13', 6, 1, 2, 3, 4, 9, 13);
INSERT INTO clubStats VALUES(4, 'ANDERLECHT 13/14', 6, 0, 1, 5, 4, 17, 14);
INSERT INTO clubStats VALUES(4, 'ANDERLECHT 14/15', 6, 1, 3, 2, 8, 10, 15);
INSERT INTO clubStats VALUES(5, 'ARSENAL 10/11', 8, 5, 0, 3, 21, 11, 11);
INSERT INTO clubStats VALUES(5, 'ARSENAL 11/12', 8, 4, 2, 2, 10, 10, 12);
INSERT INTO clubStats VALUES(5, 'ARSENAL 12/13', 8, 4, 1, 3, 13, 11, 13);
INSERT INTO clubStats VALUES(5, 'ARSENAL 13/14', 8, 5, 1, 2, 9, 8, 14);
INSERT INTO clubStats VALUES(5, 'ARSENAL 14/15', 8, 5, 1, 2, 18, 11, 15);
INSERT INTO clubStats VALUES(5, 'ARSENAL 15/16', 8, 3, 0, 5, 13, 15, 16);
INSERT INTO clubStats VALUES(6, 'ASTANA 15/16', 6, 0, 4, 2, 5, 11, 16);
INSERT INTO clubStats VALUES(7, 'ATHLETIC BILBAO 14/15', 6, 2, 1, 3, 5, 6, 15);
INSERT INTO clubStats VALUES(8, 'ATLETICO MADRID 13/14', 13, 9, 3, 1, 26, 10, 14);
INSERT INTO clubStats VALUES(8, 'ATLETICO MADRID 14/15', 10, 5, 2, 3, 18, 7, 15);
INSERT INTO clubStats VALUES(8, 'ATLETICO MADRID 15/16', 13, 7, 2, 4, 28, 20, 16);
INSERT INTO clubStats VALUES(9, 'AUSTRIA WIEN 13/14', 6, 1, 2, 3, 5, 10, 14);
INSERT INTO clubStats VALUES(10, 'AUXERRE 10/11', 6, 1, 0, 5, 3, 12, 11);
INSERT INTO clubStats VALUES(11, 'BARCELONA 10/11', 13, 9, 3, 1, 30, 9, 11);
INSERT INTO clubStats VALUES(11, 'BARCELONA 11/12', 12, 8, 3, 1, 35, 10, 12);
INSERT INTO clubStats VALUES(11, 'BARCELONA 12/13', 12, 5, 3, 4, 18, 17, 13);
INSERT INTO clubStats VALUES(11, 'BARCELONA 13/14', 10, 6, 2, 2, 21, 8, 14);
INSERT INTO clubStats VALUES(11, 'BARCELONA 14/15', 13, 11, 0, 2, 31, 11, 15);
INSERT INTO clubStats VALUES(11, 'BARCELONA 15/16', 10, 7, 2, 1, 22, 8, 16);
INSERT INTO clubStats VALUES(12, 'BASEL 10/11', 6, 2, 0, 4, 8, 11, 11);
INSERT INTO clubStats VALUES(12, 'BASEL 11/12', 8, 4, 2, 2, 12, 17, 12);
INSERT INTO clubStats VALUES(12, 'BASEL 13/14', 6, 2, 2, 2, 5, 6, 14);
INSERT INTO clubStats VALUES(12, 'BASEL 14/15', 8, 2, 2, 4, 8, 13, 15);
INSERT INTO clubStats VALUES(13, 'BATE BORISOV 11/12', 6, 0, 2, 4, 2, 14, 12);
INSERT INTO clubStats VALUES(13, 'BATE BORISOV 12/13', 6, 2, 0, 4, 9, 15, 13);
INSERT INTO clubStats VALUES(13, 'BATE BORISOV 14/15', 6, 1, 0, 5, 2, 24, 15);
INSERT INTO clubStats VALUES(13, 'BATE BORISOV 15/16', 6, 1, 2, 3, 5, 12, 16);
INSERT INTO clubStats VALUES(14, 'BAYERN MUNICH 10/11', 8, 6, 0, 2, 19, 9, 11);
INSERT INTO clubStats VALUES(14, 'BAYERN MUNICH 11/12', 13, 8, 1, 4, 32, 16, 12);
INSERT INTO clubStats VALUES(14, 'BAYERN MUNICH 12/13', 13, 10, 1, 2, 31, 11, 13);
INSERT INTO clubStats VALUES(14, 'BAYERN MUNICH 13/14', 12, 7, 2, 3, 24, 13, 14);
INSERT INTO clubStats VALUES(14, 'BAYERN MUNICH 14/15', 12, 9, 0, 3, 33, 13, 15);
INSERT INTO clubStats VALUES(14, 'BAYERN MUNICH 15/16', 12, 8, 2, 2, 30, 11, 16);
INSERT INTO clubStats VALUES(15, 'BAYER LEVERKUSEN 11/12', 8, 3, 1, 4, 10, 18, 12);
INSERT INTO clubStats VALUES(15, 'BAYER LEVERKUSEN 13/14', 8, 3, 1, 4, 10, 16, 14);
INSERT INTO clubStats VALUES(15, 'BAYER LEVERKUSEN 14/15', 8, 4, 1, 3, 10, 8, 15);
INSERT INTO clubStats VALUES(15, 'BAYER LEVERKUSEN 15/16', 6, 1, 3, 2, 13, 12, 16);
INSERT INTO clubStats VALUES(16, 'BENFICA 10/11', 6, 2, 0, 4, 7, 12, 11);
INSERT INTO clubStats VALUES(16, 'BENFICA 11/12', 10, 4, 3, 3, 13, 10, 12);
INSERT INTO clubStats VALUES(16, 'BENFICA 12/13', 6, 2, 2, 2, 5, 5, 13);
INSERT INTO clubStats VALUES(16, 'BENFICA 13/14', 6, 3, 1, 2, 8, 8, 14);
INSERT INTO clubStats VALUES(16, 'BENFICA 14/15', 6, 1, 2, 3, 2, 6, 15);
INSERT INTO clubStats VALUES(16, 'BENFICA 15/16', 10, 5, 2, 3, 15, 12, 16);
INSERT INTO clubStats VALUES(17, 'BORUSSIA DORTMUND 11/12', 6, 1, 1, 4, 6, 12, 12);
INSERT INTO clubStats VALUES(17, 'BORUSSIA DORTMUND 12/13', 13, 7, 4, 2, 21, 17, 13);
INSERT INTO clubStats VALUES(17, 'BORUSSIA DORTMUND 13/14', 10, 6, 0, 4, 18, 13, 14);
INSERT INTO clubStats VALUES(17, 'BORUSSIA DORTMUND 14/15', 8, 4, 1, 3, 15, 9, 15);
INSERT INTO clubStats VALUES(18, 'BORUSSIA MONCHENGLADBACH 15/16', 6, 1, 2, 3, 8, 12, 16);
INSERT INTO clubStats VALUES(19, 'BRAGA 10/11', 6, 3, 0, 3, 5, 11, 11);
INSERT INTO clubStats VALUES(19, 'BRAGA 12/13', 6, 1, 0, 5, 7, 13, 13);
INSERT INTO clubStats VALUES(20, 'BURSASPOR 10/11', 6, 0, 1, 5, 2, 16, 11);
INSERT INTO clubStats VALUES(21, 'CELTIC 12/13', 6, 3, 1, 4, 9, 13, 13);
INSERT INTO clubStats VALUES(21, 'CELTIC 13/14', 6, 1, 0, 5, 3, 14, 14);
INSERT INTO clubStats VALUES(22, 'CFR CLUJ 10/11', 6, 1, 1, 4, 6, 12, 11);
INSERT INTO clubStats VALUES(22, 'CFR CLUJ 12/13', 6, 3, 1, 2, 9, 7, 13);
INSERT INTO clubStats VALUES(23, 'CHELSEA 10/11', 10, 7, 1, 2, 16, 7, 11);
INSERT INTO clubStats VALUES(23, 'CHELSEA 11/12', 13, 8, 3, 2, 29, 15, 12);
INSERT INTO clubStats VALUES(23, 'CHELSEA 12/13', 6, 3, 1, 2, 16, 10, 13);
INSERT INTO clubStats VALUES(23, 'CHELSEA 13/14', 12, 6, 2, 4, 19, 10, 14);
INSERT INTO clubStats VALUES(23, 'CHELSEA 14/15', 8, 4, 4, 0, 20, 6, 15);
INSERT INTO clubStats VALUES(23, 'CHELSEA 15/16', 8, 4, 1, 3, 15, 7, 16);
INSERT INTO clubStats VALUES(24, 'COPENHAGEN 10/11', 8, 3, 2, 3, 7, 7, 11);
INSERT INTO clubStats VALUES(24, 'COPENHAGEN 13/14', 6, 1, 1, 4, 4, 13, 14);
INSERT INTO clubStats VALUES(25, 'CSKA MOSCOW 11/12', 8, 2, 3, 3, 11, 13, 12);
INSERT INTO clubStats VALUES(25, 'CSKA MOSCOW 13/14', 6, 1, 0, 5, 8, 17, 14);
INSERT INTO clubStats VALUES(25, 'CSKA MOSCOW 14/15', 6, 1, 2, 3, 6, 13, 15);
INSERT INTO clubStats VALUES(25, 'CSKA MOSCOW 15/16', 6, 1, 1, 4, 5, 9, 16);
INSERT INTO clubStats VALUES(26, 'DINAMO ZAGREB 11/12', 6, 0, 0, 6, 3, 22, 12);
INSERT INTO clubStats VALUES(26, 'DINAMO ZAGREB 12/13', 6, 0, 1, 5, 1, 14, 13);
INSERT INTO clubStats VALUES(26, 'DINAMO ZAGREB 15/16', 6, 1, 0, 5, 3, 14, 16);
INSERT INTO clubStats VALUES(27, 'DYNAMO KYIV 12/13', 6, 1, 2, 3, 6, 10, 13);
INSERT INTO clubStats VALUES(27, 'DYNAMO KYIV 15/16', 6, 3, 2, 1, 8, 4, 16);
INSERT INTO clubStats VALUES(28, 'GALATASARAY 12/13', 10, 5, 2, 3, 14, 14, 13);
INSERT INTO clubStats VALUES(28, 'GALATASARAY 13/14', 8, 2, 2, 4, 9, 17, 14);
INSERT INTO clubStats VALUES(28, 'GALATASARAY 14/15', 6, 0, 1, 5, 4, 19, 15);
INSERT INTO clubStats VALUES(28, 'GALATASARAY 15/16', 6, 1, 2, 3, 6, 10, 16);
INSERT INTO clubStats VALUES(29, 'GENK 11/12', 6, 0, 3, 3, 2, 16, 12);
INSERT INTO clubStats VALUES(30, 'GENT 15/16', 8, 3, 1, 4, 10, 11, 16);
INSERT INTO clubStats VALUES(31, 'HAPOEL TEL AVIV 10/11', 6, 1, 2, 3, 7, 10, 11);
INSERT INTO clubStats VALUES(32, 'JUVENTUS 12/13', 10, 5, 3, 2, 17, 8, 13);
INSERT INTO clubStats VALUES(32, 'JUVENTUS 13/14', 6, 1, 3, 2, 9, 9, 14);
INSERT INTO clubStats VALUES(32, 'JUVENTUS 14/15', 13, 6, 3, 4, 17, 10, 15);
INSERT INTO clubStats VALUES(32, 'JUVENTUS 15/16', 8, 3, 3, 2, 10, 9, 16);
INSERT INTO clubStats VALUES(33, 'LILLE 11/12', 6, 1, 3, 2, 6, 6, 12);
INSERT INTO clubStats VALUES(33, 'LILLE 12/13', 6, 1, 0, 5, 4, 13, 13);
INSERT INTO clubStats VALUES(34, 'LIVERPOOL 14/15', 6, 1, 2, 3, 5, 9, 15);
INSERT INTO clubStats VALUES(35, 'LUDOGORETS RAZGRAD 14/15', 6, 1, 1, 4, 5, 14, 15);
INSERT INTO clubStats VALUES(36, 'LYON 10/11', 8, 3, 2, 3, 12, 14, 11);
INSERT INTO clubStats VALUES(36, 'LYON 11/12', 8, 3, 2, 3, 13, 11, 12);
INSERT INTO clubStats VALUES(36, 'LYON 15/16', 6, 1, 1, 4, 5, 9, 16);
INSERT INTO clubStats VALUES(37, 'INTER MILAN 10/11', 10, 4, 1, 5, 18, 21, 11);
INSERT INTO clubStats VALUES(37, 'INTER MILAN 11/12', 8, 4, 1, 3, 10, 9, 12);
INSERT INTO clubStats VALUES(38, 'MACCABI TEL AVIV 15/16', 6, 0, 0, 6, 1, 16, 16);
INSERT INTO clubStats VALUES(39, 'MALAGA 12/13', 10, 4, 4, 2, 16, 9, 13);
INSERT INTO clubStats VALUES(40, 'MALMO FF 14/15', 6, 1, 0, 5, 4, 15, 15);
INSERT INTO clubStats VALUES(40, 'MALMO FF 15/16', 6, 1, 0, 5, 1, 21, 16);
INSERT INTO clubStats VALUES(41, 'MANCHESTER CITY 11/12', 6, 3, 1, 2, 9, 6, 12);
INSERT INTO clubStats VALUES(41, 'MANCHESTER CITY 12/13', 6, 0, 3, 3, 7, 11, 13);
INSERT INTO clubStats VALUES(41, 'MANCHESTER CITY 13/14', 8, 5, 0, 3, 19, 14, 14);
INSERT INTO clubStats VALUES(41, 'MANCHESTER CITY 14/15', 8, 2, 2, 4, 10, 11, 15);
INSERT INTO clubStats VALUES(41, 'MANCHESTER CITY 15/16', 12, 6, 3, 3, 18, 11, 16);
INSERT INTO clubStats VALUES(42, 'MANCHESTER UNITED 10/11', 13, 9, 3, 1, 19, 7, 11);
INSERT INTO clubStats VALUES(42, 'MANCHESTER UNITED 11/12', 6, 2, 3, 1, 11, 8, 12);
INSERT INTO clubStats VALUES(42, 'MANCHESTER UNITED 12/13', 8, 4, 1, 3, 11, 9, 13);
INSERT INTO clubStats VALUES(42, 'MANCHESTER UNITED 13/14', 10, 5, 3, 2, 19, 7, 14);
INSERT INTO clubStats VALUES(42, 'MANCHESTER UNITED 15/16', 6, 2, 2, 2, 7, 7, 16);
INSERT INTO clubStats VALUES(43, 'MARIBOR 14/15', 6, 0, 3, 3, 4, 13, 15);
INSERT INTO clubStats VALUES(44, 'MARSEILLE 10/11', 8, 4, 1, 3, 13, 5, 11);
INSERT INTO clubStats VALUES(44, 'MARSEILLE 11/12', 10, 4, 1, 5, 9, 10, 12);
INSERT INTO clubStats VALUES(44, 'MARSEILLE 13/14', 6, 0, 0, 6, 5, 14, 14);
INSERT INTO clubStats VALUES(45, 'MONACO 14/15', 10, 4, 3, 3, 7, 5, 15);
INSERT INTO clubStats VALUES(46, 'MONTPELLIER 12/13', 6, 0, 2, 4, 6, 12, 13);
INSERT INTO clubStats VALUES(47, 'NAPOLI 11/12', 8, 4, 2, 2, 14, 11, 12);
INSERT INTO clubStats VALUES(47, 'NAPOLI 13/14', 6, 4, 0, 2, 10, 9, 14);
INSERT INTO clubStats VALUES(48, 'NORDSJAELLAND 12/13', 6, 0, 1, 5, 4, 22, 13);
INSERT INTO clubStats VALUES(49, 'OLYMPIACOS 11/12', 6, 3, 0, 3, 8, 6, 12);
INSERT INTO clubStats VALUES(49, 'OLYMPIACOS 12/13', 6, 3, 0, 3, 9, 9, 13);
INSERT INTO clubStats VALUES(49, 'OLYMPIACOS 13/14', 8, 4, 1, 3, 12, 11, 14);
INSERT INTO clubStats VALUES(49, 'OLYMPIACOS 14/15', 6, 3, 0, 3, 10, 13, 15);
INSERT INTO clubStats VALUES(49, 'OLYMPIACOS 15/16', 6, 3, 0, 3, 6, 13, 16);
INSERT INTO clubStats VALUES(50, 'OTELUL GALATI 11/12', 6, 0, 0, 6, 3, 11, 12);
INSERT INTO clubStats VALUES(51, 'PANATHINAIKOS 10/11', 6, 0, 2, 4, 2, 13, 11);
INSERT INTO clubStats VALUES(52, 'PARITZAN 10/11', 6, 0, 0, 6, 2, 13, 11);
INSERT INTO clubStats VALUES(53, 'PORTO 11/12', 6, 2, 2, 2, 7, 7, 12);
INSERT INTO clubStats VALUES(53, 'PORTO 12/13', 8, 5, 1, 2, 11, 6, 13);
INSERT INTO clubStats VALUES(53, 'PORTO 13/14', 6, 1, 2, 3, 4, 7, 14);
INSERT INTO clubStats VALUES(53, 'PORTO 14/15', 10, 6, 3, 1, 25, 12, 15);
INSERT INTO clubStats VALUES(53, 'PORTO 15/16', 6, 3, 1, 2, 9, 8, 16);
INSERT INTO clubStats VALUES(54, 'PSG 12/13', 10, 6, 3, 1, 20, 8, 13);
INSERT INTO clubStats VALUES(54, 'PSG 13/14', 10, 7, 1, 2, 25, 9, 14);
INSERT INTO clubStats VALUES(54, 'PSG 14/15', 10, 4, 3, 3, 14, 15, 15);
INSERT INTO clubStats VALUES(54, 'PSG 15/16', 10, 6, 2, 2, 18, 6, 16);
INSERT INTO clubStats VALUES(55, 'PSV 15/16', 8, 3, 2, 3, 15, 15, 16);
INSERT INTO clubStats VALUES(56, 'RANGERS 10/11', 6, 1, 3, 2, 3, 6, 11);
INSERT INTO clubStats VALUES(57, 'REAL MADRID 10/11', 12, 8, 3, 1, 25, 6, 11);
INSERT INTO clubStats VALUES(57, 'REAL MADRID 11/12', 12, 10, 1, 1, 36, 12, 12);
INSERT INTO clubStats VALUES(57, 'REAL MADRID 12/13', 12, 6, 3, 3, 26, 18, 13);
INSERT INTO clubStats VALUES(57, 'REAL MADRID 13/14', 13, 11, 1, 1, 41, 10, 14);
INSERT INTO clubStats VALUES(57, 'REAL MADRID 14/15', 12, 8, 2, 2, 25, 9, 15);
INSERT INTO clubStats VALUES(57, 'REAL MADRID 15/16', 13, 10, 2, 1, 33, 9, 16);
INSERT INTO clubStats VALUES(58, 'REAL SOLCIEDAD 13/14', 6, 0, 1, 5, 1, 10, 14);
INSERT INTO clubStats VALUES(59, 'ROMA 10/11', 8, 3, 1, 4, 12, 17, 11);
INSERT INTO clubStats VALUES(59, 'ROMA 14/15', 6, 1, 2, 3, 8, 14, 15);
INSERT INTO clubStats VALUES(59, 'ROMA 15/16', 8, 1, 3, 4, 11, 20, 16);
INSERT INTO clubStats VALUES(60, 'RUBIN KAZAN 10/11', 6, 1, 3, 2, 2, 4, 11);
INSERT INTO clubStats VALUES(61, 'SCHALKE 04 10/11', 12, 7, 2, 3, 20, 16, 11);
INSERT INTO clubStats VALUES(61, 'SCHALKE 04 12/13', 8, 3, 4, 1, 13, 10, 13);
INSERT INTO clubStats VALUES(61, 'SCHALKE 04 13/14', 8, 3, 1, 4, 8, 15, 14);
INSERT INTO clubStats VALUES(61, 'SCHALKE 04 14/15', 8, 3, 2, 3, 15, 19, 15);
INSERT INTO clubStats VALUES(62, 'SEVILLA 15/16', 6, 2, 0, 4, 8, 11, 16);
INSERT INTO clubStats VALUES(63, 'SHAKHTAR DONETSK 10/11', 10, 7, 0, 3, 19, 8, 11);
INSERT INTO clubStats VALUES(63, 'SHAKHTAR DONETSK 11/12', 6, 1, 2, 3, 6, 8, 12);
INSERT INTO clubStats VALUES(63, 'SHAKHTAR DONETSK 12/13', 8, 3, 2, 3, 14, 13, 13);
INSERT INTO clubStats VALUES(63, 'SHAKHTAR DONETSK 13/14', 6, 2, 2, 2, 7, 6, 14);
INSERT INTO clubStats VALUES(63, 'SHAKHTAR DONETSK 14/15', 8, 2, 3, 3, 15, 11, 15);
INSERT INTO clubStats VALUES(63, 'SHAKHTAR DONETSK 15/16', 6, 1, 0, 5, 7, 14, 16);
INSERT INTO clubStats VALUES(64, 'SPARTAK MOSCOW 10/11', 6, 3, 0, 3, 7, 10, 11);
INSERT INTO clubStats VALUES(64, 'SPARTAK MOSCOW 12/13', 6, 1, 0, 5, 7, 14, 13);
INSERT INTO clubStats VALUES(65, 'SPORTING CP 14/15', 6, 2, 1, 3, 12, 12, 15);
INSERT INTO clubStats VALUES(66, 'STEAUA BUCURESTI 13/14', 6, 0, 3, 3, 2, 10, 14);
INSERT INTO clubStats VALUES(67, 'TOTTENHAM 10/11', 10, 4, 3, 3, 19, 16, 11);
INSERT INTO clubStats VALUES(68, 'TRABZONSPOR 11/12', 6, 1, 4, 1, 3, 5, 12);
INSERT INTO clubStats VALUES(69, 'TWENTE 10/11', 6, 1, 3, 2, 9, 11, 11);
INSERT INTO clubStats VALUES(70, 'VALENCIA 10/11', 8, 3, 3, 2, 17, 8, 11);
INSERT INTO clubStats VALUES(70, 'VALENCIA 11/12', 6, 2, 2, 2, 12, 7, 12);
INSERT INTO clubStats VALUES(70, 'VALENCIA 12/13', 8, 4, 2, 2, 14, 8, 13);
INSERT INTO clubStats VALUES(70, 'VALENCIA 15/16', 6, 2, 0, 4, 5, 9, 16);
INSERT INTO clubStats VALUES(71, 'VIKTORIA PLZEN 11/12', 6, 1, 2, 3, 4, 11, 12);
INSERT INTO clubStats VALUES(71, 'VIKTORIA PLZEN 13/14', 6, 1, 0, 5, 6, 17, 14);
INSERT INTO clubStats VALUES(72, 'VILLARREAL 11/12', 6, 0, 0, 6, 2, 14, 12);
INSERT INTO clubStats VALUES(73, 'WERDER BREMEN 10/11', 6, 1, 2, 3, 6, 12, 11);
INSERT INTO clubStats VALUES(74, 'WOLFSBURG 15/16', 10, 7, 0, 3, 15, 11, 16);
INSERT INTO clubStats VALUES(75, 'ZENIT 11/12', 8, 3, 3, 2, 10, 9, 12);
INSERT INTO clubStats VALUES(75, 'ZENIT 12/13', 6, 2, 1, 3, 6, 9, 13);
INSERT INTO clubStats VALUES(75, 'ZENIT 13/14', 8, 2, 3, 3, 9, 14, 14);
INSERT INTO clubStats VALUES(75, 'ZENIT 14/15', 6, 2, 1, 3, 4, 6, 15);
INSERT INTO clubStats VALUES(75, 'ZENIT 15/16', 8, 5, 0, 3, 14, 9, 16);
INSERT INTO clubStats VALUES(76, 'ZILINA 10/11', 6, 0, 0, 6, 3, 19, 11);


/*Data for player stats*/
--INSERT INTO playerStats VALUES(playerkey, statkey, name, apperances, goals, assists, nation);
INSERT INTO playerStats VALUES(0, 0, 'Messi', 13, 12, 0, 'Argentina');
