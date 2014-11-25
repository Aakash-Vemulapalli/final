package UTILITY.utility;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class dbconnection 
{
	Connection conn=null;
	public Connection getconnection()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/etic","root", "root");
			System.out.println("connected");
			return conn;
		}
		catch (Exception e)
		{
			System.out.println("error in dbcoonection");
			e.getStackTrace();
			
		}
		return conn;
	}
	public void  closeConnection() 
	{
		try {
			conn.close();
			}
		
		catch (SQLException e) {
			System.out.println("error in dbconnection");
			e.printStackTrace();
		}
		
	}
	/*public static void main(String[] args) {
  		dbconnection db = new dbconnection();
		db.getconnection();
		db.closeconnection();
		
	}*/
	
}
