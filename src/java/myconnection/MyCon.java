package myconnection;
import java.sql.*;
public class MyCon 
{
   static Connection con;
    static
    {
    try
       {
           Class.forName("com.mysql.jdbc.Driver");
           System.out.println("driver load");
       }
       catch(ClassNotFoundException e)
       {
           System.out.println(e);
       }
       
    }
    
    public static Connection getConnection()
    {
       try
       {
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/htmltoexcel","root","root");
           System.out.println("database connected");
       }
       catch(SQLException e)
       {
           System.out.println(e);
       }   
       return con;
    }
}
