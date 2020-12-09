const sqlite3 = require('sqlite3')
const Promise = require('bluebird')


class UCL {
    constructor(dbFilePath) {
        this.db = new sqlite3.Database(dbFilePath, (err) => {
            if (err) {
                console.log('Could not connect to database', err)
            } else {
                console.log('Connected to database')
            }
        })
    }

    all(sql, params = []) {
        return new Promise((resolve, reject) => {
            this.db.all(sql, params, (err, rows) => {
                if (err) {
                    console.log('Error running sql: ' + sql)
                    console.log(err)
                    reject(err)
                } else {
                    resolve(rows)
                }
            })
        })
    }

    matchesGroup(_seasonkey){
        return this.all(
            "SELECT m_group, m_date, m_team1, m_FT, m_team2 " +
            "FROM matches " +
            "WHERE m_stage = 'Group' " +
                "AND m_seasonkey = ? " +
            "ORDER BY m_group", [_seasonkey])
    }

    matches16(_seasonkey){
        return this.all(
            "SELECT m_round, m_date, m_team1, m_FT, m_team2, m_agg, m_comments " +
            "FROM matches " +
            "WHERE m_stage = 'Knockout' " +
                "AND m_seasonkey = ? " +
                "AND m_round LIKE 'Round of 16%'", [_seasonkey])
    }

    matchesQuarter(_seasonkey){
        return this.all(
            "SELECT m_round, m_date, m_team1, m_FT, m_team2, m_agg, m_comments " +
            "FROM matches " +
            "WHERE m_stage = 'Knockout' " +
                "AND m_seasonkey = ? " +
                "AND m_round LIKE 'Quarterfinals%'", [_seasonkey])
    }

    matchesSemi(_seasonkey){
        return this.all(
            "SELECT m_round, m_date, m_team1, m_FT, m_team2, m_agg, m_comments " +
            "FROM matches " +
            "WHERE m_stage = 'Knockout' "+
                "AND m_seasonkey = ? " +
                "AND m_round LIKE 'Semifinals%'", [_seasonkey])
    }

    matchesFinal(_seasonkey){
        return this.all(
            "SELECT m_round, m_date, m_team1, m_FT, m_team2, m_agg, m_comments " +
            "FROM matches " +
            "WHERE m_stage = 'Knockout' " +
                "AND m_seasonkey = ? " +
                "AND m_round = 'Final'", [_seasonkey])
    }

    clubParticipants(_seasonkey){
        return this.all(
            "SELECT c_name, n_name " +
            "FROM clubStats, nation, club " +
            "WHERE cs_clubkey = c_clubkey " +
                "AND c_nationkey = n_nationkey " +
                "AND cs_seasonkey = ? " +
            "GROUP BY c_name", [_seasonkey])
    }

    csName(_seasonkey){
        return this.all(
            "SELECT c_name, n_name, cs_gamesPL, cs_gameW, cs_gameT, cs_gameL, cs_goalsFor, cs_goalsAgainst " +
            "FROM clubStats, club, nation " +
            "WHERE cs_clubkey = c_clubkey " +
                "AND c_nationkey = n_nationkey " +
                "AND cs_seasonkey = ? " +
            "ORDER BY c_name", [_seasonkey])
    }

    csGamesPlayed(_seasonkey){
        return this.all(
            "SELECT c_name, n_name, cs_gamesPL, cs_gameW, cs_gameT, cs_gameL, cs_goalsFor, cs_goalsAgainst " +
            "FROM clubStats, club, nation " +
            "WHERE cs_clubkey = c_clubkey " +
                "AND c_nationkey = n_nationkey " +
                "AND cs_seasonkey = ? " +
            "ORDER BY cs_gamesPL DESC", [_seasonkey])
    }

    csGamesWon(_seasonkey){
        return this.all(
            "SELECT c_name, n_name, cs_gamesPL, cs_gameW, cs_gameT, cs_gameL, cs_goalsFor, cs_goalsAgainst " +
            "FROM clubStats, club, nation " +
            "WHERE cs_clubkey = c_clubkey " +
                "AND c_nationkey = n_nationkey " +
                "AND cs_seasonkey = ? " +
            "ORDER BY cs_gameW DESC", [_seasonkey])
    }

    csGamesTied(_seasonkey){
        return this.all(
            "SELECT c_name, n_name, cs_gamesPL, cs_gameW, cs_gameT, cs_gameL, cs_goalsFor, cs_goalsAgainst " +
            "FROM clubStats, club, nation " +
            "WHERE cs_clubkey = c_clubkey " + 
                "AND c_nationkey = n_nationkey" +
                "AND cs_seasonkey = ? " +
            "ORDER BY cs_gameT DESC", [_seasonkey])
    }

    csGamesLost(_seasonkey){
        return this.all(
            "SELECT c_name, n_name, cs_gamesPL, cs_gameW, cs_gameT, cs_gameL, cs_goalsFor, cs_goalsAgainst " +
            "FROM clubStats, club, nation " +
            "WHERE cs_clubkey = c_clubkey " +
                "AND c_nationkey = n_nationkey " +
                "AND cs_seasonkey = ? " +
            "ORDER BY cs_gameL DESC", [_seasonkey])
    }

    csGoalsFor(_seasonkey){
        return this.all(
            "SELECT c_name, n_name, cs_gamesPL, cs_gameW, cs_gameT, cs_gameL, cs_goalsFor, cs_goalsAgainst " +
            "FROM clubStats, club, nation " +
            "WHERE cs_clubkey = c_clubkey " +
                "AND c_nationkey = n_nationkey " +
                "AND cs_seasonkey = ? " +
            "ORDER BY cs_goalsFor DESC", [_seasonkey])
    }

    csGoalsAgainst(_seasonkey){
        return this.all(
            "SELECT c_name, n_name, cs_gamesPL, cs_gameW, cs_gameT, cs_gameL, cs_goalsFor, cs_goalsAgainst " +
            "FROM clubStats, club, nation " +
            "WHERE cs_clubkey = c_clubkey " +
                "AND c_nationkey = n_nationkey " +
                "AND cs_seasonkey = ? " +
            "ORDER BY cs_goalsAgainst DESC", [_seasonkey])
    }

    psTopScorer(_seasonkey){
        return this.all(
            "SELECT p_name, p_goals, c_name, n_name " +
            "FROM playerStats, club, nation " +
            "WHERE p_nationkey = n_nationkey " +
                "AND c_clubkey = p_clubkey " +
                "AND p_seasonkey = ? " +
            "ORDER BY p_goals DESC " +
            "LIMIT 3", [_seasonkey])
    }

    psMostApperances(_seasonkey){
        return this.all(
            "SELECT p_name, p_goals, c_name, n_name " +
            "FROM playerStats, club, nation " +
            "WHERE p_nationkey = n_nationkey " +
                "AND c_clubkey = p_clubkey " +
                "AND p_seasonkey = ? " +
            "ORDER BY p_apperances DESC " +
            "LIMIT 3", [_seasonkey])
    }

}

module.exports = UCL