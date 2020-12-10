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
            String sql = "SELECT m_group, m_date, m_team1, m_FT, m_team2 " +
                "FROM matches " +
                "WHERE m_stage = 'Group' " +
                    "AND m_seasonkey = ? " +
                "ORDER BY m_group";
            
            PreparedStatement stmt = c.prepareStatement(sql);
            stmt.setInt(1, _seasonkey);
            ResultSet rs = stmt.executeQuery();

            System.out.printf("%s|%s|%s|%s|%s\n", "Group", "Date", "HOME", "Full-Time", "AWAY");

            while(rs.next()){
                String group = rs.getString("m_group");
                String date = rs.getString("m_date");
                String home = rs.getString("m_team1");
                String ft = rs.getString("m_FT");
                String away = rs.getString("m_team2");

                System.out.printf("%s|%s|%s|%s|%s\n", group, date, home, ft, away);
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