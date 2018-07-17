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
            String branch=request.getParameter("branch");
            String semester=request.getParameter("semester");
            String tsub=request.getParameter("tsub");
            String psub=request.getParameter("psub");
            String s1=request.getParameter("session");
            int theorysub=Integer.parseInt(tsub);
            int practicalsub=Integer.parseInt(psub);
            session.setAttribute("branch", branch);
            session.setAttribute("semester", semester);
            session.setAttribute("totalsubjects", theorysub+practicalsub);
            session.setAttribute("s1", s1);
        %>
		<div class="container">
                    <h1 class="well"><center>Enter Details</center></h1>
	<div class="col-lg-12 well">
	<div class="row">
                 <form method="post" action="InsertIntoDb.jsp">
                                    <center>
                                        <div class="form-group">
  
<!--      <strong>Roll.No. From</strong>
      <input type="text" name="rnofrom" id="rnofrom" required="" >
      <strong>To</strong>
      
      <input type="text" name="rnoto" id="rnoto" required="" >-->
<%
//<label class="col-md-2 control-label" >Folder Path</label>
//  <div class="col-md-2">
//      <input type="text" id="fpath" name="fpath" class="form-control" required=""   title="Please enter right subject code,ex.CS501">
//</div>    %>  

<label class="col-md-2 control-label" >Folder Path</label>
  <div class="col-md-2">
      <input type="text" id="path" name="path" class="form-control" required=""   title="Please enter right subject code,ex.CS501">
  </div>
<label class="col-md-2 control-label" >File from</label>
  <div class="col-md-2">
      <input type="text" id="rnofrom" name="rnofrom" class="form-control" required=""  maxlength="5" title="Please enter right subject code,ex.CS501">
  </div>
<label class="col-md-2 control-label" >To</label>
  <div class="col-md-2">
      <input type="text" id="rnoto" name="rnoto" class="form-control" required=""  maxlength="5" title="Please enter right subject code,ex.CS501">
  </div>
  </div>

<br> <br>                                   
<div class="form-group">
    <strong><h3><b>Theory Subjects</b></h3></strong></center><br>
   <%
       int i;
     for (i = 1; i <=theorysub; i++) {
   %> 
  <label class="col-md-2 control-label" >Sub <%= i %> [T]</label>
  <div class="col-md-2">
      <input type="text" id="sub1" name="sub<%=i%>" class="form-control" required=""  minlength="5" maxlength="5" title="Please enter right subject code,ex.CS501">
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
     for (int j = 1; j <=practicalsub; j++) {
   %> 
  <label class="col-md-2 control-label" >Sub <%=j%> [P]</label>
  <div class="col-md-2">
    <input type="text" id="sub1" name="sub<%=(i-1)+j%>" class="form-control" required=""  minlength="5" maxlength="5" title="Please enter right subject code,ex.CS501">
  </div>
 <% 
      if(j%3==0)
      { %>
      <br><br><br>
      <%  }  
         }
  %>
                                        
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