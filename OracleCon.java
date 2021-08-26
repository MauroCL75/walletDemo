import java.sql.*;

class OracleCon {
    public static void main(String args[]) {
        try {
            // step1 load the driver class
            System.out.println("Conecting to "+args[0]);
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // step2 create the connection object
            Connection con = DriverManager.getConnection(args[0]);

            // step3 create the statement object
            Statement stmt = con.createStatement();

            // step4 execute query
            ResultSet rs = stmt.executeQuery("select SYSTIMESTAMP from DUAL");
            while (rs.next())
                System.out.println(rs.getString(1));

            // step5 close the connection object
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }

    }
}
