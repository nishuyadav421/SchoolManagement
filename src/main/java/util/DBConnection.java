package util;
import java.sql.*;

public class DBConnection {
	public static Connection getConnection() throws Exception {
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    
	    
	    String host = System.getenv("MYSQLHOST");
	    String port = System.getenv("MYSQLPORT");
	    String dbName = System.getenv("MYSQLDATABASE"); // Screenshot mein MYSQLDATABASE hai
	    String user = System.getenv("MYSQLUSER");
	    String pass = System.getenv("MYSQLPASSWORD");

	    // Connection URL (Localhost ko hata kar ye link use hoga)
	    String url = "jdbc:mysql://" + host + ":" + port + "/" + dbName;

	    return DriverManager.getConnection(url, user, pass);
	}
}