<%@include  file="checkSession.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.ReadHtml"%>
<%@page import="dao.ReadHtmlDAO"%>
<%@include file="Headernew.html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 
    Document   : SearchClassRecord
    Author     : Rajat Porwal
--%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    </head>
    <body>
        <%
            try {
                
 
            HttpSession session=request.getSession();
            String branch,status,semester,sub1,sub2,sub3,sub4,sub5,sub6,sub7,
                  sub8,sub9,sub10,sub11,sub12,sub13,sub14,sub15,sub16;
            String yearexcel =request.getParameter("yearexcel") ;
            String semexcel =request.getParameter("semexcel") ;
           branch=session.getAttribute("searchbranch").toString();
           semester=session.getAttribute("searchsemester").toString();
          // rollfrom=session.getAttribute("searchrollfrom").toString();
           //rollto=session.getAttribute("searchrollto").toString();
           String tsub=session.getAttribute("searchtheorysubjects").toString();
           String psub=session.getAttribute("searchpracticalsubjects").toString();
           String batch=session.getAttribute("batch").toString();
           String code=request.getParameter("code");
           session.setAttribute("batch", batch);
           session.setAttribute("code", code);
           session.setAttribute("yearexcel", yearexcel);
           session.setAttribute("semexcel", semexcel);

           String type=session.getAttribute("type").toString();
           int theorysubjects=Integer.parseInt(tsub);
           int practicalsubjects=Integer.parseInt(psub);
           String department=request.getParameter("department");
           session.setAttribute("department", department);
           session.setAttribute("type", type);
           sub1=request.getParameter("sub1").toUpperCase() ;
           sub2=request.getParameter("sub2").toUpperCase() ;
           sub3=request.getParameter("sub3").toUpperCase() ;
           sub4=request.getParameter("sub4").toUpperCase() ;
           sub5=request.getParameter("sub5").toUpperCase() ;
           sub6=request.getParameter("sub6").toUpperCase() ;
           sub7=request.getParameter("sub7");
           if(sub7!=null)       
           sub7=sub7.toUpperCase();
           sub8=request.getParameter("sub8");
           if(sub8!=null)       
           sub8=sub8.toUpperCase();
           sub9=request.getParameter("sub9");
           if(sub9!=null)       
           sub9=sub9.toUpperCase();
           sub10=request.getParameter("sub10");
           if(sub10!=null)       
           sub10=sub10.toUpperCase();
           sub11=request.getParameter("sub11");
           if(sub11!=null)       
           sub11=sub11.toUpperCase();
           sub12=request.getParameter("sub12");
           if(sub12!=null)       
           sub12=sub12.toUpperCase();
           sub13=request.getParameter("sub13");
           if(sub13!=null)       
           sub13=sub13.toUpperCase();
           sub14=request.getParameter("sub14");
           if(sub14!=null)       
           sub14=sub14.toUpperCase();    
           sub15=request.getParameter("sub15");
           if(sub15!=null)       
           sub15=sub15.toUpperCase();
           sub16=request.getParameter("sub16");
           if(sub16!=null)       
           sub16=sub16.toUpperCase();
        
        //*****************Managing session*******************8   
           session.setAttribute("sub1", sub1);
           session.setAttribute("sub2", sub2);
           session.setAttribute("sub3", sub3);
           session.setAttribute("sub4", sub4);
           session.setAttribute("sub5", sub5);
           session.setAttribute("sub6", sub6);
           session.setAttribute("sub7", sub7);
           session.setAttribute("sub8", sub8);
           session.setAttribute("sub9", sub9);
           session.setAttribute("sub10", sub10);
           session.setAttribute("sub11", sub11);
           session.setAttribute("sub12", sub12);
           session.setAttribute("sub13", sub13);
           session.setAttribute("sub14", sub14);
           session.setAttribute("sub15", sub15);
           session.setAttribute("sub16", sub16);
        %>
        <form method ="post" action="GenerateExcel.jsp">
            <center>
       <div class="span7">   
<div class="widget stacked widget-table action-table">
    <br><br>
				<div class="widget-header">
					<i class="icon-th-list"></i>
                                        <h3><strong>Class Record</strong></h3>
                                </div> <!-- /widget-header --><br><br>
				
				<div class="widget-content">
                                    <center>
					<table class="table table-striped table-bordered">
             <thead>
    <tr><th><center>S.NO.</center></th><th><center>ROLL NO</center></th><th><center>Name</center></th><th><center>BRANCH</center></th><th><center>SEM</center></th><th><center>STATUS</center></th>
        <th><center><%=sub1%></center></th><th><center><%=sub2%></center></th><th><center><%=sub3%></center></th><th><center><%=sub4%></center></th><th><center><%=sub5%></center></th><th><center><%=sub6%></center></th><th><center><%=sub7%></center></th> 
        <%if(sub8!=null){%><th><center><%=sub8%></center></th><%}if(sub9!=null){%><th><center><%=sub9%></center></th><%}if(sub10!=null){%><th><center><%=sub10%></center></th>
        <%}if(sub11!=null){%><th><center><%=sub11%></center></th><%}if(sub12!=null){%><th><center><%=sub12%><%}%></center></th><%if(sub13!=null){%><th><center><%=sub13%></center></th><%}%>
        <%if(sub14!=null){%><th><center><%=sub14%></center></th><%}%><%if(sub15!=null){%><th><center><%=sub15%></center></th><%}%><%if(sub16!=null){%><th><center><%=sub16%></center></th><%}%>
        <th><center>SGPA</center></th><th><center>CGPA</center></th><th><center>Result</center></th></tr></thead>
   <%
      ReadHtmlDAO  rd = new ReadHtmlDAO();
        List <ReadHtml>myresultlist= new ArrayList<ReadHtml>();
//        if(batch.equals("roll"))
//        myresultlist = rd.searchAllStudent(branch,semester,rollfrom,rollto);
//        else
        if(type.equals("class"))
        myresultlist = rd.searchCodeStudent(branch,semester,code,batch);
        else
        myresultlist = rd.searchAllStudentBatch(branch,semester,batch); 
        int count=1;
        switch(theorysubjects + practicalsubjects)
        {
           case 7:  { 
     for(ReadHtml R: myresultlist)
     {
         
    %>  
     <tr>
     <td><center><%=count++%></center></td>
     <td><center><%=R.getRollno()%></center></td>
     <td><center><%=R.getName()%></center></td>
     <td><center><%=R.getBranch()%></center></td>
     <td><center><%=R.getSem()%></center></td>
     <td><center><%=R.getStatus()%></center></td>
     <td><center><%=R.getSub1()%></center></td>
     <td><center><%=R.getSub2()%></center></td>
     <td><center><%=R.getSub3()%></center></td>
     <td><center><%=R.getSub4()%></center></td>
     <td><center><%=R.getSub5()%></center></td>
     <td><center><%=R.getSub6()%></center></td>
     <td><center><%=R.getSub7()%></center></td>
     <td><center><%=R.getSgpa()%></center></td>
     <td><center><%=R.getCgpa()%></center></td>
     <td><center><%=R.getResult()%></center></td>
     </tr>
     <%
         }break;
       }
           case 8:{
     
     for(ReadHtml R: myresultlist)
     {
         
    %>  
     <tr>
      <td><center><%=count++%></center></td>
     <td><center><%=R.getRollno()%></center></td>
     <td><center><%=R.getName()%></center></td>
     <td><center><%=R.getBranch()%></center></td>
     <td><center><%=R.getSem()%></center></td>
     <td><center><%=R.getStatus()%></center></td>
     <td><center><%=R.getSub1()%></center></td>
     <td><center><%=R.getSub2()%></center></td>
     <td><center><%=R.getSub3()%></center></td>
     <td><center><%=R.getSub4()%></center></td>
     <td><center><%=R.getSub5()%></center></td>
     <td><center><%=R.getSub6()%></center></td>
     <td><center><%=R.getSub7()%></center></td>
     <td><center><%=R.getSub8()%></center></td>
     <td><center><%=R.getSgpa()%></center></td>
     <td><center><%=R.getCgpa()%></center></td>
      <td><center><%=R.getResult()%></center></td>
     </tr>
     
     <%
         }break;
       }
           case 9:{
     for(ReadHtml R: myresultlist)
     {
         
    %>  
     <tr>
     <td><center><%=count++%></center></td>
     <td><center><%=R.getRollno()%></center></td>
     <td><center><%=R.getName()%></center></td>
     <td><center><%=R.getBranch()%></center></td>
     <td><center><%=R.getSem()%></center></td>
     <td><center><%=R.getStatus()%></center></td>
     <td><center><%=R.getSub1()%></center></td>
     <td><center><%=R.getSub2()%></center></td>
     <td><center><%=R.getSub3()%></center></td>
     <td><center><%=R.getSub4()%></center></td>
     <td><center><%=R.getSub5()%></center></td>
     <td><center><%=R.getSub6()%></center></td>
     <td><center><%=R.getSub7()%></center></td>
     <td><center><%=R.getSub8()%></center></td>
     <td><center><%=R.getSub9()%></center></td>
     <td><center><%=R.getSgpa()%></center></td>
     <td><center><%=R.getCgpa()%></center></td>
     <td><center><%=R.getResult()%></center></td>
     </tr>
     <%
         }break;
      }
           case 10:{    
     for(ReadHtml R: myresultlist)
     {
         
    %>  
     <tr>
     <td><center><%=count++%></center></td>
     <td><center><%=R.getRollno()%></center></td>
     <td><center><%=R.getName()%></center></td>
     <td><center><%=R.getBranch()%></center></td>
     <td><center><%=R.getSem()%></center></td>
     <td><center><%=R.getStatus()%></center></td>
     <td><center><%=R.getSub1()%></center></td>
     <td><center><%=R.getSub2()%></center></td>
     <td><center><%=R.getSub3()%></center></td>
     <td><center><%=R.getSub4()%></center></td>
     <td><center><%=R.getSub5()%></center></td>
     <td><center><%=R.getSub6()%></center></td>
     <td><center><%=R.getSub7()%></center></td>
     <td><center><%=R.getSub8()%></center></td>
     <td><center><%=R.getSub9()%></center></td>
     <td><center><%=R.getSub10()%></center></td>
     <td><center><%=R.getSgpa()%></center></td>
     <td><center><%=R.getCgpa()%></center></td>
     <td><center><%=R.getResult()%></center></td>
     </tr>
     <%
         }break;
        } 
           case 11:{    
     for(ReadHtml R: myresultlist)
     {
         
    %>  
    <tbody>
     <tr>
     <td><center><%=count++%></center></td>    
     <td><center><%=R.getRollno()%></center></td>
     <td><center><%=R.getName()%></center></td>
     <td><center><%=R.getBranch()%></center></td>
     <td><center><%=R.getSem()%></center></td>
     <td><center><%=R.getStatus()%></center></td>
     <td><center><%=R.getSub1()%></center></td>
     <td><center><%=R.getSub2()%></center></td>
     <td><center><%=R.getSub3()%></center></td>
     <td><center><%=R.getSub4()%></center></td>
     <td><center><%=R.getSub5()%></center></td>
     <td><center><%=R.getSub6()%></center></td>
     <td><center><%=R.getSub7()%></center></td>
     <td><center><%=R.getSub8()%></center></td>
     <td><center><%=R.getSub9()%></center></td>
     <td><center><%=R.getSub10()%></center></td>
     <td><center><%=R.getSub11()%></center></td>
     
     <td><center><%=R.getSgpa()%></center></td>
     <td><center><%=R.getCgpa()%></center></td>
     <td><center><%=R.getResult()%></center></td>
     </tr>
    </tbody>
     <%
         }break;
        }
           case 12:{    
     for(ReadHtml R: myresultlist)
     {
         
    %>  
     <tr>
     <td><center><%=count++%></center></td>    
     <td><center><%=R.getRollno()%></center></td>
     <td><center><%=R.getName()%></center></td>
     <td><center><%=R.getBranch()%></center></td>
     <td><center><%=R.getSem()%></center></td>
     <td><center><%=R.getStatus()%></center></td>
     <td><center><%=R.getSub1()%></center></td>
     <td><center><%=R.getSub2()%></center></td>
     <td><center><%=R.getSub3()%></center></td>
     <td><center><%=R.getSub4()%></center></td>
     <td><center><%=R.getSub5()%></center></td>
     <td><center><%=R.getSub6()%></center></td>
     <td><center><%=R.getSub7()%></center></td>
     <td><center><%=R.getSub8()%></center></td>
     <td><center><%=R.getSub9()%></center></td>
     <td><center><%=R.getSub10()%></center></td>
     <td><center><%=R.getSub11()%></center></td>
     <td><center><%=R.getSub12()%></center></td>
     <td><center><%=R.getSgpa()%></center></td>
     <td><center><%=R.getCgpa()%></center></td>
     <td><center><%=R.getResult()%></center></td>
     </tr>
     <%
         }break;
            }
      case 13:{    
     for(ReadHtml R: myresultlist)
     {
         
    %>  
     <tr>
     <td><center><%=count++%></center></td>    
     <td><center><%=R.getRollno()%></center></td>
     <td><center><%=R.getName()%></center></td>
     <td><center><%=R.getBranch()%></center></td>
     <td><center><%=R.getSem()%></center></td>
     <td><center><%=R.getStatus()%></center></td>
     <td><center><%=R.getSub1()%></center></td>
     <td><center><%=R.getSub2()%></center></td>
     <td><center><%=R.getSub3()%></center></td>
     <td><center><%=R.getSub4()%></center></td>
     <td><center><%=R.getSub5()%></center></td>
     <td><center><%=R.getSub6()%></center></td>
     <td><center><%=R.getSub7()%></center></td>
     <td><center><%=R.getSub8()%></center></td>
     <td><center><%=R.getSub9()%></center></td>
     <td><center><%=R.getSub10()%></center></td>
     <td><center><%=R.getSub11()%></center></td>
     <td><center><%=R.getSub12()%></center></td>
     <td><center><%=R.getSub13()%></center></td>
     <td><center><%=R.getSgpa()%></center></td>
     <td><center><%=R.getCgpa()%></center></td>
      <td><center><%=R.getResult()%></center></td>
     </tr>
     <%
         }break;
        }
           case 14:{
     for(ReadHtml R: myresultlist)
     {
         
    %>  
     <tr>
     <td><center><%=count++%></center></td>    
     <td><center><%=R.getRollno()%></center></td>
     <td><center><%=R.getName()%></center></td>
     <td><center><%=R.getBranch()%></center></td>
     <td><center><%=R.getSem()%></center></td>
     <td><center><%=R.getStatus()%></center></td>
     <td><center><%=R.getSub1()%></center></td>
     <td><center><%=R.getSub2()%></center></td>
     <td><center><%=R.getSub3()%></center></td>
     <td><center><%=R.getSub4()%></center></td>
     <td><center><%=R.getSub5()%></center></td>
     <td><center><%=R.getSub6()%></center></td>
     <td><center><%=R.getSub7()%></center></td>
     <td><center><%=R.getSub8()%></center></td>
     <td><center><%=R.getSub9()%></center></td>
     <td><center><%=R.getSub10()%></center></td>
     <td><center><%=R.getSub11()%></center></td>
     <td><center><%=R.getSub12()%></center></td>
     <td><center><%=R.getSub13()%></center></td>
     <td><center><%=R.getSub14()%></center></td>
     <td><center><%=R.getSgpa()%></center></td>
     <td><center><%=R.getCgpa()%></center></td>
     <td><center><%=R.getResult()%></center></td>
     </tr>
     <%
         }break;
       }
           case 15:{    
     for(ReadHtml R: myresultlist)
     {
         
    %>  
     <tr>
     <td><center><%=count++%></center></td>    
     <td><center><%=R.getRollno()%></center></td>
     <td><center><%=R.getName()%></center></td>
     <td><center><%=R.getBranch()%></center></td>
     <td><center><%=R.getSem()%></center></td>
     <td><center><%=R.getStatus()%></center></td>
     <td><center><%=R.getSub1()%></center></td>
     <td><center><%=R.getSub2()%></center></td>
     <td><center><%=R.getSub3()%></center></td>
     <td><center><%=R.getSub4()%></center></td>
     <td><center><%=R.getSub5()%></center></td>
     <td><center><%=R.getSub6()%></center></td>
     <td><center><%=R.getSub7()%></center></td>
     <td><center><%=R.getSub8()%></center></td>
     <td><center><%=R.getSub9()%></center></td>
     <td><center><%=R.getSub10()%></center></td>
     <td><center><%=R.getSub11()%></center></td>
     <td><center><%=R.getSub12()%></center></td>
     <td><center><%=R.getSub13()%></center></td>
     <td><center><%=R.getSub14()%></center></td>
     <td><center><%=R.getSub15()%></center></td>
     <td><center><%=R.getSgpa()%></center></td>
     <td><center><%=R.getCgpa()%></center></td>
      <td><center><%=R.getResult()%></center></td>
     </tr>
     <%
         }break;
       }
       case 16:{    
     for(ReadHtml R: myresultlist)
     {
         
    %>  
     <tr>
     <td><center><%=count++%></center></td>    
     <td><center><%=R.getRollno()%></center></td>
     <td><center><%=R.getName()%></center></td>
     <td><center><%=R.getBranch()%></center></td>
     <td><center><%=R.getSem()%></center></td>
     <td><center><%=R.getStatus()%></center></td>
     <td><center><%=R.getSub1()%></center></td>
     <td><center><%=R.getSub2()%></center></td>
     <td><center><%=R.getSub3()%></center></td>
     <td><center><%=R.getSub4()%></center></td>
     <td><center><%=R.getSub5()%></center></td>
     <td><center><%=R.getSub6()%></center></td>
     <td><center><%=R.getSub7()%></center></td>
     <td><center><%=R.getSub8()%></center></td>
     <td><center><%=R.getSub9()%></center></td>
     <td><center><%=R.getSub10()%></center></td>
     <td><center><%=R.getSub11()%></center></td>
     <td><center><%=R.getSub12()%></center></td>
     <td><center><%=R.getSub13()%></center></td>
     <td><center><%=R.getSub14()%></center></td>
     <td><center><%=R.getSub15()%></center></td>
     <td><center><%=R.getSub16()%></center></td>
     <td><center><%=R.getSgpa()%></center></td>
     <td><center><%=R.getCgpa()%></center></td>
     <td><center><%=R.getResult()%></center></td>
     </tr>
     <%
        }break;
       }
     } 
       
       } catch (Exception e) {
                            out.println(e);
               out.println("<script type=\"text/javascript\">");
              out.println("alert('Something went wrong , please try again after later');");
              out.println("</script>");
              %>
               <br><br><br><br><br><br><br><br>
       <span  style="float: center;"><strong><h2><b>•<%="Please choose minimum 7 number of subjects, "%> </b></h2></strong></span> 
       <br><span  style="float: center;"><strong><h2><b><%="and Try Again"%><br><br> </b></h2></strong></span> 
      <%      
        }
      %>
    
     </table> </div> 
     </div> 
       </div> 
     <br><center>
      <button id="submit1" value="submit" name="submit1"  class="btn btn-primary">Generate ExcelSheet</button>

      </center>
        </form><br><br>
    <div class="footer-w3l">
     <p> <b><h3>Class Record</h3></b></p>
	</div>
    </body>
</html>
