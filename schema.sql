DROP TABLE season;
DROP TABLE matches;
DROP TABLE club;
DROP TABLE clubStats;
DROP TABLE stats;
DROP TABLE playerStats;
DROP TABLE nation;

CREATE TABLE season (
    s_seasonkey INT PRIMARY KEY,
    s_name VARCHAR(25) not null
);

CREATE TABLE matches (
    m_stage VARCHAR(25) not null,
    m_round VARCHAR(40) not null,
    m_group CHAR(5),
    m_date VARCHAR(50) null,
    m_team1 VARCHAR (50) not null,
    m_FT VARCHAR (10) not null,
    m_HT VARCHAR (10) not null,
    m_team2 VARCHAR (50) not null,
    m_agg VARCHAR (20),
    m_ET VARCHAR (20),
    m_penalties VARCHAR (20),
    m_comments VARCHAR (30),
    m_seasonkey INT,
    m_matchkey INT,
    m_winner VARCHAR(50),
    m_loser VARCHAR(50),
    m_tie VARCHAR (50)
);

CREATE TABLE club (
    c_clubkey INT NOT NULL,
    c_seasonkey INT NOT NULL,
    c_name VARCHAR(50) NOT NULL,
    c_clubstatskey INT NOT NULL,
    c_nationkey INT NOT NULL
);

CREATE TABLE clubStats (
    cs_clubkey INT NOT NULL,
    cs_gamesPL INT NOT NULL,
    cs_gameW INT NOT NULL,
    cs_gameT INT NOT NULL,
    cs_gameL INT NOT NULL,
    cs_goalsFor INT NOT NULL,
    cs_goalsAgainst INT NOT NULL,
    cs_matchkey INT NOT NULL,
    cs_statkey INT NOT NULL
);

CREATE TABLE stats (
    st_statkey INT PRIMARY KEY,
    st_seasoneky INT NOT NULL
);

CREATE TABLE playerStats (
    ps_playerkey INT NOT NULL,
    ps_statkey INT NOT NULL,
    p_name VARCHAR(20) NOT NULL,
    p_apperances INT,
    p_goals INT,
    p_assists INT,
    p_nationkey INT
);

CREATE TABLE nation (
    n_nationkey INT NOT NULL,
    n_name INT NOT NULL
);