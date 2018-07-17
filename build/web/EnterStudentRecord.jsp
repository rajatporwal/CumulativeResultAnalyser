<%@include  file="checkSession.jsp" %>
<%-- 
    Document   : EnterStudentRecord
    Author     : Rajat Porwal
--%> 

<%@page import="java.sql.Date"%>
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
     
		<div class="container">
                    <h1 class="well"><center>Enter Details For Searching Student Record</center></h1>
	<div class="col-lg-12 well" >
	<div class="row">
                 <form method="post" action="SearchStudentRecord.jsp">
                                    <center>
                                        <div class="form-group">
                                            
                                            <label class="col-md-2 control-label" ><b>Enrollement No.</b></label>
  <div class="col-md-2">
      <input type="text" id="rollno" name="rollno" class="form-control" required=""> 
  </div><strong>Ex : 0808cs141112</strong><br><br>
      </center>
                     <br><br><br>                                    

                                        
					<div class="col-sm-12">
						<div class="row">
                                                    
                                                         <br>
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