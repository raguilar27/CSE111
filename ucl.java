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

    private void seasons(){
        System.out.println("Type in designated Seasonkey to choose the Season.");

        try{
            String sql = "SELECT s_seasonkey, s_name " +
                "FROM seasons";

            PreparedStatement stmt = c.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            System.out.printf("%s | %s\n", "Seasonkey", "Season");
            System.out.println("-------------------------------");


            while(rs.next()){
                int seasonkey = rs.getInt("s_seasonkey");
                String season = rs.getString("s_name");

                System.out.printf("%s | %s\n", seasonkey, season);
            }

            stmt.close();
            rs.close();
        }catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }
    }

    private void matchesGroup(int _seasonkey){
        System.out.println("++++++++++++++++++++++++++++++++++");
        System.out.println("ALL GROUP STAGE MATCHES");

        try{
            String sql = "SELECT m_group, m_date, m_team1, m_FT, m_team2 " +
                "FROM matches " +
                "WHERE m_stage = 'Group' " +
                    "AND m_seasonkey = ? " +
                "ORDER BY m_group";
            
            PreparedStatement stmt = c.prepareStatement(sql);
            stmt.setInt(1, _seasonkey);
            ResultSet rs = stmt.executeQuery();

            System.out.printf("%s | %s | %s | %s | %s\n", "Group", "Date", "HOME", "Full-Time", "AWAY");
            System.out.println("----------------------------------------------------------------------------------");

            while(rs.next()){
                String group = rs.getString("m_group");
                String date = rs.getString("m_date");
                String home = rs.getString("m_team1");
                String ft = rs.getString("m_FT");
                String away = rs.getString("m_team2");

                System.out.printf("%s | %s | %s | %s | %s\n", group, date, home, ft, away);
            }

            stmt.close();
            rs.close();
        }catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }
        System.out.println("++++++++++++++++++++++++++++++++++");
    }

    private void matches16(int _seasonkey){
        System.out.println("++++++++++++++++++++++++++++++++++");
        System.out.println("ALL ROUND OF 16 MATCHES");

        try{
            String sql = "SELECT m_round, m_date, m_team1, m_FT, m_team2, m_agg, m_comments " +
                "FROM matches " +
                "WHERE m_stage = 'Knockout' " +
                    "AND m_seasonkey = ? " +
                    "AND m_round LIKE 'Round of 16%'";
            
            PreparedStatement stmt = c.prepareStatement(sql);
            stmt.setInt(1, _seasonkey);
            ResultSet rs = stmt.executeQuery();

            System.out.printf("%s | %s | %s | %s | %s | %s | %s\n", "Round", "Date", "HOME", "Full-Time", "AWAY", "AGG", "Comments");
            System.out.println("--------------------------------------------------------------------------------------------------");

            while(rs.next()){
                String round = rs.getString("m_round");
                String date = rs.getString("m_date");
                String home = rs.getString("m_team1");
                String ft = rs.getString("m_FT");
                String away = rs.getString("m_team2");
                String agg = rs.getString("m_agg");
                String comments = rs.getString("m_comments");

                System.out.printf("%s | %s | %s | %s | %s | %s | %s\n", round, date, home, ft, away, agg, comments);
            }

            stmt.close();
            rs.close();
        }catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }
        System.out.println("++++++++++++++++++++++++++++++++++");
    }

    private void matchesQuarter(int _seasonkey){
        System.out.println("++++++++++++++++++++++++++++++++++");
        System.out.println("ALL QUARTERFINAL MATCHES");

        try{
            String sql = "SELECT m_round, m_date, m_team1, m_FT, m_team2, m_agg, m_comments " +
                "FROM matches " +
                "WHERE m_stage = 'Knockout' " +
                    "AND m_seasonkey = ? " +
                    "AND m_round LIKE 'Quarterfinals%'";
            
            PreparedStatement stmt = c.prepareStatement(sql);
            stmt.setInt(1, _seasonkey);
            ResultSet rs = stmt.executeQuery();

            System.out.printf("%s | %s | %s | %s | %s | %s | %s\n", "Round", "Date", "HOME", "Full-Time", "AWAY", "AGG", "Comments");
            System.out.println("--------------------------------------------------------------------------------------------------");

            while(rs.next()){
                String round = rs.getString("m_round");
                String date = rs.getString("m_date");
                String home = rs.getString("m_team1");
                String ft = rs.getString("m_FT");
                String away = rs.getString("m_team2");
                String agg = rs.getString("m_agg");
                String comments = rs.getString("m_comments");

                System.out.printf("%s | %s | %s | %s | %s | %s | %s\n", round, date, home, ft, away, agg, comments);
            }

            stmt.close();
            rs.close();
        }catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }
        System.out.println("++++++++++++++++++++++++++++++++++");
    }

    private void matchesSemi(int _seasonkey){
        System.out.println("++++++++++++++++++++++++++++++++++");
        System.out.println("ALL SEMIFINAL MATCHES");

        try{
            String sql =  "SELECT m_round, m_date, m_team1, m_FT, m_team2, m_agg, m_comments " +
                "FROM matches " +
                "WHERE m_stage = 'Knockout' "+
                    "AND m_seasonkey = ? " +
                    "AND m_round LIKE 'Semifinals%'";
            
            PreparedStatement stmt = c.prepareStatement(sql);
            stmt.setInt(1, _seasonkey);
            ResultSet rs = stmt.executeQuery();

            System.out.printf("%s | %s | %s | %s | %s | %s | %s\n", "Round", "Date", "HOME", "Full-Time", "AWAY", "AGG", "Comments");
            System.out.println("--------------------------------------------------------------------------------------------------");

            while(rs.next()){
                String round = rs.getString("m_round");
                String date = rs.getString("m_date");
                String home = rs.getString("m_team1");
                String ft = rs.getString("m_FT");
                String away = rs.getString("m_team2");
                String agg = rs.getString("m_agg");
                String comments = rs.getString("m_comments");

                System.out.printf("%s | %s | %s | %s | %s | %s | %s\n", round, date, home, ft, away, agg, comments);
            }

            stmt.close();
            rs.close();
        }catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }
        System.out.println("++++++++++++++++++++++++++++++++++");
    }

    private void matchesFinal(int _seasonkey){
        System.out.println("++++++++++++++++++++++++++++++++++");
        System.out.println("UEFA CHAMPIONS LEAUGE FINAL");

        try{
            String sql =  "SELECT m_round, m_date, m_team1, m_FT, m_team2, m_agg, m_comments " +
                "FROM matches " +
                "WHERE m_stage = 'Knockout' "+
                    "AND m_seasonkey = ? " +
                    "AND m_round LIKE 'Final%'";
            
            PreparedStatement stmt = c.prepareStatement(sql);
            stmt.setInt(1, _seasonkey);
            ResultSet rs = stmt.executeQuery();

            System.out.printf("%s | %s | %s | %s | %s | %s | %s\n", "Round", "Date", "HOME", "Full-Time", "AWAY", "AGG", "Comments");
            System.out.println("--------------------------------------------------------------------------------------------------");

            while(rs.next()){
                String round = rs.getString("m_round");
                String date = rs.getString("m_date");
                String home = rs.getString("m_team1");
                String ft = rs.getString("m_FT");
                String away = rs.getString("m_team2");
                String agg = rs.getString("m_agg");
                String comments = rs.getString("m_comments");

                System.out.printf("%s | %s | %s | %s | %s | %s | %s\n", round, date, home, ft, away, agg, comments);
            }

            stmt.close();
            rs.close();
        }catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }
        System.out.println("++++++++++++++++++++++++++++++++++");
    }

    private void clubParticipants(int _seasonkey){
        System.out.println("++++++++++++++++++++++++++++++++++");
        System.out.println("CLUBS PARTICIPATED");

        try{
            String sql =  "SELECT c_name, n_name " +
                "FROM clubStats, nation, club " +
                "WHERE cs_clubkey = c_clubkey " +
                    "AND c_nationkey = n_nationkey " +
                    "AND cs_seasonkey = ? " +
                "GROUP BY c_name";
            
            PreparedStatement stmt = c.prepareStatement(sql);
            stmt.setInt(1, _seasonkey);
            ResultSet rs = stmt.executeQuery();

            System.out.printf("%s | %s\n", "CLUB", "NATION");
            System.out.println("---------------------------");

            while(rs.next()){
                String club = rs.getString("c_name");
                String nation = rs.getString("n_name");

                System.out.printf("%s | %s\n", club, nation);
            }

            stmt.close();
            rs.close();
        }catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }
        System.out.println("++++++++++++++++++++++++++++++++++");
    }

    private void csName(int _seasonkey){
        System.out.println("++++++++++++++++++++++++++++++++++");
        System.out.println("CLUB STATISTICS ORDERED BY CLUB NAME");

        try{
            String sql = "SELECT c_name, n_name, cs_gamesPL, cs_gameW, cs_gameT, cs_gameL, cs_goalsFor, cs_goalsAgainst " +
                "FROM clubStats, club, nation " +
                "WHERE cs_clubkey = c_clubkey " +
                    "AND c_nationkey = n_nationkey " +
                    "AND cs_seasonkey = ? " +
                "ORDER BY c_name";
            
            PreparedStatement stmt = c.prepareStatement(sql);
            stmt.setInt(1, _seasonkey);
            ResultSet rs = stmt.executeQuery();

            System.out.printf("%s | %s | %s | %s | %s | %s | %s |%s\n", "CLUB", "NATION", "PLAYED", "WON", "TIED", "LOST", "Goals For", "Goals Against");
            System.out.println("--------------------------------------------------------------------------------------------------");

            while(rs.next()){
                String club = rs.getString("c_name");
                String nation= rs.getString("n_name");
                int played = rs.getInt("cs_gamesPL");
                int won = rs.getInt("cs_gameW");
                int tied = rs.getInt("cs_gameT");
                int lost = rs.getInt("cs_gameL");
                int goalsFor = rs.getInt("cs_goalsFor");
                int goalsAgainst = rs.getInt("cs_goalsAgainst");

                System.out.printf("%s | %s | %d | %d | %d | %d | %d |%d\n", club, nation, played, won, tied, lost, goalsFor, goalsAgainst);
            }

            stmt.close();
            rs.close();
        }catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }
        System.out.println("++++++++++++++++++++++++++++++++++");
    }

    private void csGamesPlayed(int _seasonkey){
        System.out.println("++++++++++++++++++++++++++++++++++");
        System.out.println("CLUB STATISTICS ORDERED BY MOST GAMES PLAYED");

        try{
            String sql = "SELECT c_name, n_name, cs_gamesPL, cs_gameW, cs_gameT, cs_gameL, cs_goalsFor, cs_goalsAgainst " +
                "FROM clubStats, club, nation " +
                "WHERE cs_clubkey = c_clubkey " +
                    "AND c_nationkey = n_nationkey " +
                    "AND cs_seasonkey = ? " +
                "ORDER BY cs_gamesPL DESC";
            
            PreparedStatement stmt = c.prepareStatement(sql);
            stmt.setInt(1, _seasonkey);
            ResultSet rs = stmt.executeQuery();

            System.out.printf("%s | %s | %s | %s | %s | %s | %s |%s\n", "CLUB", "NATION", "PLAYED", "WON", "TIED", "LOST", "Goals For", "Goals Against");
            System.out.println("--------------------------------------------------------------------------------------------------");

            while(rs.next()){
                String club = rs.getString("c_name");
                String nation= rs.getString("n_name");
                int played = rs.getInt("cs_gamesPL");
                int won = rs.getInt("cs_gameW");
                int tied = rs.getInt("cs_gameT");
                int lost = rs.getInt("cs_gameL");
                int goalsFor = rs.getInt("cs_goalsFor");
                int goalsAgainst = rs.getInt("cs_goalsAgainst");

                System.out.printf("%s | %s | %d | %d | %d | %d | %d |%d\n", club, nation, played, won, tied, lost, goalsFor, goalsAgainst);
            }

            stmt.close();
            rs.close();
        }catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }
        System.out.println("++++++++++++++++++++++++++++++++++");
    }

    private void csGamesWon(int _seasonkey){
        System.out.println("++++++++++++++++++++++++++++++++++");
        System.out.println("CLUB STATISTICS ORDERED BY MOST GAMES WON");

        try{
            String sql = "SELECT c_name, n_name, cs_gamesPL, cs_gameW, cs_gameT, cs_gameL, cs_goalsFor, cs_goalsAgainst " +
                "FROM clubStats, club, nation " +
                "WHERE cs_clubkey = c_clubkey " +
                    "AND c_nationkey = n_nationkey " +
                    "AND cs_seasonkey = ? " +
                "ORDER BY cs_gameW DESC";
            
            PreparedStatement stmt = c.prepareStatement(sql);
            stmt.setInt(1, _seasonkey);
            ResultSet rs = stmt.executeQuery();

            System.out.printf("%s | %s | %s | %s | %s | %s | %s |%s\n", "CLUB", "NATION", "PLAYED", "WON", "TIED", "LOST", "Goals For", "Goals Against");
            System.out.println("--------------------------------------------------------------------------------------------------");

            while(rs.next()){
                String club = rs.getString("c_name");
                String nation= rs.getString("n_name");
                int played = rs.getInt("cs_gamesPL");
                int won = rs.getInt("cs_gameW");
                int tied = rs.getInt("cs_gameT");
                int lost = rs.getInt("cs_gameL");
                int goalsFor = rs.getInt("cs_goalsFor");
                int goalsAgainst = rs.getInt("cs_goalsAgainst");

                System.out.printf("%s | %s | %d | %d | %d | %d | %d |%d\n", club, nation, played, won, tied, lost, goalsFor, goalsAgainst);
            }

            stmt.close();
            rs.close();
        }catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }
        System.out.println("++++++++++++++++++++++++++++++++++");
    }

    private void csGamesTied(int _seasonkey){
        System.out.println("++++++++++++++++++++++++++++++++++");
        System.out.println("CLUB STATISTICS ORDERED BY MOST GAMES TIED");

        try{
            String sql = "SELECT c_name, n_name, cs_gamesPL, cs_gameW, cs_gameT, cs_gameL, cs_goalsFor, cs_goalsAgainst " +
                "FROM clubStats, club, nation " +
                "WHERE cs_clubkey = c_clubkey " +
                    "AND c_nationkey = n_nationkey " +
                    "AND cs_seasonkey = ? " +
                "ORDER BY cs_gameW DESC";
            
            PreparedStatement stmt = c.prepareStatement(sql);
            stmt.setInt(1, _seasonkey);
            ResultSet rs = stmt.executeQuery();

            System.out.printf("%s | %s | %s | %s | %s | %s | %s |%s\n", "CLUB", "NATION", "PLAYED", "WON", "TIED", "LOST", "Goals For", "Goals Against");
            System.out.println("--------------------------------------------------------------------------------------------------");

            while(rs.next()){
                String club = rs.getString("c_name");
                String nation= rs.getString("n_name");
                int played = rs.getInt("cs_gamesPL");
                int won = rs.getInt("cs_gameW");
                int tied = rs.getInt("cs_gameT");
                int lost = rs.getInt("cs_gameL");
                int goalsFor = rs.getInt("cs_goalsFor");
                int goalsAgainst = rs.getInt("cs_goalsAgainst");

                System.out.printf("%s | %s | %d | %d | %d | %d | %d |%d\n", club, nation, played, won, tied, lost, goalsFor, goalsAgainst);
            }

            stmt.close();
            rs.close();
        }catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }
        System.out.println("++++++++++++++++++++++++++++++++++");
    }

    private void csGamesLost(int _seasonkey){
        System.out.println("++++++++++++++++++++++++++++++++++");
        System.out.println("CLUB STATISTICS ORDERED BY MOST GAMES LOST");

        try{
            String sql = "SELECT c_name, n_name, cs_gamesPL, cs_gameW, cs_gameT, cs_gameL, cs_goalsFor, cs_goalsAgainst " +
                "FROM clubStats, club, nation " +
                "WHERE cs_clubkey = c_clubkey " +
                    "AND c_nationkey = n_nationkey " +
                    "AND cs_seasonkey = ? " +
                "ORDER BY cs_gameL DESC";
            
            PreparedStatement stmt = c.prepareStatement(sql);
            stmt.setInt(1, _seasonkey);
            ResultSet rs = stmt.executeQuery();

            System.out.printf("%s | %s | %s | %s | %s | %s | %s |%s\n", "CLUB", "NATION", "PLAYED", "WON", "TIED", "LOST", "Goals For", "Goals Against");
            System.out.println("--------------------------------------------------------------------------------------------------");

            while(rs.next()){
                String club = rs.getString("c_name");
                String nation= rs.getString("n_name");
                int played = rs.getInt("cs_gamesPL");
                int won = rs.getInt("cs_gameW");
                int tied = rs.getInt("cs_gameT");
                int lost = rs.getInt("cs_gameL");
                int goalsFor = rs.getInt("cs_goalsFor");
                int goalsAgainst = rs.getInt("cs_goalsAgainst");

                System.out.printf("%s | %s | %d | %d | %d | %d | %d |%d\n", club, nation, played, won, tied, lost, goalsFor, goalsAgainst);
            }

            stmt.close();
            rs.close();
        }catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }
        System.out.println("++++++++++++++++++++++++++++++++++");
    }

    private void csGoalsFor(int _seasonkey){
        System.out.println("++++++++++++++++++++++++++++++++++");
        System.out.println("CLUB STATISTICS ORDERED BY MOST GOALS SCORED");

        try{
            String sql = "SELECT c_name, n_name, cs_gamesPL, cs_gameW, cs_gameT, cs_gameL, cs_goalsFor, cs_goalsAgainst " +
                "FROM clubStats, club, nation " +
                "WHERE cs_clubkey = c_clubkey " +
                    "AND c_nationkey = n_nationkey " +
                    "AND cs_seasonkey = ? " +
                "ORDER BY cs_goalsFor DESC";
            
            PreparedStatement stmt = c.prepareStatement(sql);
            stmt.setInt(1, _seasonkey);
            ResultSet rs = stmt.executeQuery();

            System.out.printf("%s | %s | %s | %s | %s | %s | %s |%s\n", "CLUB", "NATION", "PLAYED", "WON", "TIED", "LOST", "Goals For", "Goals Against");
            System.out.println("--------------------------------------------------------------------------------------------------");

            while(rs.next()){
                String club = rs.getString("c_name");
                String nation= rs.getString("n_name");
                int played = rs.getInt("cs_gamesPL");
                int won = rs.getInt("cs_gameW");
                int tied = rs.getInt("cs_gameT");
                int lost = rs.getInt("cs_gameL");
                int goalsFor = rs.getInt("cs_goalsFor");
                int goalsAgainst = rs.getInt("cs_goalsAgainst");

                System.out.printf("%s | %s | %d | %d | %d | %d | %d |%d\n", club, nation, played, won, tied, lost, goalsFor, goalsAgainst);
            }

            stmt.close();
            rs.close();
        }catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }
        System.out.println("++++++++++++++++++++++++++++++++++");
    }

    private void csGoalsAgainst(int _seasonkey){
        System.out.println("++++++++++++++++++++++++++++++++++");
        System.out.println("CLUB STATISTICS ORDERED BY MOST GOALS CONCEDED");

        try{
            String sql = "SELECT c_name, n_name, cs_gamesPL, cs_gameW, cs_gameT, cs_gameL, cs_goalsFor, cs_goalsAgainst " +
                "FROM clubStats, club, nation " +
                "WHERE cs_clubkey = c_clubkey " +
                    "AND c_nationkey = n_nationkey " +
                    "AND cs_seasonkey = ? " +
                "ORDER BY cs_goalsAgainst DESC";
            
            PreparedStatement stmt = c.prepareStatement(sql);
            stmt.setInt(1, _seasonkey);
            ResultSet rs = stmt.executeQuery();

            System.out.printf("%s | %s | %s | %s | %s | %s | %s |%s\n", "CLUB", "NATION", "PLAYED", "WON", "TIED", "LOST", "Goals For", "Goals Against");
            System.out.println("--------------------------------------------------------------------------------------------------");

            while(rs.next()){
                String club = rs.getString("c_name");
                String nation= rs.getString("n_name");
                int played = rs.getInt("cs_gamesPL");
                int won = rs.getInt("cs_gameW");
                int tied = rs.getInt("cs_gameT");
                int lost = rs.getInt("cs_gameL");
                int goalsFor = rs.getInt("cs_goalsFor");
                int goalsAgainst = rs.getInt("cs_goalsAgainst");

                System.out.printf("%s | %s | %d | %d | %d | %d | %d |%d\n", club, nation, played, won, tied, lost, goalsFor, goalsAgainst);
            }

            stmt.close();
            rs.close();
        }catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }
        System.out.println("++++++++++++++++++++++++++++++++++");
    }

    private void psTopScorer(int _seasonkey){
        System.out.println("++++++++++++++++++++++++++++++++++");
        System.out.println("PLAYER STATISTICS FOR TOP 3 SCORERS OF THE SEASON");

        try{
            String sql = "SELECT p_name, p_goals, c_name, n_name " +
                "FROM playerStats, club, nation " +
                "WHERE p_nationkey = n_nationkey " +
                    "AND c_clubkey = p_clubkey " +
                    "AND p_seasonkey = ? " +
                "ORDER BY p_goals DESC " +
                "LIMIT 3";
            
            PreparedStatement stmt = c.prepareStatement(sql);
            stmt.setInt(1, _seasonkey);
            ResultSet rs = stmt.executeQuery();

            System.out.printf("%s | %s | %s | %s\n", "PLAYER", "GOALS", "CLUB", "NATION");
            System.out.println("-------------------------------------------------------");

            while(rs.next()){
                String player = rs.getString("p_name");
                String goals = rs.getString("p_goals");
                String club = rs.getString("c_name");
                String nation= rs.getString("n_name");

                System.out.printf("%s | %s | %s | %s\n", player, goals, club, nation);
            }

            stmt.close();
            rs.close();
        }catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }
        System.out.println("++++++++++++++++++++++++++++++++++");
    }

    private void psMostApperances(int _seasonkey){
        System.out.println("++++++++++++++++++++++++++++++++++");
        System.out.println("PLAYER STATISTICS FOR TOP 3 MOST APPEARED PLAYERS OF THE SEASON");

        try{
            String sql = "SELECT p_name, p_apperances, c_name, n_name " +
                "FROM playerStats, club, nation " +
                "WHERE p_nationkey = n_nationkey " +
                    "AND c_clubkey = p_clubkey " +
                    "AND p_seasonkey = ? " +
                "ORDER BY p_apperances DESC " +
                "LIMIT 3";
            
            PreparedStatement stmt = c.prepareStatement(sql);
            stmt.setInt(1, _seasonkey);
            ResultSet rs = stmt.executeQuery();

            System.out.printf("%s | %s | %s | %s\n", "PLAYER", "APPEARANCES", "CLUB", "NATION");
            System.out.println("-------------------------------------------------------");

            while(rs.next()){
                String player = rs.getString("p_name");
                String appearances = rs.getString("p_apperances");
                String club = rs.getString("c_name");
                String nation= rs.getString("n_name");

                System.out.printf("%s | %s | %s | %s\n", player, appearances, club, nation);
            }

            stmt.close();
            rs.close();
        }catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }
        System.out.println("++++++++++++++++++++++++++++++++++");
    }

    public static void main(String args[]) {
        ucl sj = new ucl();
        
        sj.openConnection("data/data.sqlite");

        Scanner sc = new Scanner(System.in);

        int _seasonkey = 0;

        System.out.println("Which season would you like to view?");
        sj.seasons();

        if (sc.hasNextInt()){
            _seasonkey = sc.nextInt();
            if(_seasonkey < 11 || _seasonkey > 16){
                System.out.println("Choose a valid season.");
            }
        }

        System.out.println("What option would you like to see?");
        System.out.println("Enter 1, To see matches and standings from that season");
        System.out.println("Enter 2, To see clubs that participated in that season");
        System.out.println("Enter 3, To see the club stats from that season");
        System.out.println("Enter 4, To see the player stats from that season");

        int option = -1;

        boolean input = false;

        do{
            if(sc.hasNextInt()){
                option = sc.nextInt();
            }

            switch(option){
                case 1:
                    sj.matchesGroup(_seasonkey);
                    sj.matches16(_seasonkey);
                    sj.matchesQuarter(_seasonkey);
                    sj.matchesSemi(_seasonkey);
                    sj.matchesFinal(_seasonkey);
                    input = true;
                    break;
                case 2:
                    sj.clubParticipants(_seasonkey);
                    input = true;
                    break;
                case 3:
                    System.out.println("How would you like to see the Club Stats ordered by?");
                    System.out.println("Enter 1, To see club stats ordered by club name");
                    System.out.println("Enter 2, To see club stats ordered by games played");
                    System.out.println("Enter 3, To see club stats ordered by games won");
                    System.out.println("Enter 4, To see club stats ordered by games tied");
                    System.out.println("Enter 5, To see club stats ordered by games lost");
                    System.out.println("Enter 6, To see club stats ordered by goals scored");
                    System.out.println("Enter 7, To see club stats ordered by goals conceded");

                    int order = -1;

                    if(sc.hasNextInt()){
                        order = sc.nextInt();
                    }

                    switch(order){
                        case 1:
                            sj.csName(_seasonkey);
                            break;
                        case 2:
                            sj.csGamesPlayed(_seasonkey);
                            break;
                        case 3:
                            sj.csGamesWon(_seasonkey);
                            break;
                        case 4:
                            sj.csGamesTied(_seasonkey);
                            break;
                        case 5:
                            sj.csGamesLost(_seasonkey);
                            break;
                        case 6:
                            sj.csGoalsFor(_seasonkey);
                            break;
                        case 7:
                            sj.csGoalsAgainst(_seasonkey);
                            break;
                        default:
                            System.out.println("Choice must be a value between 1 and 7.");
                    }
                    input = true;
                    break;
                case 4:
                    sj.psTopScorer(_seasonkey);
                    sj.psMostApperances(_seasonkey);
                    input = true;
                    break;
                default:
                    System.out.println("Choice must be a value between 1 and 4.");
                    input = false;
            }
        }while (!input);

        sj.closeConnection();
    }
}