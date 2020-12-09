--Display Season
SELECT s_name
FROM seasons
WHERE s_seasonkey = 11;

--Matches in group stage 10/11
SELECT m_group, m_date, m_team1, m_FT, m_team2
FROM matches
WHERE m_stage = 'Group'
    AND m_seasonkey = 11
ORDER BY m_group;

--Matches in round of 16 10/11
SELECT m_round, m_date, m_team1, m_FT, m_team2, m_agg, m_comments
FROM matches
WHERE m_stage = 'Knockout'
    AND m_seasonkey = 11
    AND m_round LIKE 'Round of 16%';

--Matches in QuarterFinals 10/11
SELECT m_round, m_date, m_team1, m_FT, m_team2, m_agg, m_comments
FROM matches
WHERE m_stage = 'Knockout'
    AND m_seasonkey = 11
    AND m_round LIKE 'Quarterfinals%'; 

--Matches in SemiFinals 10/11
SELECT m_round, m_date, m_team1, m_FT, m_team2, m_agg, m_comments
FROM matches
WHERE m_stage = 'Knockout'
    AND m_seasonkey = 11
    AND m_round LIKE 'Semifinals%'; 

--Matches in Finals 10/11
SELECT m_round, m_date, m_team1, m_FT, m_team2, m_agg, m_comments
FROM matches
WHERE m_stage = 'Knockout'
    AND m_seasonkey = 11
    AND m_round = 'Final';   

--Shows clubs and their stats for the 10/11 season ordered by club name
SELECT c_name, n_name, cs_gamesPL, cs_gameW, cs_gameT, cs_gameL, cs_goalsFor, cs_goalsAgainst
FROM clubStats, club, nation
WHERE cs_clubkey = c_clubkey
    AND c_nationkey = n_nationkey
    AND cs_seasonkey = 11
ORDER BY c_name;

--Shows club and their stats for 10/11 season ordered by matches played
SELECT c_name, n_name, cs_gamesPL, cs_gameW, cs_gameT, cs_gameL, cs_goalsFor, cs_goalsAgainst
FROM clubStats, club, nation
WHERE cs_clubkey = c_clubkey
    AND c_nationkey = n_nationkey
    AND cs_seasonkey = 11
ORDER BY cs_gamesPL DESC;

--Shows club and their stats for 10/11 season ordered by matches won
SELECT c_name, n_name, cs_gamesPL, cs_gameW, cs_gameT, cs_gameL, cs_goalsFor, cs_goalsAgainst
FROM clubStats, club, nation
WHERE cs_clubkey = c_clubkey
    AND c_nationkey = n_nationkey
    AND cs_seasonkey = 11
ORDER BY cs_gameW DESC;

--Shows club and their stats for 10/11 season ordered by matches Tied
SELECT c_name, n_name, cs_gamesPL, cs_gameW, cs_gameT, cs_gameL, cs_goalsFor, cs_goalsAgainst
FROM clubStats, club, nation
WHERE cs_clubkey = c_clubkey
    AND c_nationkey = n_nationkey
    AND cs_seasonkey = 11
ORDER BY cs_gameT DESC;

--Shows club and their stats for 10/11 season ordered by matches loss
SELECT c_name, n_name, cs_gamesPL, cs_gameW, cs_gameT, cs_gameL, cs_goalsFor, cs_goalsAgainst
FROM clubStats, club, nation
WHERE cs_clubkey = c_clubkey
    AND c_nationkey = n_nationkey
    AND cs_seasonkey = 11
ORDER BY cs_gameL DESC;

--Shows club and their stats for 10/11 season ordered by goalsfor
SELECT c_name, n_name, cs_gamesPL, cs_gameW, cs_gameT, cs_gameL, cs_goalsFor, cs_goalsAgainst
FROM clubStats, club, nation
WHERE cs_clubkey = c_clubkey
    AND c_nationkey = n_nationkey
    AND cs_seasonkey = 11
ORDER BY cs_goalsFor DESC;

--Shows club and their stats for 10/11 season ordered by goalsAgainst
SELECT c_name, n_name, cs_gamesPL, cs_gameW, cs_gameT, cs_gameL, cs_goalsFor, cs_goalsAgainst
FROM clubStats, club, nation
WHERE cs_clubkey = c_clubkey
    AND c_nationkey = n_nationkey
    AND cs_seasonkey = 11
ORDER BY cs_goalsAgainst DESC;

--Shows top 3 player with most goals in 10/11
SELECT p_name, p_goals, c_name, n_name
FROM playerStats, club, nation
WHERE p_nationkey = n_nationkey
    AND c_clubkey = p_clubkey
    AND p_seasonkey = 11
ORDER BY p_goals DESC
LIMIT 3;

--Shows top 3 player with most apperances in 10/11
SELECT p_name, p_apperances, c_name, n_name
FROM playerStats, club, nation
WHERE p_nationkey = n_nationkey
    AND c_clubkey = p_clubkey
    AND p_seasonkey = 11
ORDER BY p_apperances DESC
LIMIT 3;

--Shows clubs that participated in 10/11 season
SELECT c_name, n_name
FROM clubStats, nation, club
WHERE cs_clubkey = c_clubkey
    AND c_nationkey = n_nationkey
    AND cs_seasonkey = 11
GROUP BY c_name;