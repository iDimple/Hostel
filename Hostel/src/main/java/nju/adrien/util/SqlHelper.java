package nju.adrien.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SqlHelper {
    private static String driver = "com.mysql.jdbc.Driver";

    /** URL指向要访问的数据库名 */
    private static String url = "jdbc:mysql://127.0.0.1:3306/";




    public static Connection conn;




    public static Connection getConnection() {
        return conn;
    }



    static {
        try {
            // 加载驱动程序
            Class.forName(driver);
            // 连续数据库
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hostel?user=root&password=root&useUnicode=true&characterEncoding=UTF8");
            if (!conn.isClosed())
                System.out.println("Succeeded connecting to the Database!");
        } catch (ClassNotFoundException e) {
            System.out.println("Sorry,can`t find the Driver!");
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



}
