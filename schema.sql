DROP TABLE season;
DROP TABLE matches;
DROP TABLE club;
DROP TABLE clubStats;
DROP TABLE playerStats;
DROP TABLE nation;

CREATE TABLE seasons (
    s_seasonkey INT PRIMARY KEY,
    s_name VARCHAR(25) not null
);

CREATE TABLE matches (
    m_stage VARCHAR(25), 
    m_round VARCHAR(40),
    m_group CHAR(5),
    m_date VARCHAR(50),
    m_team1 VARCHAR (50),
    m_FT VARCHAR (10),
    m_HT VARCHAR (10),
    m_team2 VARCHAR (50),
    m_agg VARCHAR (20),
    m_ET VARCHAR (20),
    m_penalties VARCHAR (20),
    m_comments VARCHAR (30),
    m_seasonkey INT
);

CREATE TABLE club (
    c_clubkey INT NOT NULL,
    c_name VARCHAR(50) NOT NULL,
    c_nationkey INT NOT NULL
);

CREATE TABLE clubStats (
    cs_clubkey INT NOT NULL,
    cs_name VARCHAR(50),
    cs_gamesPL INT NOT NULL,
    cs_gameW INT NOT NULL,
    cs_gameT INT NOT NULL,
    cs_gameL INT NOT NULL,
    cs_goalsFor INT NOT NULL,
    cs_goalsAgainst INT NOT NULL,
    cs_seasonkey INT NOT NULL
);

CREATE TABLE playerStats (
    p_seasonkey INT,
    p_name VARCHAR(20),
    p_apperances INT,
    p_goals INT,
    p_clubkey INT,
    p_nationkey INT
);

CREATE TABLE nation (
    n_nationkey INT NOT NULL,
    n_name INT NOT NULL
);