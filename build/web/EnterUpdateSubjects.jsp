 <%-- 
    Document   : EnterPostDetailsTrial
    Author     : Rajat Porwal
--%>

<%@include  file="checkSession.jsp" %>
<%@page import="java.sql.Date"%>
<%@page import="java.lang.String"%>
<%@include file="Headernew.html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
   
    <head> 
		<meta name="viewport" content="width=device-width, initial-scale=1">


		<!-- Website CSS style -->
		 <link rel="stylesheet" href="js/bootstrap.min.css" />
       <link rel="stylesheet" href="js/awesome.min.css" />
       <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src ="js/Bootstrap.min.js"> </script>

		
	</head>
	<body>
       <% 
           HttpSession session=request.getSession();
            String rno=request.getParameter("rno");
            String name=request.getParameter("name");
            String branch=request.getParameter("branch");
            String semester=request.getParameter("semester");
            String tsub=request.getParameter("sub");
            String batch=request.getParameter("batch");
            String status=request.getParameter("status");
            String code=request.getParameter("code");
            int sub=Integer.parseInt(tsub);
            session.setAttribute("name", name);
            session.setAttribute("rno", rno);
            session.setAttribute("branch", branch);
            session.setAttribute("semester", semester);
            session.setAttribute("batch", batch);
            session.setAttribute("status", status);
            session.setAttribute("code", code);
        %>
		<div class="container">
                    <h1 class="well"><center>Enter Details</center></h1>
	<div class="col-lg-12 well">
	<div class="row">
                 <form method="post" action="InsertUpdateSubjects.jsp">
                                    <center>
                                        <div class="form-group">
<label class="col-md-2 control-label" >Enrollment No.</label>
  <div class="col-md-2">
      <input type="text" value="<%=rno%>" class="form-control" readonly >
  </div>
<label class="col-md-2 control-label" >Name</label>
  <div class="col-md-2">
      <input type="text" value="<%=name%>" class="form-control" readonly >
  </div>
<label class="col-md-2 control-label" >Branch</label>
  <div class="col-md-2">
      <input type="text" value="<%=branch%>" class="form-control" readonly >
  </div><br><br><br>
<label class="col-md-2 control-label" >Semester</label>
  <div class="col-md-2">
      <input type="text" value="<%=semester%>" class="form-control" readonly >
  </div>
<label class="col-md-2 control-label" >Status</label>
  <div class="col-md-2">
      <input type="text" value="<%=status%>" class="form-control"  readonly >
  </div>
<label class="col-md-2 control-label" >Batch</label>
  <div class="col-md-2">
      <input type="text" value="<%=batch%>" class="form-control"  readonly >
  </div>
  </div>

<br><br><br>                                   
<div class="form-group">
    <strong><h2><b>Enter Grades</b></h2></strong></center><br>
   <%
       int i;
     for (i = 1; i <=sub; i++) {
   %> 
  <label class="col-md-2 control-label" >Sub <%= i %></label>
  <div class="col-md-2">
      <!--<input type="text" id="sub1" name="sub<%=i%>" class="form-control"  title="Please enter right subject code,ex.CS501">-->
      <select id="batch" name="sub<%=i%>" class="form-control" required="">
      <option value="">Select</option>
      <option value="A+">A+</option>
      <option value="A">A</option>
      <option value="B+">B+</option>
      <option value="B">B</option>
      <option value="C+">C+</option>
      <option value="C">C</option>
      <option value="C##">C##</option>
      <option value="D">D</option>
      <option value="D##">D##</option>
      <option value="F">F</option>
      <option value="ABS">ABS</option>
    </select>
  </div>
  <% 
      if(i%3==0)
      { %>
      <br><br><br>
      <%   
            }
        }
      %>
      <br><br><br>
       <strong><h2><b>Enter Result</b></h2></strong></center><br>
<center><br>
    <label class="col-md-2 control-label" >SGPA</label>
  <div class="col-md-2">
     <input type="text" id="sgpa" name="sgpa" class="form-control" required=""  title="Only integers are allowed with max length of 2" maxlength="4" minlength="4"> 
  </div>
  <label class="col-md-2 control-label" >CGPA</label>
  <div class="col-md-2">
      <input type="text" id="cgpa" name="cgpa" class="form-control" required=""  title="Only integers are allowed with max length of 2" maxlength="4" minlength="4"> 
  </div>
  <label class="col-md-2 control-label" >RESULT</label>
  <div class="col-md-2">
     <select id="result" name="result" class="form-control" required="">
      <option value="">Select</option>
      <option value="PASS">PASS</option>
      <option value="PASS WITH GRACE">PASS WITH GRACE</option>
      <option value="FAIL">FAIL</option>
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