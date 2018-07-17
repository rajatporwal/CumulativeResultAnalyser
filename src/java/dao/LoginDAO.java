package dao;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.sql.ResultSet;
import myconnection.MyCon;
import java.sql.*;

public class LoginDAO {

    public boolean checkLogin(String umail , String upass)
    {
        try
       {
          java.sql.Connection con=null;
          con=MyCon.getConnection();
          java.sql.PreparedStatement ps=null;
          ResultSet rs=null;
          String sql;
          sql="select * from login where id=? and password=?";
          ps=con.prepareStatement(sql);
          ps.setString(1, umail);
          ps.setString(2, upass);
          rs=ps.executeQuery();
          int f=0;
          while(rs.next())
          {
              f=1;
          }
           if(f==1)
               return true;
      }
       catch(Exception e)
       {
           System.out.println(e);
       }   
     return false;  
    }
    
}
