import java.sql.*;
import java.util.Scanner;

public class ucl{
    private Connection c = null;
    private String dbName;
    private boolean isConnected = false;

    private void openConnection(String _dbName) {
        dbName = _dbName;

        if (false == isConnected) {
            System.out.println("++++++++++++++++++++++++++++++++++");
            System.out.println("Open database: " + _dbName);

            try {
                String connStr = new String("jdbc:sqlite:");
                connStr = connStr + _dbName;

                // STEP: Register JDBC driver
                Class.forName("org.sqlite.JDBC");

                // STEP: Open a connection
                c = DriverManager.getConnection(connStr);

                // STEP: Diable auto transactions
                c.setAutoCommit(false);

                isConnected = true;
                System.out.println("success");
            } catch (Exception e) {
                System.err.println(e.getClass().getName() + ": " + e.getMessage());
                System.exit(0);
            }

            System.out.println("++++++++++++++++++++++++++++++++++");
        }
    }

    private void closeConnection() {
        if (true == isConnected) {
            System.out.println("++++++++++++++++++++++++++++++++++");
            System.out.println("Close database: " + dbName);

            try {
                // STEP: Close connection
                c.close();

                isConnected = false;
                dbName = "";
                System.out.println("success");
            } catch (Exception e) {
                System.err.println(e.getClass().getName() + ": " + e.getMessage());
                System.exit(0);
            }

            System.out.println("++++++++++++++++++++++++++++++++++");
        }
    }

    private void matchesGroup(int _seasonkey){
        System.out.println("++++++++++++++++++++++++++++++++++");
        System.out.println("ALL GROUP STAGE MATCHES");

        try{
            "SELECT m_group, m_date, m_team1, m_FT, m_team2 " +
            "FROM matches " +
            "WHERE m_stage = 'Group' " +
                "AND m_seasonkey = ? " +
            "ORDER BY m_group";

        }catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }
        System.out.println("++++++++++++++++++++++++++++++++++");
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

    

    public static void main(String args[]) {
        ucl sj = new ucl();
        
        sj.openConnection("data/data.sqlite");

        Scanner sc = new Scanner(System.in);

        int _seasonkey = 0;

        System.out.println("Which season would you like to view?");
        System.out.println("For Season 10/11, type 11");
        System.out.println("For Season 11/12, type 12");
        System.out.println("For Season 12/13, type 13");
        System.out.println("For Season 13/14, type 14");
        System.out.println("For Season 14/15, type 15");
        System.out.println("For Season 15/16, type 16");
        _seasonkey = sc.nextInt();



        sj.matchesGroup(_seasonkey);



        sj.closeConnection();
    }
}