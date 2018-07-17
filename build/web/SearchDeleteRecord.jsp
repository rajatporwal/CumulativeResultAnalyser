<%@include  file="checkSession.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.ReadHtml"%>
<%@page import="dao.ReadHtmlDAO"%>
<%@include file="Headernew.html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 
    Document   : SearchDeleteRecord
    Author     : Rajat Porwal
--%>
<!DOCTYPE html>
<html>
    <head>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
  <script src="http://cdn.oesmith.co.uk/morris-0.4.1.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method ="post" action="DeleteRecord.jsp">
       <div class="span7">   
<div class="widget stacked widget-table action-table">
    <br><br>
				<div class="widget-header">
					<i class="icon-th-list"></i>
                                        <h3><strong>Delete Record</strong></h3>
				</div> <!-- /widget-header -->
				
				<div class="widget-content">
                                    <center>
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th><center>S.no.</center></th>
                                                                <th><center>Enrollment No.Name</center></th>
								<th><center>Name</center></th>
								<th><center>Branch</center></th>
								<th><center>Semester</center></th>
								<th><center>SGPA</center></th>
								<th><center>CGPA</center></th>
								<th><center>RESULT</center></th>
								<!--<th class="td-actions"></center></th>-->
							</tr>
						</thead>
						
          
     
        <%
            HttpSession session=request.getSession();
          String rnofrom=request.getParameter("rnofrom").toString();
          String rnoto=request.getParameter("rnoto").toString();
          String branch=request.getParameter("branch").toString();
          String semester=request.getParameter("semester").toString();
          String batch=request.getParameter("batch").toString();
          session.setAttribute("r1", rnofrom);
          session.setAttribute("r2", rnoto);
          session.setAttribute("b1", branch);
          session.setAttribute("sem1", semester);
          ReadHtmlDAO rd = new ReadHtmlDAO();
          List <ReadHtml>myresultlist= new ArrayList<ReadHtml>();
          myresultlist=null;
          myresultlist=rd.searchAllStudent(branch,semester,rnofrom,rnoto);
          if(myresultlist!=null)
          {
          int count=1;
          for(ReadHtml r : myresultlist)
          {
        %>
   <tbody>
		<tr>
		<td><center><%=count++%></center></td>
		<td><center><%=r.getRollno()%></center></td>
		<td><center><%=r.getName()%></center></td>
		<td><center><%=r.getBranch()%></center></td>
		<td><center><%=r.getSem()%></center></td>
                <td><center><%=r.getSgpa()%></center></td>
                <td><center><%=r.getCgpa()%></center></td>
                <td><center><%=r.getResult()%></center></td>
                </tr>
	 <% 
             }
          }
            else
              out.println("Record Not Found");
         %>	
  </tbody>
 </table></center>
</div> 
     </div> 
       </div> <center>
   <button id="submit1" value="submit" name="submit"  class="btn btn-danger">Delete</button>
</center>        </form>
  
    </body>
</html>
