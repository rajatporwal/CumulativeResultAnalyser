<%@include  file="checkSession.jsp" %>
<%@page import="java.sql.Date"%>
<%@page import="java.lang.String"%>
<%@include file="Headernew.html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
  <%-- 
    Document   : EnterResultAnalysisSubjects
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
            String top=request.getParameter("top");
            String tsub=request.getParameter("tsub");
            String type=request.getParameter("type");
            String batch=request.getParameter("batch");
            int theorysub=Integer.parseInt(tsub);
            session.setAttribute("branch", branch);
            session.setAttribute("semester", semester);
            session.setAttribute("top", top);
            session.setAttribute("theorysub", theorysub);
            session.setAttribute("type", type);
            session.setAttribute("batch", batch);
        %>
		<div class="container">
                    <h1 class="well"><center>Enter Details</center></h1>
	<div class="col-lg-12 well">
	<div class="row">
                 <form method="post" action="SearchResultAnalysisData.jsp">
                                    <center>
                                        <div class="form-group">
  
      <label class="col-md-2 control-label" >Branch</label>
  <div class="col-md-2">
      <input type="text" value="<%=branch%>" class="form-control" readonly="true">
  </div>
      <label class="col-md-2 control-label" >Semester</label>
  <div class="col-md-2">
    <input type="text" value="<%=semester%>" class="form-control" readonly="true">
  </div>
      <label class="col-md-2 control-label" >Top</label>
  <div class="col-md-2">
    <input type="text" value="<%=top%>" class="form-control" readonly="true">
  </div><br><br><br><br>                                 
      <label class="col-md-2 control-label" >Toppers</label>
  <div class="col-md-2">
    <input type="text" value="<%="Semester Toppers"%>" class="form-control" readonly="true">
  </div>
    <%
           if(type.equals("class")){
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
  <br><br><br><br>                                 
    <strong><h3><b>Enter Subject Name(or code) For Graph Analysis</b></h3></strong></center><br><br>
   <%int i;
     for (i = 1; i <=theorysub; i++) {
   %> 
       
  <label class="col-md-2 control-label" >Sub <%= i %> [T]</label>
  <div class="col-md-2">
    <input type="text" id="sub1" name="sub<%=i%>" class="form-control" required>
  </div>
  <% 
      if(i%3==0)
      { %>
      <br><br><br><br>
      <%  }  
         }
%>
<center><br><br><br>
    <strong><h3><b>Enter Details</b></h3></strong></center><br><br>
    <center>
        <%
    if(type.equalsIgnoreCase("class")){
            }
 %>
 
        <label class="col-md-2 control-label" >Department</label>
       <div class="col-md-2">
      <select id="department" name="department" class="form-control" required="">
      <option value="">Select</option>
      <option value="Computer Science & Engg.">Computer Science & Engg.</option>
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
      <select id="year" name="year" class="form-control" required="">
      <option value="">Select</option>
      <option value="First">First</option>
      <option value="Second">Second</option>
      <option value="Third">Third</option>
      <option value="Fourth">Fourth</option>
    </select>
  </div>
<!-- <%
    if(type.equalsIgnoreCase("branch")){
    
 %>
 <label class="col-md-2 control-label" >Branch</label>
<div class="col-md-2">
    <input type="text" id="class" name="class" value="<%=branch%>" class="form-control" required="" readonly="true">
</div>
    <%
            }
    else{
    
 %>
 <label class="col-md-2 control-label" >Class</label>
<div class="col-md-2">
    <input type="text" id="class" name="class" class="form-control" required="">
</div>
    <%
            }
    %>        -->
    <label class="col-md-2 control-label" >Batch</label>
       <div class="col-md-2">
    <input type="text" value="<%=batch%>" class="form-control" readonly >
       </div>
    <br><br><br><br>
 <label class="col-md-2 control-label" >Coordinator 1</label>
<div class="col-md-2">
    <input type="text" id="c1" name="c1" class="form-control" >
  </div>
 <label class="col-md-2 control-label" >Coordinator 2</label>
<div class="col-md-2">
    <input type="text" id="c2" name="c2" class="form-control" >
  </div>   
 <label class="col-md-2 control-label" >H.O.D</label>
<div class="col-md-2">
    <input type="text" id="hod" name="hod" class="form-control" required="">
  </div>   
    </center>                                    
					<div class="col-sm-12">
						<div class="row">
                                                    
<br><br><br>
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
    
 <div class="footer-w3l">
     <p> <b><h3>Result Analysis Data</h3></b></p>
	</div>
	</body>
</html>