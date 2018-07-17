<%@page import="java.io.IOException"%>
<%@include  file="checkSession.jsp" %>
<%@page import="java.io.File"%>
<%@page import="dao.*"%>
<%@page import="java.util.regex.*"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.Reader"%>
<%@include file="Headernew.html"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 
    Document   : InsertIntoDb
    Author     : Rajat Porwal
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
   <%
       try {
     
          HttpSession session=request.getSession();

          String rno= session.getAttribute("rno").toString();
          String name= session.getAttribute("name").toString();
          String branch= session.getAttribute("branch").toString();
          String semester= session.getAttribute("semester").toString();
          String batch= session.getAttribute("batch").toString();
          String status= session.getAttribute("status").toString();
          String code= session.getAttribute("code").toString();
          String sub1=request.getParameter("sub1");
          String sub2=request.getParameter("sub2");
          String sub3=request.getParameter("sub3");
          String sub4=request.getParameter("sub4");
          String sub5=request.getParameter("sub5");
          String sub6=request.getParameter("sub6");
          String sub7=request.getParameter("sub7");
          String sub8=request.getParameter("sub8");
          String sub9=request.getParameter("sub9");
          String sub10=request.getParameter("sub10");
          String sub11=request.getParameter("sub11");
          String sub12=request.getParameter("sub12");
          String sub13=request.getParameter("sub13");
          String sub14=request.getParameter("sub14");
          String sub15=request.getParameter("sub15");
          String sub16=request.getParameter("sub16");
          
          String sgpa=request.getParameter("sgpa");
          String cgpa=request.getParameter("cgpa");
          String result=request.getParameter("result");

            ReadHtml readhtml= new ReadHtml();    
            readhtml.setName(name);
            readhtml.setRollno(rno);
            readhtml.setCourse("BE");
            readhtml.setBranch(branch);
            readhtml.setSem(semester) ;
            readhtml.setStatus(status);
            readhtml.setSub1(sub1);
            readhtml.setSub2(sub2);
            readhtml.setSub3(sub3);
            readhtml.setSub4(sub4);
            readhtml.setSub5(sub5);
            readhtml.setSub6(sub6);
            readhtml.setSub7(sub7);
            readhtml.setSub8(sub8);
            readhtml.setSub9(sub9);
            readhtml.setSub10(sub10);
            readhtml.setSub11(sub11);
            readhtml.setSub12(sub12);
            readhtml.setSub13(sub13);
            readhtml.setSub14(sub14);
            readhtml.setSub15(sub15);
            readhtml.setSub16(sub16);
            readhtml.setResult(result); 
            readhtml.setSgpa(sgpa);
            readhtml.setCgpa(cgpa);  
            readhtml.setSession(batch);     
            readhtml.setCode(code);     
          
        ReadHtmlDAO readhtmldao = new ReadHtmlDAO();
    
        if(readhtmldao.checkStudentRecord(rno, branch, semester, batch)){
        if(readhtmldao.updateData(readhtml)){
          %>
          <br><br><br><br><br><br>
    <center><h1><strong>Record Updated Successfully</strong></12></center>
          <%
      }
           else{
         %>
         <br><br><br><br><br><br>
    <center><h1><strong>Record Not Updated,please try again later</strong></12></center>
         <%
             }
        }
        else{
      if(readhtmldao.insertData(readhtml)){
          %>
          <br><br><br><br><br><br>
    <center><h1><strong>Record Inserted Successfully</strong></12></center>
          
          <%
      }
           else{
         %>
         <br><br><br><br><br><br>
    <center><h1><strong>Record Not Inserted,please try again later</strong></12></center>
         <%
             }
       }
      }
        
       catch (IOException e) {

           out.println(e);
       }             
    %>
    </body>
</html>
