package util;
import java.sql.*;

public class DBConnection {
	public static Connection getConnection() throws Exception {
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    
	   
	    String url = System.getenv("MYSQL_URL"); 
	    String user = System.getenv("MYSQLUSER");
	    String pass = System.getenv("MYSQLPASSWORD");
	    
	   
	    if (url == null) {
	        url = "jdbc:mysql://localhost:3306/school_db"; 
	        user = "root";
	        pass = "nishu@12345";
	    }

	    return DriverManager.getConnection(url, user, pass);
	}
}