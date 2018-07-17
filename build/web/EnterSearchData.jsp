<%@include  file="checkSession.jsp" %>
<%@page import="java.sql.Date"%>
<%@include file="Headernew.html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head> 
		<meta name="viewport" content="width=device-width, initial-scale=1">

  <%-- 
    Document   : EnterSearchData
    Author     : Rajat Porwal
   --%>
		<!-- Website CSS style -->
		 <link rel="stylesheet" href="js/bootstrap.min.css" />
       <link rel="stylesheet" href="js/awesome.min.css" />
       <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src ="js/Bootstrap.min.js"> </script>
	
	</head>
	<body>
     
		<div class="container">
                    <h1 class="well"><center>Enter Details For Searching Class Record</center></h1>
	<div class="col-lg-12 well" >
	<div class="row">
                 <form method="post" action="EnterSubjectCode.jsp">
                                   
                                        <div class="form-group">
                                          <center>   
      <label class="col-md-2 control-label" >Branch</label>
  <div class="col-md-2">
      <input type="text" id="branch" name="branch" class="form-control" required="" pattern="[A-Za-z]{2}" title="Only alphabets are allowed with max length of 2" maxlength="2"> 
  </div>
      <!--<strong>Ex : CS</strong><br><br>-->
      <label class="col-md-2 control-label" >Semester</label>
  <div class="col-md-2">
      <input type="text" id="semester" name="semester" class="form-control" required="" pattern="[1-8]"  required title="Only Integers Are Allowed" maxlength="1"> 
  </div>
      <label class="col-md-2 control-label" >Batch</label>
       <div class="col-md-2">
      <select id="batch" name="batch" class="form-control" required="">
      <option value="">Select</option>
      <option value="roll">By Roll No</option>
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
  </div>
      <!--<strong>Ex : 5</strong>-->
      <br><br><br>
      <label class="col-md-2 control-label" >Enrollment No From</label> 
  <div class="col-md-2">
      <input type="text" name="rollfrom" id="rollfrom" class="form-control"   minlength="12" maxlength="12"> 
  </div>
      <!--<strong>Ex : (0808CS141120)</strong>-->
  <!--<br><br>-->
      <label class="col-md-2 control-label" >Enrollment No To</label> 
  <div class="col-md-2">
      <input type="text" name="rollto" id="rollto" class="form-control"  minlength="12" maxlength="12">  
  </div>
      <!--<strong>Ex : (0808CS141120)</strong>-->
      <br><br><br>
      <label class="col-md-2 control-label" >Theory Subjects</label> 
  <div class="col-md-2">
      <input type="text" name="tsub" id="tsub" class="form-control" required="" pattern="[0-9]{1}"  required title="Only Integers Are Allowed" maxlength="1">  
  </div>
      <!--<strong>(Theory Subjects)</strong>-->
      <!--<br><br><br>-->
      <label class="col-md-2 control-label" >Practical Subjects</label> 
  <div class="col-md-2">
      <input type="text" name="psub"  id="psub" class="form-control" required="" pattern="[0-9]{1}" required title="Only Integers Are Allowed" maxlength="1">  
  </div>
      <!--<strong>(Practical Subjects)</strong>-->
                                    </center>
      
                                        </div></center>
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