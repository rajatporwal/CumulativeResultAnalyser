<%-- 
    Document   : EnterDeleteDetails
    Author     : Rajat Porwal
--%>

<%@include  file="checkSession.jsp" %>
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
                    <h1 class="well"><center>Enter Details For Deleting Record</center></h1>
	<div class="col-lg-12 well" >
	<div class="row">
                 <form method="post" action="EnterUpdateSubjects.jsp">
                                    <center>
                                        <div class="form-group">
                                            
      <label class="col-md-2 control-label" >Enrollment No.</label>
  <div class="col-md-2">
      <input type="text" id="rno" name="rno" class="form-control" required="" maxlength="12"  pattern="[A-Za-z0-9]{12}" title="Please enter right enrollment number" maxlength="2">
  </div>
      <label class="col-md-2 control-label" >Name</label>
  <div class="col-md-2">
      <input type="text" id="name" name="name" class="form-control" required="" >
  </div>
      <label class="col-md-2 control-label" >Branch</label>
  <div class="col-md-2">
    <input type="text" id="branch" name="branch" class="form-control" required="" pattern="[A-Za-z]{2}" title="Only alphabets are allowed with max length of 2" maxlength="2"> 
  </div><br><br><br><br>
      <label class="col-md-2 control-label" >Semester</label>
       <div class="col-md-2">
      <input type="text" id="semester" name="semester" class="form-control" pattern="[1-9]{1}" required="" title="Only Integers are allowed "/>
  </div>
      <label class="col-md-2 control-label" >Status</label>
       <div class="col-md-2">
           <input type="text" id="status" name="status" class="form-control" required="" />
  </div>
      <label class="col-md-2 control-label" >Batch</label>
       <div class="col-md-2">
      <select id="batch" name="batch" class="form-control" required="">
      <option value="">Select</option>
      <option value="2010-2014">2010-2014</option>
      <option value="2011-2015">2011-2015</option>
      <option value="2012-2016">2012-2016</option>
      <option value="2013-2017">2013-2017</option>
      <option value="2010-2014">2010-2014</option>
      <option value="2011-2015">2011-2015</option>
      <option value="2012-2016">2012-2016</option>
      <option value="2013-2017">2013-2017</option>
      <option value="2014-2018">2014-2018</option>
      <option value="2015-2019">2015-2019</option>
      <option value="2016-2020">2016-2020</option>
      <option value="2017-2021">2017-2021</option>
      <option value="2018-2022">2018-2022</option>
      <option value="2019-2023">2019-2023</option>
      <option value="2020-2024">2020-2024</option>
      
    </select>
       </div><br><br><br><br>
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
      <label class="col-md-2 control-label" >Total Subjects</label>
       <div class="col-md-2">
      <input type="text" id="sub" name="sub" class="form-control" required=""/>
  </div>
   </div></center>
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
       
	</body>
</html>