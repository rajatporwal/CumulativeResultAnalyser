 <%-- 
 Document   : DeleteRecord
 Author     : Rajat Porwal
 --%>

    <%@page import="dao.ReadHtml"%>
<%@page import="dao.ReadHtmlDAO"%>
<%@include  file="checkSession.jsp" %>
<%@include file="Headernew.html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
    </head>
    <body><center>
       <%
           try {
                   
               
         HttpSession session=request.getSession();
          String rnofrom=session.getAttribute("r1").toString();
          String rnoto=session.getAttribute("r2").toString();
          String branch=session.getAttribute("b1").toString();
          String semester=session.getAttribute("sem1").toString();
          ReadHtmlDAO rd = new ReadHtmlDAO();
          if(rd.deleteData(branch,semester,rnofrom,rnoto))
          {
              out.println("<script type=\"text/javascript\">");
              out.println("alert('Record Deleted');");
              out.println("</script>");
              %>
      <br><br><br><br><br><br><br><br>
       <span  style="float: center;"><strong><h2><b>•<%="Record Deleted Successfully"%> </b></h2></strong></span> 
       <%
         }
         else
           {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Something Went Wrong,please try again later');");
            out.println("</script>");
         %>
               <br><br><br><br><br><br><br><br>
               <span  style="float: center;"><strong><h2><b>•<%=" Record Not Found"%>,<br><br>Please Enter Correct Details</b></h2></strong></span> 
       <%
         }
          }
           catch (Exception e) {
              out.println("<script type=\"text/javascript\">");
              out.println("alert('Something Went Wrong,please try again later');");
              out.println("</script>");
              out.println(e);

               }
       %>
               </center>
    </body>
</html>
