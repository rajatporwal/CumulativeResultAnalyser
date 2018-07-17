<%@page import="java.text.DecimalFormat"%>
<%@include  file="checkSession.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.ReadHtml"%>
<%@page import="dao.ReadHtmlDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 
    Document   : SearchResultAnalysisData
    Author     : Rajat Porwal
--%>
<!DOCTYPE html>
<html>
    <head>
         <script type="text/javascript" src="F:\RAJAT\Softy\java\BootStrap/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/popup-box.css" rel="stylesheet" type="text/css" media="all" />

<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<link rel="stylesheet" 	href="css/chocolat.css" type="text/css" media="all">
<!--// css -->
<!-- font -->
<link href='//fonts.googleapis.com/css?family=Josefin+Sans:400,100,100italic,300,300italic,400italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!-- //font -->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
  <script src="http://cdn.oesmith.co.uk/morris-0.4.1.min.js"></script>
  
  <script type="text/javascript" src="js\morris-0.4.1.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <style type="text/css">
@media print {
    #printbtn {
        display :  none;
    }
}
</style>
    </head>
    
    <%-- 
    Document   : SearchResultAnalysisData
    Author     : Rajat Porwal
    --%>
    <body>
        
         <form method="post" action="GeneratePDF.jsp">
        <%
            try {
                 
           HttpSession session=request.getSession();
           String branch=session.getAttribute("branch").toString();
           String semester=session.getAttribute("semester").toString();
           String top=session.getAttribute("top").toString();
           String department=request.getParameter("department");
           String code=request.getParameter("code");
           String year=request.getParameter("year");
//           String rfrom=request.getParameter("rfrom");
//           String rto=request.getParameter("rto");
           String type=session.getAttribute("type").toString();
           String batch=session.getAttribute("batch").toString();
      
           
           
        %>
      
        <div class="span7">   
<div class="widget stacked widget-table action-table">
				<div class="widget-header">
                                    <br><br>					
                                    <h3><strong>Resut Analysis Of <%=department%></strong></h3><br>
    <%
       if(type.equals("class")){                                
    %>
    <h4><strong> <%=year + " year" + "  "%><%=batch + " Batch"%><%="  (" + code + ")"%></strong></h4>
    <%
      }   
   else
    {
    %>
    <h4><strong> <%=year + " year" + "  "%><%=batch + " Batch"%><%="  (" + branch + ")"%></strong></h4>
   <%
     }
   %>				</div> <!-- /widget-header -->
                                <br><br>		
				<div class="widget-content">
                                    <center>
					<table class="table table-striped table-bordered">
            <!--***************************Table Header********************************-->                                           
						<thead>
							<tr>
                                                            <th><center>S.no.</center></th>
                                                                <th><center>Enrollment No.Name</center></th>
								<th><center>Name</center></th>
								<th><center>Branch</center></th>
								<th><center>Semester</center></th>
								<th><center>SGPA</center></th>
								<th><center>CGPA</center></th>
								<!--<th class="td-actions"></th>-->
							</tr>
						</thead>
						
          
     
        <%
           session.setAttribute("department",department);
//           session.setAttribute("year",year);
//           session.setAttribute("classnew",classnew);
//           session.setAttribute("rfrom",rfrom);
//           if(type.equalsIgnoreCase("class"))
//           {
//           session.setAttribute("rto",rto);
//           session.setAttribute("type",type);
//           }

          ReadHtmlDAO rd = new ReadHtmlDAO();
          List <ReadHtml>myresultlist= new ArrayList<ReadHtml>();
          if(type.equalsIgnoreCase("branch"))
          myresultlist=rd.searchSemesterToppers(branch,semester,top,batch);
          else
          myresultlist=rd.searchClassToppers(branch,semester,top,code,batch);    
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
       </div> 
  <%
          int subcount=Integer.parseInt(session.getAttribute("theorysub").toString());
      
          String sub1,sub2,sub3,sub4,sub5,sub6,sub7,sub8,c1,c2;
          sub1=request.getParameter("sub1");
          sub2=request.getParameter("sub2");
          sub3=request.getParameter("sub3");
          sub4=request.getParameter("sub4");
          sub5=request.getParameter("sub5");
          sub6=request.getParameter("sub6");
          sub7=request.getParameter("sub7");
          sub8=request.getParameter("sub8");
          c1=request.getParameter("c1");
          c2=request.getParameter("c2");
          String hod=request.getParameter("hod").toString();
          ReadHtml r= new ReadHtml();
          if(type.equalsIgnoreCase("branch"))
          r=rd.searchStudent_appear_pass(branch, semester, batch);
          else
          r=rd.searchClassStudent_appear_pass(branch,semester,code,batch);
          ReadHtml r1= new ReadHtml();
          if(type.equalsIgnoreCase("branch"))
          r1=rd.searchStudent_Hons_I_Div(branch, semester, batch);
          else
          r1=rd.searchClassStudent_Hons_I_Div(branch, semester,code,batch);
          DecimalFormat df = new DecimalFormat();
          df.setMaximumFractionDigits(2);
          int total=Integer.parseInt(r.getRollno());
          int pass=Integer.parseInt(r.getName());
          int hons=Integer.parseInt(r1.getRollno());
          int idiv=Integer.parseInt(r1.getName());
          int iidiv=total-idiv;
          float percentage=((pass*100.0f))/total;
          idiv=idiv-hons;
          session.setAttribute("total", total);
          session.setAttribute("pass", pass);
          session.setAttribute("hons", hons);
          session.setAttribute("idiv", idiv);
          session.setAttribute("iidiv", iidiv);
          session.setAttribute("percentage", percentage);
  %>
    <br><br><Br><br>
  <span  style="float: center;"><strong><h3><b>• Pass percentage<%="\t "%>=<%="\t "%><%=df.format(percentage)%>%</b></h3></strong></span><br>
  <span  style="float: center;"><strong><h3><b>• Total Students Appearing=<%="\t"%><%=total%></b></h3></strong></span><br>
  <span  style="float: center;"><strong><h3><b>• No. of students pass=<%="\t"%><%=pass%></b></h3></strong></span><br>
  <span  style="float: center;"><strong><h3><b>• No. of student passed with Hons.=<%="\t"%><%=hons%></b></h3></strong></span><br>
  <span  style="float: center;"><strong><h3><b>• No. of students passed in I Div.=<%="\t"%><%=idiv%></b></h3></strong></span><br>
  <span  style="float: center;"><strong><h3><b>• No. of students passed in II Div.=<%="\t"%><%=iidiv%></b></h3></strong></span><br>
    
  <br><br><br><br>
  <%          

          ReadHtmlDAO rd1 = new ReadHtmlDAO();
          List <ReadHtml>sublist= new ArrayList<ReadHtml>();
           if(type.equalsIgnoreCase("branch"))
           sublist=rd.searchAvg_Subjects(branch,semester,batch);
           else
           sublist=rd.searchClassAvg_Subjects(branch,semester,code,batch);
          float aa1=0,aa=0,bb1=0,bb=0,cc1=0,cc=0,dd=0;
          float graphsub1=0,graphsub2=0,graphsub3=0,graphsub4=0,graphsub5=0,graphsub6=0;
          float graphfail1=0,graphfail2=0,graphfail3=0,graphfail4=0,graphfail5=0,graphfail6=0;
          String ss1=null,ss2=null,ss3=null,ss4=null,ss5=null,ss6=null ;
          if(sublist!=null)
          {
          int count=1;
          for(ReadHtml sub : sublist)
          {
               ss1=sub.getSub1();
               ss2=sub.getSub2();
               ss3=sub.getSub3();
               ss4=sub.getSub4();
               ss5=sub.getSub5();
               ss6=sub.getSub6();
      //**************************sub1*************************************
              if(ss1.equalsIgnoreCase("A+"))
              {  
                  graphsub1=graphsub1+10;
              }
              else
              if(ss1.equalsIgnoreCase("A"))
              {
                  graphsub1=graphsub1+9;
              }
              else
              if(ss1.equalsIgnoreCase("B+"))
              {
                  graphsub1=graphsub1+8;
              }
              else
              if(ss1.equalsIgnoreCase("B"))
              {
                  graphsub1=graphsub1+7;
              }
              else
              if(ss1.equalsIgnoreCase("C+"))
              {
                  graphsub1=graphsub1+6;
              }
              else
              if(ss1.equalsIgnoreCase("C##"))
              {
                  graphsub1=graphsub1+5;
              }
              else
              if(ss1.equalsIgnoreCase("C"))
              {
                  graphsub1=graphsub1+5;
              }
              else
              if(ss1.equalsIgnoreCase("D"))
              {
                  graphsub1=graphsub1+4;
              }
              else
              if(ss1.equalsIgnoreCase("D##"))
              {
                  graphsub1=graphsub1+3;
              }    
              else
              if(ss1.equalsIgnoreCase("F"))
              {
                  graphfail1=graphfail1+1;
              }    
         //**************************sub2*************************************
              if(ss2.equalsIgnoreCase("A+"))
              {  
                  graphsub2=graphsub2+10;
              }
              else
              if(ss2.equalsIgnoreCase("A"))
              {
                  graphsub2=graphsub2+9;
              }
              else
              if(ss2.equalsIgnoreCase("B+"))
              {
                  graphsub2=graphsub2+8;
              }
              else
              if(ss2.equalsIgnoreCase("B"))
              {
                  graphsub2=graphsub2+7;
              }
              else
              if(ss2.equalsIgnoreCase("C+"))
              {
                  graphsub2=graphsub2+6;
              }
              else
              if(ss2.equalsIgnoreCase("C##"))
              {
                  graphsub2=graphsub2+5;
              }
              else
              if(ss2.equalsIgnoreCase("C"))
              {
                  graphsub2=graphsub2+5;
              }
              else
              if(ss2.equalsIgnoreCase("D"))
              {
                  graphsub2=graphsub2+4;
              }
              else
              if(ss2.equalsIgnoreCase("D##"))
              {
                  graphsub2=graphsub2+3;
              }
              else
              if(ss2.equalsIgnoreCase("F"))
              {
                  graphfail2=graphfail2+1;
              } 
              //**************************sub3*************************************
              if(ss3.equalsIgnoreCase("A+"))
              {  
                  graphsub3=graphsub3+10;
              }
              else
              if(ss3.equalsIgnoreCase("A"))
              {
                  graphsub3=graphsub3+9;
              }
              else
              if(ss3.equalsIgnoreCase("B+"))
              {
                  graphsub3=graphsub3+8;
              }
              else
              if(ss3.equalsIgnoreCase("B"))
              {
                  graphsub3=graphsub3+7;
              }
              else
              if(ss3.equalsIgnoreCase("C+"))
              {
                  graphsub3=graphsub3+6;
              }
              else
              if(ss3.equalsIgnoreCase("C##"))
              {
                  graphsub3=graphsub3+5;
              }
              else
              if(ss3.equalsIgnoreCase("C"))
              {
                  graphsub3=graphsub3+5;
              }
              else
              if(ss3.equalsIgnoreCase("D"))
              {
                  graphsub3=graphsub3+4;
              }
              else
              if(ss3.equalsIgnoreCase("D##"))
              {
                  graphsub3=graphsub3+3;
              }
              else
              if(ss3.equalsIgnoreCase("F"))
              {
                  graphfail3=graphfail3+1;
              } 
              //**************************sub4*************************************
              if(ss4.equalsIgnoreCase("A+"))
              {  
                  graphsub4=graphsub4+10;
              }
              else
              if(ss4.equalsIgnoreCase("A"))
              {
                  graphsub4=graphsub4+9;
              }
              else
              if(ss4.equalsIgnoreCase("B+"))
              {
                  graphsub4=graphsub4+8;
              }
              else
              if(ss4.equalsIgnoreCase("B"))
              {
                  graphsub4=graphsub4+7;
              }
              else
              if(ss4.equalsIgnoreCase("C+"))
              {
                  graphsub4=graphsub4+6;
              }
              else
              if(ss4.equalsIgnoreCase("C##"))
              {
                  graphsub4=graphsub4+5;
              }
              else
              if(ss4.equalsIgnoreCase("C"))
              {
                  graphsub4=graphsub4+5;
              }
              else
              if(ss4.equalsIgnoreCase("D"))
              {
                  graphsub4=graphsub4+4;
              }
              else
              if(ss4.equalsIgnoreCase("D##"))
              {
                  graphsub4=graphsub4+3;
              }
              else
              if(ss4.equalsIgnoreCase("F"))
              {
                  graphfail4=graphfail4+1;
              } 
              //**************************sub5*************************************
              if(ss5.equalsIgnoreCase("A+"))
              {  
                  graphsub5=graphsub5+10;
              }
              else
              if(ss5.equalsIgnoreCase("A"))
              {
                  graphsub5=graphsub5+9;
              }
              else
              if(ss5.equalsIgnoreCase("B+"))
              {
                  graphsub5=graphsub5+8;
              }
              else
              if(ss5.equalsIgnoreCase("B"))
              {
                  graphsub5=graphsub5+7;
              }
              else
              if(ss5.equalsIgnoreCase("C+"))
              {
                  graphsub5=graphsub5+6;
              }
              else
              if(ss5.equalsIgnoreCase("C##"))
              {
                  graphsub5=graphsub5+5;
              }
              else
              if(ss5.equalsIgnoreCase("C"))
              {
                  graphsub5=graphsub5+5;
              }
              else
              if(ss5.equalsIgnoreCase("D"))
              {
                  graphsub5=graphsub5+4;
              }
              else
              if(ss5.equalsIgnoreCase("D##"))
              {
                  graphsub5=graphsub5+3;
              }
              else
              if(ss5.equalsIgnoreCase("F"))
              {
                  graphfail5=graphfail5+1;
              } 
              //**************************sub6*************************************
              if(ss6.equalsIgnoreCase("A+"))
              {  
                  graphsub6=graphsub6+10;
              }
              else
              if(ss6.equalsIgnoreCase("A"))
              {
                  graphsub6=graphsub6+9;
              }
              else
              if(ss6.equalsIgnoreCase("B+"))
              {
                  graphsub6=graphsub6+8;
              }
              else
              if(ss6.equalsIgnoreCase("B"))
              {
                  graphsub6=graphsub6+7;
              }
              else
              if(ss6.equalsIgnoreCase("C+"))
              {
                  graphsub6=graphsub6+6;
              }
              else
              if(ss6.equalsIgnoreCase("C##"))
              {
                  graphsub6=graphsub6+5;
              }
              else
              if(ss6.equalsIgnoreCase("C"))
              {
                  graphsub6=graphsub6+5;
              }
              else
              if(ss6.equalsIgnoreCase("D"))
              {
                  graphsub6=graphsub6+4;
              }
              else
              if(ss6.equalsIgnoreCase("D##"))
              {
                  graphsub6=graphsub6+3;
              }
              else
              if(ss6.equalsIgnoreCase("F"))
              {
                  graphfail6=graphfail6+1;
              } 
          }
         }
           graphsub1=((graphsub1)/total)*10;
           graphsub2=((graphsub2)/total)*10;
           graphsub3=((graphsub3)/total)*10;
           graphsub4=((graphsub4)/total)*10;
           graphsub5=((graphsub5)/total)*10;
           graphsub6=((graphsub6)/total)*10;
           
           graphfail1=((total-graphfail1)/total)*100;
           graphfail2=((total-graphfail2)/total)*100;
           graphfail3=((total-graphfail3)/total)*100;
           graphfail4=((total-graphfail4)/total)*100;
           graphfail5=((total-graphfail5)/total)*100;
           graphfail6=((total-graphfail6)/total)*100;
           
           int l1=(int)graphsub1;
           int l2=(int)graphsub2;
           int l3=(int)graphsub3;
           int l4=(int)graphsub4;
           int l5=(int)graphsub5;
           int l6=(int)graphsub6;
           
//           out.println(df.format(graphfail1));
//           out.println(df.format(graphfail2));
//           out.println(df.format(graphfail3));
//           out.println(df.format(graphfail4));
//           out.println(df.format(graphfail5));
//           out.println(df.format(graphfail6));
      switch(subcount){
          
      case 4:{
      
  %>
  <div id="bar-example"></div>
<script id="jsbin-javascript">

Morris.Bar({
  element: 'bar-example',
  data: [
//    { y: '<%=sub1 + " " + l1 + " %" %>', a: <%=l1%>,b: <%=df.format(graphfail1)%>},
    { y: '<%=sub1 %>', a: <%=l1%>,b: <%=df.format(graphfail1)%>},
    { y: '<%=sub2 %>', a: <%=l2%>,b: <%=df.format(graphfail2)%>},
    { y: '<%=sub3 %>', a: <%=l3%>,b: <%=df.format(graphfail3)%>},
    { y: '<%=sub4 %>', a: <%=l4%>,b: <%=df.format(graphfail4)%>}
  ],
  xkey: 'y',
  ymax: 100,
  ykeys: ['a', 'b'],
   hideHover: "always",
  labels: ['Series A', 'Series B']
});
</script>

<% break;
   }

    case 5:{
      
  %>
  <div id="bar-example"></div>
<script id="jsbin-javascript">

Morris.Bar({
  element: 'bar-example',
  data: [
    { y: '<%=sub1 + " " + l1 +" %" + graphfail1 +" %" %>', a: <%=l1%>,b: <%=df.format(graphfail1)%>},  
    { y: '<%=sub2 + " " + l2 +" %" + graphfail2 +" %" %>', a: <%=l1%>,b: <%=df.format(graphfail1)%>},  
    { y: '<%=sub3 + " " + l3 +" %" + graphfail3 +" %" %>', a: <%=l1%>,b: <%=df.format(graphfail1)%>},  
    { y: '<%=sub4 + " " + l4 +" %" + graphfail4 +" %" %>', a: <%=l1%>,b: <%=df.format(graphfail1)%>},  
    { y: '<%=sub5 + " " + l5 +" %" + graphfail5 +" %" %>', a: <%=l1%>,b: <%=df.format(graphfail1)%>},  
//    { y: '<%=sub1 %>', a: <%=l1%>,b: <%=df.format(graphfail1)%>},
//    { y: '<%=sub2 %>', a: <%=l2%>,b: <%=df.format(graphfail2)%>},
//    { y: '<%=sub3 %>', a: <%=l3%>,b: <%=df.format(graphfail3)%>},
//    { y: '<%=sub4 %>', a: <%=l4%>,b: <%=df.format(graphfail4)%>},
//    { y: '<%=sub5 %>', a: <%=l5%>,b: <%=df.format(graphfail5)%>}
  ],
  xkey: 'y',
  ymax: 100,
  ykeys: ['a', 'b'],
  hideHover: "always",
  labels: ['Series A', 'Series B']
});
</script>
<% break;
   }
    
   case 6:{
      
  %>
  <div id="bar-example"></div>
<script id="jsbin-javascript">

Morris.Bar({
  element: 'bar-example',
  data: [
    { y: '<%=sub1 %>', a: <%=l1%>,b: <%=df.format(graphfail1)%>},
    { y: '<%=sub2 %>', a: <%=l2%>,b: <%=df.format(graphfail2)%>},
    { y: '<%=sub3 %>', a: <%=l3%>,b: <%=df.format(graphfail3)%>},
    { y: '<%=sub4 %>', a: <%=l4%>,b: <%=df.format(graphfail4)%>},
    { y: '<%=sub5 %>', a: <%=l5%>,b: <%=df.format(graphfail5)%>},
    { y: '<%=sub6 %>', a: <%=l6%>,b: <%=df.format(graphfail6)%>}
  ],
  xkey: 'y',
  ymax: 100,
  ykeys: ['a', 'b'],
  hideHover: "always",
  labels: ['Series A', 'Series B']
});
</script>

<% break;
   }
 }
 %>
<span  style="float: center;"><strong><h2><b> <%="(a)Average % marks in each subject"%><br><br><%="(b)Pass % in each subject "%></b></h2></strong></span>
<br><br><br>
<span  style="float: left;"><strong><h3><b> <%="•" + c1%></b></h3></strong></span><span  style="float: right;"><strong><h3><b>• <%=hod%><%=" " + " " %></b></h3></strong></span><br><br>
<span  style="float: left;"><strong><h3><b> <%="•" + c2%></b></h3></strong></span><br><br>
<span  style="float: left;"><strong><h3><b>Class Coordinators</b></h3></strong></span><span  style="float: right;"><strong><h3><b>H.O.D.</b></h3></strong></span><br>
  
<%
   }
         catch (ArithmeticException e) 
      {
         out.println("<script type=\"text/javascript\">");
              out.println("alert('Record Not Found');");
              out.println("</script>");
              %>
       
              <br><br><br><br><br><br><br><br>
       <span  style="float: center;"><strong><h2><b>•<%="Record Not Found"%> </b></h2></strong></span> 
       
     <% 
        }
        
        catch (Exception e) 
      {
out.println(e);
         out.println("<script type=\"text/javascript\">");
              out.println("alert('Something Went Wrong , please try again after sometime');");
              out.println("</script>");
              %>
       
              <br><br><br><br><br><br><br><br>
       <span  style="float: center;"><strong><h2><b>•<%="Something Went Wrong , please try again after sometime"%> </b></h2></strong></span> 
       
     <% 
        }
     %>
     <br><br>
     <center>
  <!--<input id ="printbtn" type="button" value="Generate PDF" class="btn btn-primary btn-lg btn3d" onclick="window.print();" >-->
     </center>
     </form>
     <div class="footer-w3l">
     <p> <b><h1>Result Analysis Data</h1></b></p>
	</div>
    </body>
</html>
