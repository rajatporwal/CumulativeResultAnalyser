package dao;
import java.sql.*;
import java.util.*;
import myconnection.MyCon;

public class ReadHtmlDAO 
{
  Connection con=null;
  PreparedStatement ps=null;
    
  public boolean insertData(ReadHtml rd) throws Exception
  {
    con=MyCon.getConnection();
    String sql="insert into htmlexcelnew values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    ps=con.prepareStatement(sql);
    ps.setString(1,rd.getRollno());
    ps.setString(2,rd.getName());
    ps.setString(3,rd.getCourse());
    ps.setString(4,rd.getBranch());
    ps.setString(5,rd.getSem());
    ps.setString(6,rd.getStatus());
    ps.setString(7,rd.getSub1());
    ps.setString(8,rd.getSub2());
    ps.setString(9,rd.getSub3());
    ps.setString(10,rd.getSub4());
    ps.setString(11,rd.getSub5());
    ps.setString(12,rd.getSub6());
    ps.setString(13,rd.getSub7());
    ps.setString(14,rd.getSub8());
    ps.setString(15,rd.getSub9());
    ps.setString(16,rd.getSub10());
    ps.setString(17,rd.getSub11());
    ps.setString(18,rd.getSub12());
    ps.setString(19,rd.getSub13());
    ps.setString(20,rd.getSub14());
    ps.setString(21,rd.getSub15());
    ps.setString(22,rd.getSub16());
    ps.setString(23,rd.getResult());
    ps.setString(24,rd.getSgpa());
    ps.setString(25,rd.getCgpa());
    ps.setString(26,rd.getSession());
    ps.setString(27,rd.getCode());
   
   
    
    if(ps.executeUpdate()>0)
        return true;
    
        return false;
    
  }
  
  public boolean updateData(ReadHtml rd) throws Exception
  {
    con=MyCon.getConnection();
    String sql="update htmlexcelnew set sub1=?,sub2=?,sub3=?,sub4=?,sub5=?,sub6=?,sub7=?,sub8=?,sub9=?,sub10=?,"
            + "sub11=?,sub12=?,sub13=?,sub14=?,sub15=?,sub16=?,result=?,sgpa=?,cgpa=?,code=? where rollno=? and branch=? and semester=? and session=? ";
    ps=con.prepareStatement(sql);
    ps.setString(1,rd.getSub1());
    ps.setString(2,rd.getSub2());
    ps.setString(3,rd.getSub3());
    ps.setString(4,rd.getSub4());
    ps.setString(5,rd.getSub5());
    ps.setString(6,rd.getSub6());
    ps.setString(7,rd.getSub7());
    ps.setString(8,rd.getSub8());
    ps.setString(9,rd.getSub9());
    ps.setString(10,rd.getSub10());
    ps.setString(11,rd.getSub11());
    ps.setString(12,rd.getSub12());
    ps.setString(13,rd.getSub13());
    ps.setString(14,rd.getSub14());
    ps.setString(15,rd.getSub15());
    ps.setString(16,rd.getSub16());
    ps.setString(17,rd.getResult());
    ps.setString(18,rd.getSgpa());
    ps.setString(19,rd.getCgpa());
    ps.setString(20,rd.getCode());
    ps.setString(21,rd.getRollno());
    ps.setString(22,rd.getBranch());
    ps.setString(23,rd.getSem());
    ps.setString(24,rd.getSession());
    
    if(ps.executeUpdate()>0)
        return true;
    
        return false;
    
  }
  
  public boolean deleteData(String branch,String semester,String rnofrom,String rnoto) throws Exception
  {
    con=MyCon.getConnection();
    String sql="delete from htmlexcelnew where rollno between ? and ? and branch=? and semester=?";
    ps=con.prepareStatement(sql);
       ps.setString(3, branch);
       ps.setString(4, semester);
       ps.setString(1, rnofrom);
       ps.setString(2, rnoto);
    
    if(ps.executeUpdate()>0)
        return true;
    
        return false;
    
  }
  
   public List searchAllStudent(String branch,String semester,String rnofrom,String rnoto) throws Exception
      {
       con=MyCon.getConnection();
       ResultSet rs;    
       String sql;
     
       sql="select * from htmlexcelnew where branch=? and semester=? and rollno between ? and ?";
       ps=con.prepareStatement(sql);
       ps.setString(1, branch);
       ps.setString(2, semester);
       ps.setString(3, rnofrom);
       ps.setString(4, rnoto);
       rs=ps.executeQuery();
       List <ReadHtml>mylist= new ArrayList<ReadHtml>();
      
      while(rs.next())
      { 
        
        ReadHtml rd = new ReadHtml();
        rd.setRollno(rs.getString(1));
        rd.setName(rs.getString(2));
        rd.setCourse(rs.getString(3));
        rd.setBranch(rs.getString(4));
        rd.setSem(rs.getString(5));
        rd.setStatus(rs.getString(6));
        rd.setSub1(rs.getString(7));
        rd.setSub2(rs.getString(8));
        rd.setSub3(rs.getString(9));
        rd.setSub4(rs.getString(10));
        rd.setSub5(rs.getString(11));
        rd.setSub6(rs.getString(12));
        rd.setSub7(rs.getString(13));
        rd.setSub8(rs.getString(14));
        rd.setSub9(rs.getString(15));
        rd.setSub10(rs.getString(16));
        rd.setSub11(rs.getString(17));
        rd.setSub12(rs.getString(18));
        rd.setSub13(rs.getString(19));
        rd.setSub14(rs.getString(20));
        rd.setSub15(rs.getString(21));
        rd.setSub16(rs.getString(22));
        rd.setResult(rs.getString(23));
        rd.setSgpa(rs.getString(24));
        rd.setCgpa(rs.getString(25));
        
        mylist.add(rd);
        rd=null;    
     }
      return mylist;
      
      }
   
   public List searchCodeBatch(String code) throws Exception
      {
       con=MyCon.getConnection();
       ResultSet rs;    
       String sql;
     
       sql="select * from htmlexcelnew where branch=? and semester=? and rollno between ? and ?";
       ps=con.prepareStatement(sql);
       ps.setString(1, code);
       rs=ps.executeQuery();
       List <ReadHtml>mylist= new ArrayList<ReadHtml>();
      
      while(rs.next())
      { 
        
        ReadHtml rd = new ReadHtml();
        rd.setRollno(rs.getString(1));
        rd.setName(rs.getString(2));
        rd.setCourse(rs.getString(3));
        rd.setBranch(rs.getString(4));
        rd.setSem(rs.getString(5));
        rd.setStatus(rs.getString(6));
        rd.setSub1(rs.getString(7));
        rd.setSub2(rs.getString(8));
        rd.setSub3(rs.getString(9));
        rd.setSub4(rs.getString(10));
        rd.setSub5(rs.getString(11));
        rd.setSub6(rs.getString(12));
        rd.setSub7(rs.getString(13));
        rd.setSub8(rs.getString(14));
        rd.setSub9(rs.getString(15));
        rd.setSub10(rs.getString(16));
        rd.setSub11(rs.getString(17));
        rd.setSub12(rs.getString(18));
        rd.setSub13(rs.getString(19));
        rd.setSub14(rs.getString(20));
        rd.setSub15(rs.getString(21));
        rd.setSub16(rs.getString(22));
        rd.setResult(rs.getString(23));
        rd.setSgpa(rs.getString(24));
        rd.setCgpa(rs.getString(25));
        
        mylist.add(rd);
        rd=null;    
     }
      return mylist;
      
      }
   
   public List searchAllStudentBatch(String branch,String semester,String session) throws Exception
      {
       con=MyCon.getConnection();
       ResultSet rs;    
       String sql;
     
       sql="select * from htmlexcelnew where branch=? and semester=? and session=?";
       ps=con.prepareStatement(sql);
       ps.setString(1, branch);
       ps.setString(2, semester);
       ps.setString(3, session);
       rs=ps.executeQuery();
       List <ReadHtml>mylist= new ArrayList<ReadHtml>();
      
      while(rs.next())
      { 
        
        ReadHtml rd = new ReadHtml();
        rd.setRollno(rs.getString(1));
        rd.setName(rs.getString(2));
        rd.setCourse(rs.getString(3));
        rd.setBranch(rs.getString(4));
        rd.setSem(rs.getString(5));
        rd.setStatus(rs.getString(6));
        rd.setSub1(rs.getString(7));
        rd.setSub2(rs.getString(8));
        rd.setSub3(rs.getString(9));
        rd.setSub4(rs.getString(10));
        rd.setSub5(rs.getString(11));
        rd.setSub6(rs.getString(12));
        rd.setSub7(rs.getString(13));
        rd.setSub8(rs.getString(14));
        rd.setSub9(rs.getString(15));
        rd.setSub10(rs.getString(16));
        rd.setSub11(rs.getString(17));
        rd.setSub12(rs.getString(18));
        rd.setSub13(rs.getString(19));
        rd.setSub14(rs.getString(20));
        rd.setSub15(rs.getString(21));
        rd.setSub16(rs.getString(22));
        rd.setResult(rs.getString(23));
        rd.setSgpa(rs.getString(24));
        rd.setCgpa(rs.getString(25));
        
        mylist.add(rd);
        rd=null;    
     }
      return mylist;
      
      }
   public List searchCodeStudent(String branch,String semester,String code,String session) throws Exception
      {
       con=MyCon.getConnection();
       ResultSet rs;    
       String sql;
     
       sql="select * from htmlexcelnew where branch=? and semester=? and code=? and session=?";
       ps=con.prepareStatement(sql);
       ps.setString(1, branch);
       ps.setString(2, semester);
       ps.setString(3, code);
       ps.setString(4, session);
       rs=ps.executeQuery();
       List <ReadHtml>mylist= new ArrayList<ReadHtml>();
      
      while(rs.next())
      { 
        
        ReadHtml rd = new ReadHtml();
        rd.setRollno(rs.getString(1));
        rd.setName(rs.getString(2));
        rd.setCourse(rs.getString(3));
        rd.setBranch(rs.getString(4));
        rd.setSem(rs.getString(5));
        rd.setStatus(rs.getString(6));
        rd.setSub1(rs.getString(7));
        rd.setSub2(rs.getString(8));
        rd.setSub3(rs.getString(9));
        rd.setSub4(rs.getString(10));
        rd.setSub5(rs.getString(11));
        rd.setSub6(rs.getString(12));
        rd.setSub7(rs.getString(13));
        rd.setSub8(rs.getString(14));
        rd.setSub9(rs.getString(15));
        rd.setSub10(rs.getString(16));
        rd.setSub11(rs.getString(17));
        rd.setSub12(rs.getString(18));
        rd.setSub13(rs.getString(19));
        rd.setSub14(rs.getString(20));
        rd.setSub15(rs.getString(21));
        rd.setSub16(rs.getString(22));
        rd.setResult(rs.getString(23));
        rd.setSgpa(rs.getString(24));
        rd.setCgpa(rs.getString(25));
        
        mylist.add(rd);
        rd=null;    
     }
      return mylist;
      
      }
 
   public List searchSingleStudent(String rollno) throws Exception
      {
       con=MyCon.getConnection();
       ResultSet rs;    
       String sql;
     
       sql="select * from htmlexcelnew where rollno=?";
       ps=con.prepareStatement(sql);
       ps.setString(1, rollno);
       rs=ps.executeQuery();
       List <ReadHtml>mylist= new ArrayList<ReadHtml>();
      
      while(rs.next())
      { 
        
        ReadHtml rd = new ReadHtml();
        rd.setRollno(rs.getString(1));
        rd.setName(rs.getString(2));
        rd.setCourse(rs.getString(3));
        rd.setBranch(rs.getString(4));
        rd.setSem(rs.getString(5));
        rd.setStatus(rs.getString(6));
        rd.setSub1(rs.getString(7));
        rd.setSub2(rs.getString(8));
        rd.setSub3(rs.getString(9));
        rd.setSub4(rs.getString(10));
        rd.setSub5(rs.getString(11));
        rd.setSub6(rs.getString(12));
        rd.setSub7(rs.getString(13));
        rd.setSub8(rs.getString(14));
        rd.setSub9(rs.getString(15));
        rd.setSub10(rs.getString(16));
        rd.setSub11(rs.getString(17));
        rd.setSub12(rs.getString(18));
        rd.setSub13(rs.getString(19));
        rd.setSub14(rs.getString(20));
        rd.setSub15(rs.getString(21));
        rd.setSub16(rs.getString(22));
        rd.setResult(rs.getString(23));
        rd.setSgpa(rs.getString(24));
        rd.setCgpa(rs.getString(25));
        rd.setSession(rs.getString(26));
        
        mylist.add(rd);
        rd=null;    
     }
      return mylist;
      
      }
   public boolean checkStudentRecord(String rollno,String branch,String semester,String session) throws Exception
      {
       con=MyCon.getConnection();
       ResultSet rs;    
       String sql;
       int count=0;
       sql="select * from htmlexcelnew where rollno=? and branch=? and semester=? and session=?";
       ps=con.prepareStatement(sql);
       ps.setString(1, rollno);
       ps.setString(2, branch);
       ps.setString(3, semester);
       ps.setString(4, session);
       rs=ps.executeQuery();
       while(rs.next())
       {
       count++;
       }
       if(count==0)
       return false;
       else
       return true;
      
      }
  
  public ReadHtml searchStudent_appear_pass(String branch,String semester,String session) throws Exception
    {
      con=MyCon.getConnection();
      ResultSet rs;
      String sql;
      sql="select count(*),(select count(*) from htmlexcelnew where (branch=? and semester=? and session=? and result='pass') or (branch=? and semester=? and session=? and result='pass with grace'))"
              + "from htmlexcelnew where branch=? and semester=? and session=?";
      ps=con.prepareStatement(sql);
      ps.setString(1, branch);
      ps.setString(2, semester);
      ps.setString(3, session);
      ps.setString(4, branch);
      ps.setString(5, semester);
      ps.setString(6, session);
      ps.setString(7, branch);
      ps.setString(8, semester);
      ps.setString(9, session);
      rs=ps.executeQuery();
      ReadHtml r=new ReadHtml();
      int f=0;
      while(rs.next())
       {     
         f=1;
                 r.setRollno(rs.getString(1));
                 r.setName(rs.getString(2));
                 r.setName(rs.getString(2));
               }       
             if(f==1)
             return(r);
             
             return null;
        }
 
  public ReadHtml searchClassStudent_appear_pass(String branch,String semester,String code,String session) throws Exception
    {
      con=MyCon.getConnection();
      ResultSet rs;
      String sql;
      sql="select count(*),(select count(*) from htmlexcelnew where (branch=? and semester=? and code=? and session=? and result='pass') or (branch=? and semester=? and code=? and session=? and result='pass with grace' ))"
              + "from htmlexcelnew where branch=? and semester=? and code=? and session=?";
      ps=con.prepareStatement(sql);
      ps.setString(1, branch);
      ps.setString(2, semester);
      ps.setString(3, code);
      ps.setString(4, session);
      ps.setString(5, branch);
      ps.setString(6, semester);
      ps.setString(7, code);
      ps.setString(8, session);
      ps.setString(9, branch);
      ps.setString(10, semester);
      ps.setString(11, code);
      ps.setString(12, session);
      rs=ps.executeQuery();
      ReadHtml r=new ReadHtml();
      int f=0;
      while(rs.next())
       {     
         f=1;
                 r.setRollno(rs.getString(1));
                 r.setName(rs.getString(2));
               }       
             if(f==1)
             return(r);
             
             return null;
        }
 
  public ReadHtml searchStudent_Hons_I_Div(String branch,String semester,String session) throws Exception
    {
      con=MyCon.getConnection();
      ResultSet rs;
      String sql;
      sql="select count(*),(select count(sgpa) from htmlexcelnew where sgpa>=6.5 and branch=? and semester=? and session=?)"
              + "from htmlexcelnew where cgpa>=7.5 and branch=? and semester=? and session=?";
      ps=con.prepareStatement(sql);
      ps.setString(1, branch);
      ps.setString(2, semester);
      ps.setString(3, session);
      ps.setString(4, branch);
      ps.setString(5, semester);
      ps.setString(6, session);
      rs=ps.executeQuery();
      ReadHtml r=new ReadHtml();
      int f=0;
      while(rs.next())
       {     
         f=1;
                 r.setRollno(rs.getString(1));
                 r.setName(rs.getString(2));
               }       
             if(f==1)
             return(r);
             
             return null;
        }
  public ReadHtml searchClassStudent_Hons_I_Div(String branch,String semester,String code,String session) throws Exception
    {
      con=MyCon.getConnection();
      ResultSet rs;
      String sql;
      sql="select count(*),(select count(sgpa) from htmlexcelnew where cgpa>=6.5 and branch=? and semester=? and code=? and session=?)"
              + "from htmlexcelnew where cgpa>=7.5 and branch=? and semester=? and code=? and session=? ";
      ps=con.prepareStatement(sql);
      ps.setString(1, branch);
      ps.setString(2, semester);
      ps.setString(3, code);
      ps.setString(4, session);
      ps.setString(5, branch);
      ps.setString(6, semester);
      ps.setString(7, code);
      ps.setString(8, session);
      rs=ps.executeQuery();
      ReadHtml r=new ReadHtml();
      int f=0;
      while(rs.next())
       {     
         f=1;
                 r.setRollno(rs.getString(1));
                 r.setName(rs.getString(2));
               }       
             if(f==1)
             return(r);
             
             return null;
        }
 
   public List searchAvg_Subjects(String branch,String semester,String session) throws Exception
      {
       con=MyCon.getConnection();
       ResultSet rs;    
       String sql;
       sql="select sub1,sub2,sub3,sub4,sub5,sub6 from htmlexcelnew where branch=? and semester=? and session=?";
       ps=con.prepareStatement(sql);
       ps.setString(1, branch);
       ps.setString(2, semester);
       ps.setString(3, session);
       rs=ps.executeQuery();
       List <ReadHtml>mylist= new ArrayList<ReadHtml>();
      
      while(rs.next())
      { 
        
        ReadHtml rd = new ReadHtml();
        rd.setSub1(rs.getString(1));
        rd.setSub2(rs.getString(2));
        rd.setSub3(rs.getString(3));
        rd.setSub4(rs.getString(4));
        rd.setSub5(rs.getString(5));
        rd.setSub6(rs.getString(6));
        
        mylist.add(rd);
        rd=null;    
     }
      return mylist;
      
      }
 
   public List searchClassAvg_Subjects(String branch,String semester,String code,String session) throws Exception
      {
       con=MyCon.getConnection();
       ResultSet rs;    
       String sql;
       sql="select sub1,sub2,sub3,sub4,sub5,sub6 from htmlexcelnew where branch=? and semester=? and code=? and session=? ";
       ps=con.prepareStatement(sql);
       ps.setString(1, branch);
       ps.setString(2, semester);
       ps.setString(3, code);
       ps.setString(4, session);
       rs=ps.executeQuery();
       List <ReadHtml>mylist= new ArrayList<ReadHtml>();
      
      while(rs.next())
      { 
        
        ReadHtml rd = new ReadHtml();
        rd.setSub1(rs.getString(1));
        rd.setSub2(rs.getString(2));
        rd.setSub3(rs.getString(3));
        rd.setSub4(rs.getString(4));
        rd.setSub5(rs.getString(5));
        rd.setSub6(rs.getString(6));
        
        mylist.add(rd);
        rd=null;    
     }
      return mylist;
      
      }
 
 
   public List searchSemesterToppers(String branch,String semester,String limit,String session) throws Exception
      {
       con=MyCon.getConnection();
       ResultSet rs;    
       String sql_prefix="select * from htmlexcelnew where branch=? and semester=? and session=? order by sgpa desc,cgpa desc limit";
       String sql_suffix=" " +limit;
       
       String sql;
       sql=sql_prefix + sql_suffix;
       //sql="select * from htmlexcelnew where branch=? and semester=? and session=? order by sgpa desc limit ?";
       ps=con.prepareStatement(sql);
       ps.setString(1, branch);
       ps.setString(2, semester);
//       ps.setString(4, limit);
       ps.setString(3, session);
       rs=ps.executeQuery();
       List <ReadHtml>mylist= new ArrayList<ReadHtml>();
      
      while(rs.next())
      { 
        
        ReadHtml rd = new ReadHtml();
        rd.setRollno(rs.getString(1));
        rd.setName(rs.getString(2));
        rd.setCourse(rs.getString(3));
        rd.setBranch(rs.getString(4));
        rd.setSem(rs.getString(5));
        rd.setStatus(rs.getString(6));
        rd.setSub1(rs.getString(7));
        rd.setSub2(rs.getString(8));
        rd.setSub3(rs.getString(9));
        rd.setSub4(rs.getString(10));
        rd.setSub5(rs.getString(11));
        rd.setSub6(rs.getString(12));
        rd.setSub7(rs.getString(13));
        rd.setSub8(rs.getString(14));
        rd.setSub9(rs.getString(15));
        rd.setSub10(rs.getString(16));
        rd.setSub11(rs.getString(17));
        rd.setSub12(rs.getString(18));
        rd.setSub13(rs.getString(19));
        rd.setSub14(rs.getString(20));
        rd.setSub15(rs.getString(21));
        rd.setSub16(rs.getString(22));
        rd.setResult(rs.getString(23));
        rd.setSgpa(rs.getString(24));
        rd.setCgpa(rs.getString(25));
        
        mylist.add(rd);
        rd=null;    
     }
      return mylist;
      
      }
   public List searchClassToppers(String branch,String semester,String limit,String code,String session) throws Exception
      {
       con=MyCon.getConnection();
       ResultSet rs;    
       String sql_prefix="select * from htmlexcelnew where branch=? and semester=? and code=? and session=? order by cgpa desc,sgpa desc limit";
       String sql_suffix=" " +limit;
       
       String sql;
       sql=sql_prefix + sql_suffix;
       //sql="select * from htmlexcelnew where branch=? and semester=? and session=? order by sgpa desc limit ?";
       ps=con.prepareStatement(sql);
       ps.setString(1, branch);
       ps.setString(2, semester);
       ps.setString(3, code);
       ps.setString(4, session);
       rs=ps.executeQuery();
       List <ReadHtml>mylist= new ArrayList<ReadHtml>();
      
      while(rs.next())
      { 
        
        ReadHtml rd = new ReadHtml();
        rd.setRollno(rs.getString(1));
        rd.setName(rs.getString(2));
        rd.setCourse(rs.getString(3));
        rd.setBranch(rs.getString(4));
        rd.setSem(rs.getString(5));
        rd.setStatus(rs.getString(6));
        rd.setSub1(rs.getString(7));
        rd.setSub2(rs.getString(8));
        rd.setSub3(rs.getString(9));
        rd.setSub4(rs.getString(10));
        rd.setSub5(rs.getString(11));
        rd.setSub6(rs.getString(12));
        rd.setSub7(rs.getString(13));
        rd.setSub8(rs.getString(14));
        rd.setSub9(rs.getString(15));
        rd.setSub10(rs.getString(16));
        rd.setSub11(rs.getString(17));
        rd.setSub12(rs.getString(18));
        rd.setSub13(rs.getString(19));
        rd.setSub14(rs.getString(20));
        rd.setSub15(rs.getString(21));
        rd.setSub16(rs.getString(22));
        rd.setResult(rs.getString(23));
        rd.setSgpa(rs.getString(24));
        rd.setCgpa(rs.getString(25));
        
        mylist.add(rd);
        rd=null;    
     }
      return mylist;
      
      }
 
   public List searchBranchToppers(String branch,String semester,String limit,String session) throws Exception
      {
       con=MyCon.getConnection();
       ResultSet rs;    
       String sql_prefix="select * from htmlexcelnew where branch=? and semester=? and session=? order by cgpa desc,sgpa desc limit";
       String sql_suffix=" " +limit;
       
       String sql;
       sql=sql_prefix + sql_suffix;
       //sql="select * from htmlexcelnew where branch=? and semester=? and session=? order by sgpa desc limit ?";
       ps=con.prepareStatement(sql);
       ps.setString(1, branch);
       ps.setString(2, semester);
//       ps.setString(4, limit);
       ps.setString(3, session);
       rs=ps.executeQuery();
       List <ReadHtml>mylist= new ArrayList<ReadHtml>();
      
      while(rs.next())
      { 
        
        ReadHtml rd = new ReadHtml();
        rd.setRollno(rs.getString(1));
        rd.setName(rs.getString(2));
        rd.setCourse(rs.getString(3));
        rd.setBranch(rs.getString(4));
        rd.setSem(rs.getString(5));
        rd.setStatus(rs.getString(6));
        rd.setSub1(rs.getString(7));
        rd.setSub2(rs.getString(8));
        rd.setSub3(rs.getString(9));
        rd.setSub4(rs.getString(10));
        rd.setSub5(rs.getString(11));
        rd.setSub6(rs.getString(12));
        rd.setSub7(rs.getString(13));
        rd.setSub8(rs.getString(14));
        rd.setSub9(rs.getString(15));
        rd.setSub10(rs.getString(16));
        rd.setSub11(rs.getString(17));
        rd.setSub12(rs.getString(18));
        rd.setSub13(rs.getString(19));
        rd.setSub14(rs.getString(20));
        rd.setSub15(rs.getString(21));
        rd.setSub16(rs.getString(22));
        rd.setResult(rs.getString(23));
        rd.setSgpa(rs.getString(24));
        rd.setCgpa(rs.getString(25));
        
        mylist.add(rd);
        rd=null;    
     }
      return mylist;
      
      }
 
   
  
   
}
