<%@include  file="checkSession.jsp" %>
<%@page import="java.sql.Date"%>
<%@page import="java.lang.String"%>
<%@include file="Headernew.html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
    <%-- 
    Document   : EnterSubjectCode
    Author     : Rajat Porwal
    --%>
 
		<!-- Website CSS style -->
		 <link rel="stylesheet" href="js/bootstrap.min.css" />
       <link rel="stylesheet" href="js/awesome.min.css" />
       <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src ="js/Bootstrap.min.js"> </script>

		
	</head>
	<body>
       <% 
           HttpSession session=request.getSession();
           String branch=request.getParameter("branch");
           String semester=request.getParameter("semester");
           String batch=request.getParameter("batch");
           //String rollfrom=request.getParameter("rollfrom");
           //String rollto=request.getParameter("rollto");
           String tsub=request.getParameter("tsub");
           String psub=request.getParameter("psub");
           String type=request.getParameter("type");
           session.setAttribute("searchbranch", branch);
           session.setAttribute("searchsemester", semester);
           session.setAttribute("batch", batch);
           //session.setAttribute("searchrollfrom", rollfrom);
           //session.setAttribute("searchrollto", rollto);
           session.setAttribute("searchtheorysubjects", tsub);
           session.setAttribute("searchpracticalsubjects", psub);
           session.setAttribute("type", type);
           int theorysubjects=Integer.parseInt(request.getParameter("tsub"));
           int practicalsubjects=Integer.parseInt(request.getParameter("psub"));
        %>
	
        
        <div class="container">
                    <h1 class="well"><center>Enter Details</center></h1>
	<div class="col-lg-12 well">
	<div class="row">
                 <form method="post" action="SearchClassRecord.jsp">
                                    <center>
<div class="form-group">
    <label class="col-md-2 control-label" >Branch</label>
  <div class="col-md-2">
      <input type="text" value="<%=branch%>" class="form-control" readonly >
  </div>
    <label class="col-md-2 control-label" >Semester</label>
  <div class="col-md-2">
      <input type="text" value="<%=semester%>" class="form-control" readonly >
  </div>
        <%
           if(type.equals("branch")){
        %>      
      <label class="col-md-2 control-label" >Batch</label>
       <div class="col-md-2">
      <input type="text" value="<%=batch%>" class="form-control" readonly>
       </div>
      <%
         }
        else
        {
      %>
      <label class="col-md-2 control-label" >Class</label>
       <div class="col-md-2">
      <select id="code" name="code" class="form-control" required="">
      <option value="">Select</option>
      <option value="S-1">S-1</option>
      <option value="S-2">S-2</option>
      <option value="S-3">S-3</option>
      <option value="T-1">T-1</option>
      <option value="T-2">T-2</option>
      <option value="T-3">T-3</option>
      <option value="F-1">F-1</option>
      <option value="F-2">F-2</option>
      <option value="F-3">F-3</option>
    </select>
       </div>
       <%
         }    
       %>
       </center>
       <br><br>
    <strong><h3><b>Theory Subjects</b></h3></strong></center><br>
   <%int i;
     for (i = 1; i <=theorysubjects; i++) {
   %> 
  <label class="col-md-2 control-label" >Sub <%= i %> [T]</label>
  <div class="col-md-2">
      <input type="text" id="sub1" name="sub<%=i%>" class="form-control" required="" >
  </div>
  <% 
      if(i%3==0)
      { %>
      <br><br><br>
      <%  }  
         }
%>
<center><br><br><br>
    <strong><h3><b>Practical Subjects</b></h3></strong></center><br>
   <%
     for (int j = 1; j <=practicalsubjects; j++) {
   %> 
  <label class="col-md-2 control-label" >Sub <%=j%> [P]</label>
  <div class="col-md-2">
    <input type="text" id="sub1" name="sub<%=(i-1)+j%>" class="form-control" required>
  </div>
 <% 
      if(j%3==0)
      { %>
      <br><br><br>
      <%  }  
         }
  %>
  
  <label class="col-md-2 control-label" >Department</label>
       <div class="col-md-2">
      <select id="department" name="department" class="form-control" required="">
      <option value="">Select</option>
      <option value="Department of Computer Science & Engg.">Computer Science & Engg.</option>
      <option value="Electronics & Communication Engg.">Electronics & Communication Engg.</option>
      <option value="Electrical & Electronics Engg.">Electrical & Electronics Engg.</option>
      <option value="Civil Engineering">Civil Engineering</option>
      <option value="Chemical Engineering">Chemical Engineering</option>
      <option value="Mechanical Engineering">Mechanical Engineering</option>
      <option value="Fire Technology & Safety Engineering">Fire Technology & Safety Engineering	</option>
    </select>
  </div>
   <label class="col-md-2 control-label" >Year</label>
       <div class="col-md-2">
      <select id="yearexcel" name="yearexcel" class="form-control" required="">
      <option value="">Select</option>
      <option value="I">I</option>
      <option value="II">II</option>
      <option value="III">III</option>
      <option value="IV">IV</option>
    </select>
       </div>
    <label class="col-md-2 control-label" >Semester</label>
       <div class="col-md-2">
      <select id="semexcel" name="semexcel" class="form-control" required="">
      <option value="">Select</option>
      <option value="I">I</option>
      <option value="II">II</option>
      <option value="III">III</option>
      <option value="IV">IV</option>
      <option value="V">V</option>
      <option value="VI">VI</option>
      <option value="VII">VII</option>
      <option value="VIII">VIII</option>
    </select>
       </div>
                                        
					<div class="col-sm-12">
						<div class="row">
                                                    
                                                    <br><br>                                 <br>
                                                  <div class="form-group">
  <label class="col-md-4 control-label"  for="submit"></label>
  <div class="col-md-4">
      <button id="submit" name="submit" class="btn btn-primary btn-lg btn3d" ><span class="glyphicon glyphicon-thumbs-up"></span><strong>Submit</strong></button>
    <button type="reset" id="reset" name="reset" class="btn btn-success btn-lg btn3d"><span class="glyphicon glyphicon-thumbs-down"></span><strong>Reset</strong></button>
  </div>
</div>
                                                    
                                          
                                                </div>
                                             
										
					</div>
		</form> 		 
				</div>
	</div>
	</div>
</center>
       
	</body>
</html>