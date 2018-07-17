<%@include  file="checkSession.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.ReadHtml"%>
<%@page import="dao.ReadHtmlDAO"%>
<%@include file="Headernew.html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 
    Document   : SearchStudentRecord
    Author     : Rajat Porwal
--%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <div class="span7">   
<div class="widget stacked widget-table action-table">
    <br><br>
				<div class="widget-header">
					<i class="icon-th-list"></i>
					<h3>Student Record</h3>
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
								<th><center>Result</center></th>
								<th><center>Batch</center></th>
								<!--<th class="td-actions"></center></th>-->
							</tr>
						</thead>
						
          
     
        <%
            HttpSession session=request.getSession();
          String rollno=request.getParameter("rollno").toString();
          ReadHtmlDAO rd = new ReadHtmlDAO();
          List <ReadHtml>myresultlist= new ArrayList<ReadHtml>();
          myresultlist=rd.searchSingleStudent(rollno);
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
                <td><center><%=r.getSession()%></center></td>
                </tr>
	 <%}%>	
  </tbody>
 </table></center>
</div> 
     </div> 
       </div> 
