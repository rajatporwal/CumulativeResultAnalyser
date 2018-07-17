<%--<%@page import="javax.swing.JFileChooser"%>--%>
<%@page import="java.io.IOException"%>
<%@include  file="checkSession.jsp" %>
<%--@page import="java.net.URL"--%>
<%@page import="java.io.File"%>
<%@page import="dao.*"%>
<%@page import="java.util.regex.*"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.Reader"%>
<%@include file="Headernew.html"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 
    Document   : InsertIntoDb
    Author     : Rajat Porwal
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <form method="post" action="InsertIntoDb.jsp">
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
                 <tr><th><center>S.NO.</center></th><th><center>TYPE</center></th><th><center>FILE</center></th></tr></thead>   
   <%
       try {
     
      HttpSession session=request.getSession();
      String rno=null,branch,status,semester,session1,code;
          int rnofrom,rnoto,count=1,sub;

          rnofrom=Integer.parseInt(request.getParameter("from").toString());
          rnoto=Integer.parseInt(request.getParameter("to").toString());
          semester=request.getParameter("semester");
          branch=request.getParameter("branch");
          session1=request.getParameter("session");
          String jfile=request.getParameter("path");
          sub=Integer.parseInt(request.getParameter("sub").toString());
          code=request.getParameter("code");
          ReadHtml readhtml= new ReadHtml();    
      for (int j = rnofrom; j <=rnoto; j++) 
      {
       int i=30,finalresultgrace=0,finalresultfail=0,casesub=1;
    //*****************Inserting data of HTML file******************
    
       File f =new File( jfile + "/" + j + ".html");
       if(f.exists()) {
       FileReader reader=null;
       reader= new FileReader(jfile +   "/" +j + ".html");
      
      String s1=InsertIntoDb.extractText(reader);
      String[] words=s1.split("\\s");
        
      //****************Name************************
       for ( int k=i ; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("name"))    
       { 
         if(words[i+2].equalsIgnoreCase("Roll"))  
             readhtml.setName(words[i+1]);
         else
           if(words[i+3].equalsIgnoreCase("Roll"))  
         readhtml.setName(words[i+1] + " " + words[i+2] );
         else
             readhtml.setName(words[i+1] + " " + words[i+2] + " " + words[i+3] );  
         
           break;
       }
      }
        //****************Enrollment Number************************
       for (int k=i; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("Roll"))  
       {
          
         rno=words[i+2].substring(0,Math.min(12,words[i+2].length())); 
         readhtml.setRollno(words[i+2].substring(0,Math.min(12,words[i+2].length())));break;
         
       }
      }
     
          //****************Course************************
        for ( int k=i ; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("course"))    
       {    
       readhtml.setCourse(words[i+1]);
           break;
       }
      }
        
         //****************Branch************************  
        for ( i=10 ; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("branch"))    
       {    
       readhtml.setBranch(words[i+1].substring(0,Math.min(2,words[i+1].length())));
           break;
       }
      }
        
        //****************Semester************************   
        for ( int k=i ; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("semester"))    
       {    
       readhtml.setSem(words[i+1].substring(0,Math.min(1,words[i+1].length()))) ;
           break;
       }
      }
        
         //****************Status************************  
       for ( int k=i ; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("status"))    
       {    
       readhtml.setStatus(words[i+1]);
           break;
       }
      }
     
        //****************Subject 1************************
        int subcount=0;
      for (int k=i; i < words.length; i++){
      
       if(words[i].equals("A")||words[i].equals("A+")||words[i].equals("B")||words[i].equals("B+")||words[i].equals("C")||words[i].equals("C+")||words[i].equals("C##")||words[i].equals("D")||words[i].equals("D##")||words[i].equals("D+")||words[i].equals("F")){
          subcount++;      
          if(words[i].equals("C##")||words[i].equals("D##"))
               finalresultgrace=1;
           if(words[i].equals("F"))
               finalresultfail=1;
          switch(casesub)
         {
              case 1:
              {
                  readhtml.setSub1(words[i]);
                  casesub++;
                  break;
              } 
              case 2:
              {
                  readhtml.setSub2(words[i]);
                  casesub++;
                  break;
              } 
              case 3:
              {
                  readhtml.setSub3(words[i]);
                  casesub++;
                  break;
              } 
              case 4:
              {
                  readhtml.setSub4(words[i]);
                  casesub++;
                  break;
              } 
              case 5:
              {
                  readhtml.setSub5(words[i]);
                  casesub++;
                  break;
              } 
              case 6:
              {
                  readhtml.setSub6(words[i]);
                  casesub++;
                  break;
              } 
              case 7:
              {
                  readhtml.setSub7(words[i]);
                  casesub++;
                  break;
              } 
              case 8:
              {
                  readhtml.setSub8(words[i]);
                  casesub++;
                  break;
              } 
              case 9:
              {
                  readhtml.setSub9(words[i]);
                  casesub++;
                  break;
              } 
              case 10:
              {
                  readhtml.setSub10(words[i]);
                  casesub++;
                  break;
              } 
              case 11:
              {
                  readhtml.setSub11(words[i]);
                  casesub++;
                  break;
              } 
              case 12:
              {
                  readhtml.setSub12(words[i]);
                  casesub++;
                  break;
              } 
              case 13:
              {
                  readhtml.setSub13(words[i]);
                  casesub++;
                  break;
              } 
              case 14:
              {
                  readhtml.setSub14(words[i]);
                  casesub++;
                  break;
              } 
              case 15:
              {
                  readhtml.setSub15(words[i]);
                  casesub++;
                  break;
              } 
              case 16:
              {
                  readhtml.setSub16(words[i]);
                  casesub++;
                  break;
              } 
         } 
       }
      }
      //****************Subject Result************************
       
        if(finalresultfail==1) 
        readhtml.setResult("FAIL"); 
        else
        if(finalresultgrace==1) 
        readhtml.setResult("PASS WITH GRACE");
        else       
        readhtml.setResult("PASS"); 
        
        if(subcount!=sub)
        readhtml.setResult("FAIL");     
      //****************Sgpa & Cgpa************************
         for (int k=70; k < words.length-1; k++){
       
       if(words[k].equalsIgnoreCase("sgpa"))    {
            
             for ( i =k; i < words.length; i++) {
                  int len=4;
                  if(Character.isDigit(words[i].charAt(0)))
                if(len==words[i].length())
              {
                readhtml.setSgpa(words[i]);
                readhtml.setCgpa(words[i+1]);  
                break;        
              }
             }
      }
     }
      //*******************Batch*****************************  
          readhtml.setSession(session1);     
          readhtml.setCode(code);     
          
        ReadHtmlDAO readhtmldao = new ReadHtmlDAO();
        
    //*****************Searching Record********************************
    
        if(readhtmldao.checkStudentRecord(rno, branch, semester, session1)){
        if(readhtmldao.updateData(readhtml)){
          %>
          <!--<span  style="float: left;"><strong><h4><b>•Record of file <%=j%> Updated</b></h4></strong></span>-->     
             <tr><td><center><%=count++%></center></td><td><center>Updated <%if(subcount!=sub){%><b>,Please  update manually</b><%}%></center></td><td><center>File <%=j%></center></td></tr>  
          <%
      }
           else{
         %>
       <!--<span  style="float: left;"><strong><h3><b>•Record of file <%=j%> Not Updated</b></h3></strong></span>-->     
         <tr><td><center><b><%=count++%></b></center></td><td><center><b>Not Updated</b></center></td><td><center><b>File <%=j%></b></center></td></tr>  
         <%
             }
        }
        else{
      if(readhtmldao.insertData(readhtml)){
          %>
          <!--<span  style="float: left;"><strong><h4><b>•Record of file <%=j%> Inserted</b></h4></strong></span>-->     
          <tr><td><center><%=count++%></center></td><td><center>Inserted<%if(subcount!=sub){%><b>,Please  update manually</b><%}%></center></td><td><center>File <%=j%></center></td></tr>  
          
          <%
      }
           else{
         %>
       <!--<span  style="float: left;"><strong><h3><b>•Record of file <%=j%> Not Inserted</b></h3></strong></span>-->     
         <tr><td><center><b><%=count++%></b></center></td><td><center><b>Not Inserted</b></center></td><td><center><b>File <%=j%></b></center></td></tr>  
         <%
             }
       }
      }
        else{
//***********************Inserting data of HTM files*****************
       File file =new File(jfile + "/" +j+".htm");
       if(file.exists()) {
       FileReader reader=null;
       reader= new FileReader(jfile +   "/" +j + ".htm");
      
      String s1=InsertIntoDb.extractText(reader);
      String[] words=s1.split("\\s");
        
      //****************Name************************
       for ( int k=i ; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("name"))    
       { 
         if(words[i+2].equalsIgnoreCase("Roll"))  
             readhtml.setName(words[i+1]);
         else
           if(words[i+3].equalsIgnoreCase("Roll"))  
         readhtml.setName(words[i+1] + " " + words[i+2] );
         else
             readhtml.setName(words[i+1] + " " + words[i+2] + " " + words[i+3] );  
         
           break;
      }
   }
        //****************Enrollment Number************************
       for (int k=i; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("Roll"))  
       {
          
         rno=words[i+2].substring(0,Math.min(12,words[i+2].length())); 
         readhtml.setRollno(words[i+2].substring(0,Math.min(12,words[i+2].length())));
         break;
         
       }
      }
     
          //****************Course************************
          readhtml.setCourse("BE");

         //****************Branch************************  
        for ( i=10 ; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("branch"))    
       {    
       readhtml.setBranch(words[i+1].substring(0,Math.min(2,words[i+1].length())));
           break;
       }
      }
        
        //****************Semester************************   
        for ( int k=i ; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("semester"))    
       {    
       readhtml.setSem(words[i+1].substring(0,Math.min(1,words[i+1].length()))) ;
           break;
       }
      }
        
         //****************Status************************  
       for ( int k=i ; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("status"))    
       {    
       readhtml.setStatus(words[i+1]);
           break;
       }
      }
     
        //****************Subject 1************************
        int subcount=0;
      for (int k=i; i < words.length; i++){
      
       if(words[i].equals("A")||words[i].equals("A+")||words[i].equals("B")||words[i].equals("B+")||words[i].equals("C")||words[i].equals("C+")||words[i].equals("C##")||words[i].equals("D")||words[i].equals("D##")||words[i].equals("D+")||words[i].equals("F")){
         subcount++;
          if(words[i].equals("C##")||words[i].equals("D##"))
               finalresultgrace=1;
           if(words[i].equals("F"))
               finalresultfail=1;
          switch(casesub)
         {
              case 1:
              {
                  readhtml.setSub1(words[i]);
                  casesub++;
                  break;
              } 
              case 2:
              {
                  readhtml.setSub2(words[i]);
                  casesub++;
                  break;
              } 
              case 3:
              {
                  readhtml.setSub3(words[i]);
                  casesub++;
                  break;
              } 
              case 4:
              {
                  readhtml.setSub4(words[i]);
                  casesub++;
                  break;
              } 
              case 5:
              {
                  readhtml.setSub5(words[i]);
                  casesub++;
                  break;
              } 
              case 6:
              {
                  readhtml.setSub6(words[i]);
                  casesub++;
                  break;
              } 
              case 7:
              {
                  readhtml.setSub7(words[i]);
                  casesub++;
                  break;
              } 
              case 8:
              {
                  readhtml.setSub8(words[i]);
                  casesub++;
                  break;
              } 
              case 9:
              {
                  readhtml.setSub9(words[i]);
                  casesub++;
                  break;
              } 
              case 10:
              {
                  readhtml.setSub10(words[i]);
                  casesub++;
                  break;
              } 
              case 11:
              {
                  readhtml.setSub11(words[i]);
                  casesub++;
                  break;
              } 
              case 12:
              {
                  readhtml.setSub12(words[i]);
                  casesub++;
                  break;
              } 
              case 13:
              {
                  readhtml.setSub13(words[i]);
                  casesub++;
                  break;
              } 
              case 14:
              {
                  readhtml.setSub14(words[i]);
                  casesub++;
                  break;
              } 
              case 15:
              {
                  readhtml.setSub15(words[i]);
                  casesub++;
                  break;
              } 
              case 16:
              {
                  readhtml.setSub16(words[i]);
                  casesub++;
                  break;
              } 
         } 
       }
      }
      
     //****************Result************************
        if(finalresultfail==1) 
        readhtml.setResult("FAIL"); 
        else
        if(finalresultgrace==1) 
        readhtml.setResult("PASS WITH GRACE");
        else       
        readhtml.setResult("PASS"); 
        if(subcount!=sub)
        readhtml.setResult("FAIL");  
        
            
      //****************Sgpa & Cgpa************************
          for (int k=70; k < words.length-1; k++)
      {
       
       if(words[k].equalsIgnoreCase("sgpa"))    
        {
            
             for ( i =k; i < words.length; i++) {
                  int len=4;
                  if(Character.isDigit(words[i].charAt(0)))
                if(len==words[i].length())
              {
                readhtml.setSgpa(words[i]);
                readhtml.setCgpa(words[i+1]);  
                break;        
              }
             }
           }
     }
      //*******************Batch*****************************  
          readhtml.setSession(session1);    
          readhtml.setCode(code);     
          
        ReadHtmlDAO readhtmldao = new ReadHtmlDAO();
        
    //*****************Searching Record********************************
    
        if(readhtmldao.checkStudentRecord(rno, branch, semester, session1)){
        if(readhtmldao.updateData(readhtml)){
          %>
          <!--<span  style="float: left;"><strong><h4><b>•Record of file <%=j%> Updated</b></h4></strong></span>-->     
          <tr><td><center><%=count++%></center></td><td><center>Updated<%if(subcount!=sub){%><b>,Please  update manually</b><%}%></center></td><td><center>File <%=j%></center></td></tr>  
          <%
      }
           else{
         %>
       <!--<span  style="float: left;"><strong><h3><b>•Record of file <%=j%> Not Updated</b></h3></strong></span>-->     
         <tr><td><center><b><%=count++%></b></center></td><td><center><b>Not Updated</b></center></td><td><center><b>File <%=j%></b></center></td></tr>  
         <%
             }
        }
        else{
      if(readhtmldao.insertData(readhtml)){
          %>
          <!--<span  style="float: left;"><strong><h4><b>•Record of file <%=j%> Inserted</b></h4></strong></span>-->  
          <tr><td><center><%=count++%></center></td><td><center>Inserted<%if(subcount!=sub){%><b>,Please  update manually</b><%}%></center></td><td><center>File <%=j%></center></td></tr>  
          <%
      }
           else{
         %>
       <!--<span  style="float: left;"><strong><h3><b>•Record of file <%=j%> Not Inserted</b></h3></strong></span>-->     
         <tr><td><center><b><%=count++%></b></center></td><td><center><b>Not Inserted</b></center></td><td><center><b>File <%=j%></b></center></td></tr>  
         <%
             }
       }
      }
          else{
         %>
       <!--<span  style="float: left;"><strong><h2><b>•Record of file <%=j%> Not Found</b></h2></strong></span>-->     
         <tr><td><center><b><%=count++%></b></center></td><td><center><b>Not Found</b></center></td><td><center><b>File <%=j%></b></center></td></tr>  
         <%
             }
     }
    }
  }
       catch (IOException e) {
             
    %>
    <br><br><br><br><br><br><br><br>
       <span  style="float: center;"><strong><h2><b>•<%="File not found,please try again"%> </b></h2></strong></span> 
    
       <%     
           out.println("<script type=\"text/javascript\">");
           out.println("alert('File not found,please try again');");
              //out.println("location='EnterPreDetails.jsp';");
              out.println("</script>");
           }
       catch (StringIndexOutOfBoundsException e) {
          out.println(e);       
    %>
    <br><br><br><br><br><br><br><br>
       <span  style="float: center;"><strong><h2><b>•<%="Please check the supporting files,and try again later"%> </b></h2></strong></span> 
    
       <%     
           out.println("<script type=\"text/javascript\">");
           out.println("alert('File not found,please try again');");
              //out.println("location='EnterPreDetails.jsp';");
              out.println("</script>");
           }
       catch (Exception e) {
             
    %>
    <br><br><br><br><br><br><br><br>
       <span  style="float: center;"><strong><h2><b>•<%="Make sure the details you entered are correct and try again"%> </b></h2></strong></span> 
       <span  style="float: center;"><strong><h2><b>•<%="Error : Duplicate Entry Found "%> </b></h2></strong></span> 
    
       <%     
              out.println(e);
              out.println("<script type=\"text/javascript\">");
              out.println("alert('Record not inserted, try again');");
              //out.println("location='EnterPreDetails.jsp';");
              out.println("</script>");
           }
   %>
        </table> </div> 
     </div> 
       </div>     
        </form>
    </body>
</html>
